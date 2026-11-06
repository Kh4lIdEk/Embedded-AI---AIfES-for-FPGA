/******************************************************************************
 * main.c - AIfES MNIST (FNN f32) inference on the ZedBoard ARM (Zynq PS),
 *          bare-metal Vitis, polled XUartPs, driven by the PC Python script.
 *
 *   PC (Python) --UART--> ARM : sync, then 784 x float32 per image
 *   ARM --UART--> PC (Python) : prediction (format selectable, see REPLY_MODE)
 *
 * No RTOS, no malloc, no printf on the protocol UART.
 *
 * ============================ PROTOCOL (edit here) ===========================
 *   1. Python sends SYNC_BYTE (0xAB), possibly several times, until it reads
 *      SYNC_REPLY (0xCD).  The ARM answers 0xCD once, after flushing duplicates.
 *   2. Per image: Python sends 784 float32, little-endian ('<f4'), already
 *      normalised exactly as in training, row-major 28x28 = 3136 bytes,
 *      no header, no checksum.
 *   3. The ARM replies according to REPLY_MODE, then waits for the next image.
 *   If your script re-syncs before EVERY image, set SYNC_EACH_IMAGE to 1.
 * ============================================================================
 ******************************************************************************/
#include <stdint.h>
#include "xparameters.h"
#include "xuartps.h"

/* AIfES model (your 784-128-64-10 files). This header DEFINES objects and
 * functions (model, layers, create_model, inference): include it in this one
 * .c file only.                                                              */
#include "aifes_f32_fnn.h"

/* ------------------------------ Configuration ------------------------------ */
/* Index of the UART in the Vitis BSP = order among the UARTs ENABLED in Vivado
 * (only UART0 enabled -> 0). If you enable both, UART0 = 0 and UART1 = 1.      */
#define APP_UART_INDEX        0
#define APP_BAUDRATE          115200U

/* 1 = Vitis 2023.2 or newer (lookup by base address)
 * 0 = Vitis 2023.1 or older (lookup by DEVICE_ID)                              */
#define USE_BASEADDR_LOOKUP   1

#define SYNC_BYTE             0xABu
#define SYNC_REPLY            0xCDu
#define SYNC_EACH_IMAGE       0       /* 0: sync once at start, 1: before every image */

/* 0 = 10 bytes: softmax probabilities scaled to uint8 (p*255) -> Python argmax
 * 1 = 1 byte : predicted label 0..9
 * 2 = 10 bytes: one-hot (1 at the predicted index, 0 elsewhere)               */
#define REPLY_MODE            0

#define IMG_VALUES            784U
#define IMG_BYTES             (IMG_VALUES * sizeof(float))   /* 3136 */
#define NUM_CLASSES           10U
#define RX_INTERBYTE_MS       1000U   /* max gap between 2 bytes inside an image */

/* ARM-side debug text (xil_printf). Keep 0 unless the BSP stdout is ANOTHER
 * UART than the protocol one, otherwise it corrupts the binary protocol.      */
/* Signature of aifes_f32_fnn_inference() in YOUR aifes_f32_fnn.h:
 * 0 = aifes_f32_fnn_inference(input, output)                   (your 784-128-64-10 header)
 * 1 = aifes_f32_fnn_inference(input, in_shape, output, out_shape) (header of the zip)  */
#define AIFES_INFER_WITH_SHAPES  0

#define APP_DEBUG             0
#if APP_DEBUG
  #include "xil_printf.h"
  #define DBG(...)            xil_printf(__VA_ARGS__)
#else
  #define DBG(...)            do { } while (0)
#endif

/* --------------------------- Static buffers / state ------------------------- */
static float    input_data[IMG_VALUES];
static float    output_data[NUM_CLASSES];
#if AIFES_INFER_WITH_SHAPES
static uint16_t in_shape[]  = {1, 784};
static uint16_t out_shape[] = {1, 10};
#endif

/* Visible in the debugger (Live Expressions / Variables). */
volatile uint32_t g_status          = 0;  /* 1 uart ok, 2 model ok, 3 synced, 4 serving */
volatile uint32_t g_images_done     = 0;
volatile uint32_t g_last_infer_us   = 0;
volatile uint32_t g_rx_timeouts     = 0;
volatile uint32_t g_last_label      = 0;

