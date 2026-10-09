/**
 * aifes_config.h - AIfES 2.2.0 configuration for STM32 (bare-metal, STM32CubeIDE / arm-none-eabi-gcc)
 *
 * Replaces AIfES_for_Arduino/src/aifes_config.h (that one relies on Arduino.h / Serial).
 *
 *  - AIFES_WITH_CMSIS : enable ONLY after the CMSIS steps in README.md are done.
 *  - AIDEBUG_ENABLE_PRINTING : off by default. The Python script and any printf would share
 *    the ST-LINK virtual COM port, so debug text would corrupt the binary protocol.
 */
#ifndef AIFES_CONFIG
#define AIFES_CONFIG

#include <stdbool.h>
#include <stdint.h>
#include <stddef.h>

#if __arm__
/* #define AIFES_WITH_CMSIS */          /* step 2 of the README (faster Dense layers on Cortex-M4/M7) */
#endif

#define AIDEBUG_SHAPE_CHECKS            /* check tensor shapes before math operations   */
#define AIDEBUG_GENERAL_CHECKS          /* general run-time checks                      */

#define AIFES_MEMORY_ALIGNMENT  sizeof(int)
#define AIFES_ALIGN_INTEGER(variable, alignment)  while(variable % alignment != 0) variable ++

/* #define AIDEBUG_ENABLE_PRINTING */   /* needs aifes_config.c + printf retargeting; see README */

#ifdef AIDEBUG_ENABLE_PRINTING
    #define AISTRING_STORAGE_WRAPPER(name, msg)   const char name[] = msg;
    #define AIDEBUG_PRINT_MODULE_SPECS
    #define AIDEBUG_PRINT_ERROR_MESSAGES
    #define AILOG_E(MESSAGE)                aifes_log_e(MESSAGE)
    #define AIPRINT(STRING)                 aiprint(STRING)
    #define AIPRINT_INT(FORMAT, VAR)        aiprint_int(FORMAT, VAR)
    #define AIPRINT_UINT(FORMAT, VAR)       aiprint_uint(FORMAT, VAR)
    #define AIPRINT_LONG_INT(FORMAT, VAR)   aiprint_long_int(FORMAT, VAR)
    #define AIPRINT_FLOAT(FORMAT, VAR)      aiprint_float(FORMAT, VAR)
    extern int (*aiprint)(const char *string);
    extern int (*aiprint_int)(const char *format, int var);
    extern int (*aiprint_uint)(const char *format, unsigned int var);
    extern int (*aiprint_long_int)(const char *format, long int var);
    extern int (*aiprint_float)(const char *format, float var);
    int aifes_log_e(const char *message);
    int aifes_print(const char *string);
    int aifes_print_int(const char *format, int var);
    int aifes_print_uint(const char *format, unsigned int var);
    int aifes_print_long_int(const char *format, long int var);
    int aifes_print_float(const char *format, float var);
#else
    #define AISTRING_STORAGE_WRAPPER(name, msg)
    #define AILOG_E(MESSAGE)
    #define AIPRINT(STRING)
    #define AIPRINT_INT(FORMAT, VAR)
    #define AIPRINT_UINT(FORMAT, VAR)
    #define AIPRINT_LONG_INT(FORMAT, VAR)
    #define AIPRINT_FLOAT(FORMAT, VAR)
#endif

#endif /* AIFES_CONFIG */
