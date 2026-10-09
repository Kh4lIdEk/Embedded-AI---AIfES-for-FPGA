/******************************************************************************
 * aifes_app.c - AIfES MNIST inference on STM32 (HAL, blocking UART)
 *
 * Protocol = the one of the existing Python script (unchanged):
 *   1. SYNC  PC -> MCU : 0xAB (repeated every second until answered)
 *            MCU -> PC : 0xCD
 *   2. IMAGE PC -> MCU : 784 x float32 little-endian (3136 bytes, one write())
 *   3. REPLY MCU -> PC : 10 bytes, round(softmax_k * 255) as uint8
 *
 * v2 changes (debug-friendly):
 *   - UART handle selectable with ONE macro block (AIFES_UART_HANDLE), compile error if missing.
 *   - Overrun flag is cleared ONLY when it is set (on STM32F4/F2/F1 the unconditional clear reads DR
 *     and silently eats a pending byte, e.g. the 0xAB).
 *   - Live counters (watch them in STM32CubeIDE "Live Expressions") to see exactly where it stops:
 *       aifes_dbg_loops      : number of aifes_app_step() calls          (0  -> step() never called)
 *       aifes_dbg_rx_bytes   : first bytes received from the PC          (0  -> UART link/handle/port)
 *       aifes_dbg_last_byte  : last first-byte received                  (!=0xAB -> baud/clock/parity)
 *       aifes_dbg_sync_acks  : number of 0xCD sent
 *       aifes_dbg_images     : number of images processed
 *       aifes_dbg_uart_err   : HAL error code of the UART at last error
 *   - Optional LED toggle on every sync request (define AIFES_LED_TOGGLE()).
 ******************************************************************************/
#include "aifes_app.h"
#include "main.h"                  /* HAL of your MCU family + Error_Handler() */
#include <string.h>
#include "aifes_f32_fnn.h"

/* ---- 1) UART handle: MUST be the UART wired to the ST-LINK virtual COM port ----
 * Nucleo-64 : USART2 (huart2)   Nucleo-144 : USART3 (huart3)   Discovery: see board manual   */
extern UART_HandleTypeDef huart2;
#define AIFES_UART_HANDLE       huart2
#define AIFES_UART              (&AIFES_UART_HANDLE)

/* ---- 2) Optional: LED blinking on each sync request (define in your project settings or here) ----
 * Example Nucleo-144: #define AIFES_LED_TOGGLE()  HAL_GPIO_TogglePin(LD1_GPIO_Port, LD1_Pin)   */
#ifndef AIFES_LED_TOGGLE
#define AIFES_LED_TOGGLE()      do {} while (0)
#endif

#ifndef SYNC_REQ_BYTE
#define SYNC_REQ_BYTE           0xAB
#endif
#ifndef SYNC_ACK_BYTE
#define SYNC_ACK_BYTE           0xCD
#endif
/* #define SYNC_SEND_EXTRA_BYTE 0xEF */
#ifndef SYNC_GAP_MS
#define SYNC_GAP_MS             20U
#endif
#ifndef RX_TIMEOUT_MS
#define RX_TIMEOUT_MS           2000U
#endif
#define TX_TIMEOUT_MS           1000U

#define IMG_VALUES              784U
#define IMG_BYTES               (IMG_VALUES * sizeof(float))   /* 3136 */
#define NUM_CLASSES             10U

static float    input_data[IMG_VALUES];
static float    output_data[NUM_CLASSES];
static uint16_t in_shape[]  = {1, 784};
static uint16_t out_shape[] = {1, 10};

volatile uint32_t aifes_last_inference_ms = 0;
volatile uint32_t aifes_dbg_loops     = 0;
volatile uint32_t aifes_dbg_rx_bytes  = 0;
volatile uint8_t  aifes_dbg_last_byte = 0;
volatile uint32_t aifes_dbg_sync_acks = 0;
volatile uint32_t aifes_dbg_images    = 0;
volatile uint32_t aifes_dbg_uart_err  = 0;
volatile uint32_t aifes_dbg_init_ok   = 0;   /* 1 once create_model() succeeded */