static XUartPs  Uart;
static UINTPTR  uart_base;

/* ============================== Timer (no xtime_l.h) =========================
 * Cortex-A9 Global Timer of the Zynq PS (fixed address 0xF8F00200), 64-bit,
 * counts at PERIPHCLK = CPU clock / 2 = 333.33 MHz with the default ZedBoard
 * clocking (CPU 666.67 MHz). Only used for the RX timeout, the 5 ms delay and
 * the inference-time statistic. Adjust APP_TIMER_HZ if you changed the CPU clock. */
#ifndef APP_TIMER_HZ
#define APP_TIMER_HZ          333333333ULL
#endif
#ifndef APP_TICKS_NOW
#define GT_BASE               0xF8F00200UL
static void timer_init(void)
{
    volatile uint32_t *gt = (volatile uint32_t *) GT_BASE;
    gt[2] |= 1u;                              /* control register: timer enable */
}
static uint64_t timer_ticks(void)
{
    volatile uint32_t *gt = (volatile uint32_t *) GT_BASE;
    uint32_t hi, lo, hi2;
    do { hi = gt[1]; lo = gt[0]; hi2 = gt[1]; } while (hi != hi2);
    return ((uint64_t) hi << 32) | lo;
}
#define APP_TICKS_NOW()       timer_ticks()
#define APP_TIMER_INIT()      timer_init()
#else
#define APP_TIMER_INIT()      do { } while (0)
#endif
#define TICKS_PER_MS          (APP_TIMER_HZ / 1000ULL)

/* ================================ UART helpers ============================== */

static int uart_init(void)
{
    XUartPs_Config *cfg;
#if APP_UART_INDEX == 0
  #ifdef XPAR_XUARTPS_0_BASEADDR
    #define UART_BASE_  XPAR_XUARTPS_0_BASEADDR
  #else
    #define UART_BASE_  0xE0000000UL          /* PS UART0 (fixed on Zynq-7000) */
  #endif
    #define UART_ID_    XPAR_XUARTPS_0_DEVICE_ID
#else
  #ifdef XPAR_XUARTPS_1_BASEADDR
    #define UART_BASE_  XPAR_XUARTPS_1_BASEADDR
  #else
    #define UART_BASE_  0xE0001000UL          /* PS UART1 (fixed on Zynq-7000) */
  #endif
    #define UART_ID_    XPAR_XUARTPS_1_DEVICE_ID
#endif

#if USE_BASEADDR_LOOKUP
    cfg = XUartPs_LookupConfig(UART_BASE_);
#else
    cfg = XUartPs_LookupConfig(UART_ID_);
#endif
    if (cfg == NULL) return -1;
    if (XUartPs_CfgInitialize(&Uart, cfg, cfg->BaseAddress) != XST_SUCCESS) return -1;
    if (XUartPs_SetBaudRate(&Uart, APP_BAUDRATE) != XST_SUCCESS) return -1;   /* 8N1 by default */
    uart_base = cfg->BaseAddress;
    return 0;
}

static inline int uart_rx_ready(void) { return XUartPs_IsReceiveData(uart_base); }

static void uart_send(const uint8_t *buf, uint32_t n)
{
    for (uint32_t i = 0; i < n; i++) XUartPs_SendByte(uart_base, buf[i]);   /* blocking */
    while (XUartPs_IsSending(&Uart)) { }                                    /* wait until shifted out */
}

static void uart_discard_rx(void)
{
    while (uart_rx_ready()) (void) XUartPs_RecvByte(uart_base);
}

/* Reads exactly n bytes. The wait for the FIRST byte is unbounded; after it,
 * each following byte must arrive within RX_INTERBYTE_MS. Returns 0 on success,
 * -1 on timeout (partial data dropped).                                       */
