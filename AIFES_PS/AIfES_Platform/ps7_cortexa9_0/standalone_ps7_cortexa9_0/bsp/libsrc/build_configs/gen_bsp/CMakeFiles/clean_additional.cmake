# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "")
  file(REMOVE_RECURSE
  "C:\\Users\\micro\\Downloads\\ASCON_co_18_09.xpr\\AIFES_1\\AIfES_Platform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\sleep.h"
  "C:\\Users\\micro\\Downloads\\ASCON_co_18_09.xpr\\AIFES_1\\AIfES_Platform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xiltimer.h"
  "C:\\Users\\micro\\Downloads\\ASCON_co_18_09.xpr\\AIFES_1\\AIfES_Platform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\include\\xtimer_config.h"
  "C:\\Users\\micro\\Downloads\\ASCON_co_18_09.xpr\\AIFES_1\\AIfES_Platform\\ps7_cortexa9_0\\standalone_ps7_cortexa9_0\\bsp\\lib\\libxiltimer.a"
  )
endif()
