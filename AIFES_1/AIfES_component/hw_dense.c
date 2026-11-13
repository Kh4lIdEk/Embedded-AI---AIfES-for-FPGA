#include "hw_dense.h"
#include <string.h>
#include <math.h>
#include "xil_io.h"
#include "xil_cache.h"
#include "xil_types.h"
#undef TRUE            /* avoid the TRUE/FALSE redefinition warning with AIfES */
#undef FALSE
#include <aifes.h>

/* ---- dense_mac_axi registers ---- */
#define R_CTRL    0x00
#define R_STATUS  0x04
#define R_K       0x08
#define R_M       0x0C
#define R_CYC     0x10
#define R_RES     0x800
#define ST_DONE   0x2u
#define ST_ERR    0x4u

/* ---- AXI DMA, simple mode, MM2S channel ---- */
#define DMA_CR       0x00
#define DMA_SR       0x04
#define DMA_SA       0x18
#define DMA_LEN      0x28
#define DMA_CR_RS    0x1u
#define DMA_CR_RESET 0x4u
#define DMA_SR_ERR   0x70u     /* DMAIntErr | DMASlvErr | DMADecErr */
#define DMA_SR_IOC   0x1000u

#define HW_TIMEOUT 20000000u

volatile uint32_t g_hw_calls = 0, g_hw_fallbacks = 0, g_hw_cycles_last = 0;
volatile int32_t  g_hw_last_err = 0, g_hw_selftest = -1;

static int g_enabled = 0;

/* ---- cache of transposed weights (static pool, no malloc) ----
 * AIfES stores W as [K][M]; the PL needs the weights of one output neuron
 * contiguous, i.e. Wt[j][K]. The transposition is done once per layer, on its
 * first use, and flushed to DDR so that the DMA (not cache-coherent on HP0)
 * reads the right data.                                                       */
#define HW_POOL_FLOATS 120000u   /* 784*128 + 128*64 + 64*10 = 109184 floats */
#define HW_TAB_SIZE    8
static float g_pool[HW_POOL_FLOATS] __attribute__((aligned(64)));
static uint32_t g_pool_used = 0;
typedef struct { const void *src; uint32_t K, M; float *wt; } wt_entry_t;
static wt_entry_t g_tab[HW_TAB_SIZE];
static int g_tab_n = 0;

static float *get_wt(const float *w, uint32_t K, uint32_t M)
{
    int i;
    uint32_t j, k, n = K * M;
    float *wt;

    for (i = 0; i < g_tab_n; i++)
        if (g_tab[i].src == (const void *)w && g_tab[i].K == K && g_tab[i].M == M)
            return g_tab[i].wt;

    if (g_tab_n >= HW_TAB_SIZE || g_pool_used + n > HW_POOL_FLOATS) return 0;
    wt = &g_pool[g_pool_used];
    g_pool_used += (n + 15u) & ~15u;                 /* keep 64-byte alignment */
    for (k = 0; k < K; k++)
        for (j = 0; j < M; j++)
            wt[j * K + k] = w[k * M + j];            /* W[k][j] -> Wt[j][k] */
    Xil_DCacheFlushRange((UINTPTR)wt, n * 4u);       /* once: weights never change */
    g_tab[g_tab_n].src = (const void *)w;
    g_tab[g_tab_n].K = K; g_tab[g_tab_n].M = M; g_tab[g_tab_n].wt = wt;
    g_tab_n++;
    return wt;
}

static void dma_reset(void)
{
    uint32_t t = HW_TIMEOUT;
    Xil_Out32(HW_DMA_BASE + DMA_CR, DMA_CR_RESET);
    while ((Xil_In32(HW_DMA_BASE + DMA_CR) & DMA_CR_RESET) && t--) { }
}

/* flush = 1 for data written by the CPU since the last transfer (x),
 * flush = 0 for the constant weights (already flushed in get_wt).             */
static int dma_send(const void *buf, uint32_t bytes, int flush)
{
    uint32_t sr, t = HW_TIMEOUT;
    if (flush) Xil_DCacheFlushRange((UINTPTR)buf, bytes);
    Xil_Out32(HW_DMA_BASE + DMA_SR, 0x7000u);              /* clear IOC/Delay/Err */
    Xil_Out32(HW_DMA_BASE + DMA_CR, DMA_CR_RS);
    Xil_Out32(HW_DMA_BASE + DMA_SA, (uint32_t)(UINTPTR)buf);
    Xil_Out32(HW_DMA_BASE + DMA_LEN, bytes);               /* must be written last */
    while (t--) {
        sr = Xil_In32(HW_DMA_BASE + DMA_SR);
        if (sr & DMA_SR_ERR) { dma_reset(); return -1; }
        if (sr & DMA_SR_IOC) return 0;
    }
    dma_reset();
    return -2;                                              /* timeout */
}