static int uart_read_exact(uint8_t *dst, uint32_t n)
{
    const uint64_t gap = TICKS_PER_MS * RX_INTERBYTE_MS;
    uint64_t t_last;

    while (!uart_rx_ready()) { }              /* blocking wait for the image start */
    t_last = APP_TICKS_NOW();

    while (n > 0)
    {
        if (uart_rx_ready())
        {
            *dst++ = XUartPs_RecvByte(uart_base);
            n--;
            t_last = APP_TICKS_NOW();
        }
        else
        {
            if ((APP_TICKS_NOW() - t_last) > gap) return -1;
        }
    }
    return 0;
}

static void delay_ms(uint32_t ms)
{
    const uint64_t t0 = APP_TICKS_NOW();
    while ((APP_TICKS_NOW() - t0) < TICKS_PER_MS * ms) { }
}

/* ================================== Protocol ================================ */

/* Blocks until SYNC_BYTE is seen, flushes duplicate sync bytes (Python resends
 * until it gets an answer), then replies SYNC_REPLY. Python only sends image
 * data AFTER receiving the reply, so flushing before the reply is safe.       */
static void protocol_sync(void)
{
    uint8_t b;
    for (;;)
    {
        while (!uart_rx_ready()) { }
        b = XUartPs_RecvByte(uart_base);
        if (b == SYNC_BYTE) break;            /* anything else is noise: ignore */
    }
    delay_ms(5);                              /* let in-flight duplicates arrive */
    uart_discard_rx();

    const uint8_t r = SYNC_REPLY;
    uart_send(&r, 1);
}

static void protocol_send_prediction(uint8_t label, const float *probs)
{
#if REPLY_MODE == 1
    (void) probs;
    uart_send(&label, 1);
#elif REPLY_MODE == 2
    (void) probs;
    uint8_t q[NUM_CLASSES] = {0};
    q[label] = 1;
    uart_send(q, NUM_CLASSES);
#else
    (void) label;
    uint8_t q[NUM_CLASSES];
    for (uint32_t i = 0; i < NUM_CLASSES; i++)
    {
        float v = probs[i] * 255.0f + 0.5f;
        q[i] = (uint8_t)(v < 0.0f ? 0.0f : (v > 255.0f ? 255.0f : v));
    }
    uart_send(q, NUM_CLASSES);
#endif
}

/* ================================== AIfES =================================== */

/* Index of the maximum of the 10 outputs. */
static uint8_t get_predicted_label(const float *out)
{
    uint8_t best = 0;
    for (uint8_t i = 1; i < NUM_CLASSES; i++)
        if (out[i] > out[best]) best = i;
    return best;
}

/* ==================================== main ================================== */

int main(void)
{
    if (uart_init() != 0)
    {
        DBG("UART init failed\r\n");
        for (;;) { }                          /* g_status stays 0 */
    }
    APP_TIMER_INIT();
    g_status = 1;

    /* Builds the AIfES model; weights stay in .rodata (DDR), workspace is static. */
    if (aifes_f32_fnn_create_model() != 0)
    {
        DBG("AIfES create_model failed (weights/workspace size)\r\n");
        for (;;) { }                          /* g_status stays 1 */
    }
    g_status = 2;

    protocol_sync();          /* ignores noise, flushes duplicate sync bytes */
    g_status = 3;
    DBG("synced\r\n");

    for (;;)
    {
#if SYNC_EACH_IMAGE
        protocol_sync();
#endif
        if (uart_read_exact((uint8_t *) input_data, (uint32_t) IMG_BYTES) != 0)
        {
            g_rx_timeouts++;                  /* incomplete image: drop it */
            uart_discard_rx();
            continue;
        }
        g_status = 4;

        const uint64_t t0 = APP_TICKS_NOW();
#if AIFES_INFER_WITH_SHAPES
        aifes_f32_fnn_inference(input_data, in_shape, output_data, out_shape);
#else
        aifes_f32_fnn_inference(input_data, output_data);
#endif
        const uint64_t t1 = APP_TICKS_NOW();
        g_last_infer_us = (uint32_t)(((t1 - t0) * 1000000ULL) / APP_TIMER_HZ);

        uint8_t label = get_predicted_label(output_data);
        g_last_label = label;
        protocol_send_prediction(label, output_data);
        g_images_done++;
    }
    return 0;
}