#ifndef AIFES_APP_H
#define AIFES_APP_H

#include <stdint.h>

/* Call once, after the CubeMX peripheral init (MX_USART2_UART_Init). Never returns on failure. */
void aifes_app_init(void);

/* Call from the main while(1): serves exactly one image (blocks until an image arrives). */
void aifes_app_step(void);

/* Index of the maximum of output_data[10]. */
uint8_t get_predicted_label(const float *output_data);

/* Duration of the last forward pass in ms (watch it in the debugger / Live Expressions). */
extern volatile uint32_t aifes_last_inference_ms;


/* Debug counters, watch them in Live Expressions. */
extern volatile uint32_t aifes_dbg_loops, aifes_dbg_rx_bytes, aifes_dbg_sync_acks,
                         aifes_dbg_images, aifes_dbg_uart_err, aifes_dbg_init_ok;
extern volatile uint8_t  aifes_dbg_last_byte;

#endif