/* y[j] = sum_k x[k]*wt[j*K+k]   (no bias).
 * Returns 0 ok, -3 bad K/M, -4 DMA(x) failed, -5 DMA(W) failed, -6 PL timeout. */
static int hw_run(const float *x, const float *wt, uint32_t K, uint32_t M, float *y)
{
    uint32_t j, v, st, t = HW_TIMEOUT;

    Xil_Out32(HW_DENSE_BASE + R_K, K);
    Xil_Out32(HW_DENSE_BASE + R_M, M);
    Xil_Out32(HW_DENSE_BASE + R_CTRL, 1u);                 /* START: arm the PL first */
    if (Xil_In32(HW_DENSE_BASE + R_STATUS) & ST_ERR) return -3;

    if (dma_send(x,  K * 4u,     1)) return -4;
    if (dma_send(wt, K * M * 4u, 0)) return -5;

    do { st = Xil_In32(HW_DENSE_BASE + R_STATUS); } while (!(st & ST_DONE) && t--);
    if (!(st & ST_DONE)) return -6;

    g_hw_cycles_last = Xil_In32(HW_DENSE_BASE + R_CYC);
    for (j = 0; j < M; j++) {
        v = Xil_In32(HW_DENSE_BASE + R_RES + 4u * j);
        memcpy(&y[j], &v, 4);
    }
    return 0;
}

int hw_dense_init(void)
{
    dma_reset();
    g_enabled = 1;
    return 0;
}

int hw_dense_linear_f32(const struct aitensor *a, const struct aitensor *b,
                        const struct aitensor *c, struct aitensor *result)
{
    const aitensor_t *A = (const aitensor_t *)a;
    const aitensor_t *B = (const aitensor_t *)b;
    const aitensor_t *C = (const aitensor_t *)c;
    aitensor_t *R = (aitensor_t *)result;
    uint32_t N, K, M, n, j;
    const float *wt;
    int rc;

    if (!g_enabled) return 1;
    if (A->dim != 2 || B->dim != 2 || R->dim != 2) goto fallback;
    N = A->shape[0]; K = A->shape[1]; M = B->shape[1];
    if (B->shape[0] != K || R->shape[0] != N || R->shape[1] != M) goto fallback;
    if (K == 0 || M == 0 || K > HW_MAX_K || M > HW_MAX_M) goto fallback;
    if ((uint64_t)K * M < HW_MIN_MACS) goto fallback;
    if (C != 0 && C->shape[C->dim - 1] != M) goto fallback;

    wt = get_wt((const float *)B->data, K, M);
    if (!wt) goto fallback;

    for (n = 0; n < N; n++) {
        float *y = (float *)R->data + n * M;
        rc = hw_run((const float *)A->data + n * K, wt, K, M, y);
        if (rc) { g_hw_last_err = rc; goto fallback; }
        if (C != 0) {
            const float *bias = (const float *)C->data;
            for (j = 0; j < M; j++) y[j] += bias[j];
        }
    }
    g_hw_calls++;
    return 0;

fallback:
    g_hw_fallbacks++;
    return 1;
}

int hw_dense_selftest(void)
{
    static float x[16]  __attribute__((aligned(32)));
    static float wt[64] __attribute__((aligned(32)));
    float y[4], ref[4];
    int k, j, bad = 0;

    hw_dense_init();
    for (k = 0; k < 16; k++) x[k] = 0.1f * (float)(k + 1);
    for (j = 0; j < 4; j++) {
        ref[j] = 0.0f;
        for (k = 0; k < 16; k++) {
            wt[j * 16 + k] = 0.05f * (float)(j + 1) - 0.01f * (float)k;
            ref[j] += x[k] * wt[j * 16 + k];
        }
    }
    Xil_DCacheFlushRange((UINTPTR)wt, sizeof(wt));   /* weights are not flushed in hw_run */
    if (hw_run(x, wt, 16, 4, y) != 0) bad = 1;
    else for (j = 0; j < 4; j++) if (fabsf(y[j] - ref[j]) > 1e-4f) bad = 1;

    g_hw_selftest = bad;
    if (bad) g_enabled = 0;      /* software fallback keeps AIfES correct */
    return bad;
}