/* ===================== UART (HAL-specific) ===================== */

/* Clear overrun/framing/noise ONLY if flagged (never touches DR otherwise). */
static void uart_clear_errors(void)
{
    if (__HAL_UART_GET_FLAG(AIFES_UART, UART_FLAG_ORE) ||
        __HAL_UART_GET_FLAG(AIFES_UART, UART_FLAG_FE)  ||
        __HAL_UART_GET_FLAG(AIFES_UART, UART_FLAG_NE))
    {
        aifes_dbg_uart_err = HAL_UART_GetError(AIFES_UART);
        __HAL_UART_CLEAR_OREFLAG(AIFES_UART);
        __HAL_UART_CLEAR_FEFLAG(AIFES_UART);
        __HAL_UART_CLEAR_NEFLAG(AIFES_UART);
    }
}

static void uart_send_sync_ack(void)
{
#ifdef SYNC_SEND_EXTRA_BYTE
    uint8_t ack[2] = { SYNC_ACK_BYTE, SYNC_SEND_EXTRA_BYTE };
    HAL_UART_Transmit(AIFES_UART, ack, 2, TX_TIMEOUT_MS);
#else
    uint8_t ack = SYNC_ACK_BYTE;
    HAL_UART_Transmit(AIFES_UART, &ack, 1, TX_TIMEOUT_MS);
#endif
    aifes_dbg_sync_acks++;
    AIFES_LED_TOGGLE();
}

static void uart_send_probabilities(const float *probs)
{
    uint8_t q[NUM_CLASSES];
    for (uint32_t i = 0; i < NUM_CLASSES; i++)
    {
        float v = probs[i] * 255.0f + 0.5f;
        q[i] = (uint8_t)(v < 0.0f ? 0.0f : (v > 255.0f ? 255.0f : v));
    }
    HAL_UART_Transmit(AIFES_UART, q, NUM_CLASSES, TX_TIMEOUT_MS);
}

/* Returns 1 when a full image is in dst, 0 otherwise (sync answered / noise dropped). */
static int uart_receive_message(float *dst)
{
    uint8_t *p = (uint8_t *) dst;
    uint8_t b0, b1;

    uart_clear_errors();

    if (HAL_UART_Receive(AIFES_UART, &b0, 1, HAL_MAX_DELAY) != HAL_OK) return 0;
    aifes_dbg_rx_bytes++;
    aifes_dbg_last_byte = b0;

    if (HAL_UART_Receive(AIFES_UART, &b1, 1, SYNC_GAP_MS) != HAL_OK)
    {
        if (b0 == SYNC_REQ_BYTE) uart_send_sync_ack();      /* isolated byte = sync request */
        return 0;
    }

    p[0] = b0;
    p[1] = b1;
    if (HAL_UART_Receive(AIFES_UART, &p[2], (uint16_t)(IMG_BYTES - 2), RX_TIMEOUT_MS) != HAL_OK)
    {
        uart_clear_errors();                                /* truncated image: drop it */
        return 0;
    }
    return 1;
}

/* ======================== AIfES ======================== */

uint8_t get_predicted_label(const float *out)
{
    uint8_t best = 0;
    for (uint8_t i = 1; i < NUM_CLASSES; i++)
        if (out[i] > out[best]) best = i;
    return best;
}

void aifes_app_init(void)
{
    if (aifes_f32_fnn_create_model() == 1)
    {
        Error_Handler();   /* if you land here: weights file != 784-128-64-10, see README */
    }
    aifes_dbg_init_ok = 1;
}

void aifes_app_step(void)
{
    aifes_dbg_loops++;
    if (!uart_receive_message(input_data)) return;

    uint32_t t0 = HAL_GetTick();
    aifes_f32_fnn_inference((float *) input_data, in_shape, (float *) output_data, out_shape);
    aifes_last_inference_ms = HAL_GetTick() - t0;

    uart_send_probabilities(output_data);
    aifes_dbg_images++;
}
