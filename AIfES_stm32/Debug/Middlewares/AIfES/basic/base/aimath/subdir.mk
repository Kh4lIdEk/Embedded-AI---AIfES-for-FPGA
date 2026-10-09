################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/AIfES/basic/base/aimath/aimath_basic.c \
../Middlewares/AIfES/basic/base/aimath/aimath_f32.c \
../Middlewares/AIfES/basic/base/aimath/aimath_q31.c \
../Middlewares/AIfES/basic/base/aimath/aimath_q7.c \
../Middlewares/AIfES/basic/base/aimath/aimath_u8.c 

OBJS += \
./Middlewares/AIfES/basic/base/aimath/aimath_basic.o \
./Middlewares/AIfES/basic/base/aimath/aimath_f32.o \
./Middlewares/AIfES/basic/base/aimath/aimath_q31.o \
./Middlewares/AIfES/basic/base/aimath/aimath_q7.o \
./Middlewares/AIfES/basic/base/aimath/aimath_u8.o 

C_DEPS += \
./Middlewares/AIfES/basic/base/aimath/aimath_basic.d \
./Middlewares/AIfES/basic/base/aimath/aimath_f32.d \
./Middlewares/AIfES/basic/base/aimath/aimath_q31.d \
./Middlewares/AIfES/basic/base/aimath/aimath_q7.d \
./Middlewares/AIfES/basic/base/aimath/aimath_u8.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/AIfES/basic/base/aimath/%.o Middlewares/AIfES/basic/base/aimath/%.su Middlewares/AIfES/basic/base/aimath/%.cyclo: ../Middlewares/AIfES/basic/base/aimath/%.c Middlewares/AIfES/basic/base/aimath/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4R9xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/micro/STM32CubeIDE/workspace_1.15.0/AIfES/Middlewares/AIfES" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-aimath

clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-aimath:
	-$(RM) ./Middlewares/AIfES/basic/base/aimath/aimath_basic.cyclo ./Middlewares/AIfES/basic/base/aimath/aimath_basic.d ./Middlewares/AIfES/basic/base/aimath/aimath_basic.o ./Middlewares/AIfES/basic/base/aimath/aimath_basic.su ./Middlewares/AIfES/basic/base/aimath/aimath_f32.cyclo ./Middlewares/AIfES/basic/base/aimath/aimath_f32.d ./Middlewares/AIfES/basic/base/aimath/aimath_f32.o ./Middlewares/AIfES/basic/base/aimath/aimath_f32.su ./Middlewares/AIfES/basic/base/aimath/aimath_q31.cyclo ./Middlewares/AIfES/basic/base/aimath/aimath_q31.d ./Middlewares/AIfES/basic/base/aimath/aimath_q31.o ./Middlewares/AIfES/basic/base/aimath/aimath_q31.su ./Middlewares/AIfES/basic/base/aimath/aimath_q7.cyclo ./Middlewares/AIfES/basic/base/aimath/aimath_q7.d ./Middlewares/AIfES/basic/base/aimath/aimath_q7.o ./Middlewares/AIfES/basic/base/aimath/aimath_q7.su ./Middlewares/AIfES/basic/base/aimath/aimath_u8.cyclo ./Middlewares/AIfES/basic/base/aimath/aimath_u8.d ./Middlewares/AIfES/basic/base/aimath/aimath_u8.o ./Middlewares/AIfES/basic/base/aimath/aimath_u8.su

.PHONY: clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-aimath

