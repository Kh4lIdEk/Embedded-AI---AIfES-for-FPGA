#ifndef HW_DENSE_H
#define HW_DENSE_H
/* ----------------------------------------------------------------------------
 * hw_dense : ARM-side driver of the dense_mac_axi accelerator (PL) for AIfES.
 *
 * Offloads the dot products of aimath_f32_default_linear() to the PL:
 *      y[j] = sum_k x[k] * W[k][j]      (bias added here, on the ARM)
 * ReLU / Softmax / argmax stay in software (AIfES).
 * ---------------------------------------------------------------------------- */
#include <stdint.h>

#ifdef __cplusplus
extern "C" {
#endif

struct aitensor;   /* full definition comes from AIfES (aifes.h) */

/* Base addresses taken from AIfES_Accel/.../design_1.bd (Address Editor):
 *   /dense_mac_axi_0/s_axi/reg0 -> 0x40000000 (4K)
 *   /axi_dma_0/S_AXI_LITE/Reg   -> 0x40400000 (64K)
 * Re-check them if you rebuild the Block Design.                               */
#ifndef HW_DENSE_BASE
#define HW_DENSE_BASE 0x40000000UL
#endif
#ifndef HW_DMA_BASE
#define HW_DMA_BASE   0x40400000UL
#endif

#define HW_MAX_K 1024     /* must match MAX_K of the RTL */
#define HW_MAX_M 256      /* must match MAX_M of the RTL */

/* Layers with fewer multiply-accumulates than this stay in software.
 * 0 = every dense layer goes to the PL (use this for the first validation).
 * After measuring, 4096 would keep the tiny 64x10 layer on the ARM.            */
#ifndef HW_MIN_MACS
#define HW_MIN_MACS 0u
#endif

/* Debug variables (Vitis "Expressions" window) */
extern volatile uint32_t g_hw_calls;        /* dense layers computed in the PL     */
extern volatile uint32_t g_hw_fallbacks;    /* dense layers computed in software   */
extern volatile uint32_t g_hw_cycles_last;  /* PL clock cycles of the last layer   */
extern volatile int32_t  g_hw_last_err;     /* 0 ok, -3..-6 see hw_run()           */
extern volatile int32_t  g_hw_selftest;     /* 0 pass, 1 fail, -1 not run          */

int hw_dense_init(void);       /* resets the DMA and enables the PL path         */
int hw_dense_selftest(void);   /* known-answer test; disables the PL if it fails */

/* Same arguments as aimath_f32_default_linear().
 * Returns 0 if the PL computed the result, non-zero if the caller must run the
 * software loop.                                                                */
int hw_dense_linear_f32(const struct aitensor *a, const struct aitensor *b,
                        const struct aitensor *c, struct aitensor *result);

#ifdef __cplusplus
}
#endif
#endif
