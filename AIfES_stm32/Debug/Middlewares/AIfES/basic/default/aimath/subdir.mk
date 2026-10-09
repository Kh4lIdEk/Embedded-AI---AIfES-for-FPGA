################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/AIfES/basic/default/aimath/aimath_f32_default.c \
../Middlewares/AIfES/basic/default/aimath/aimath_q31_default.c \
../Middlewares/AIfES/basic/default/aimath/aimath_q7_default.c 

OBJS += \
./Middlewares/AIfES/basic/default/aimath/aimath_f32_default.o \
./Middlewares/AIfES/basic/default/aimath/aimath_q31_default.o \
./Middlewares/AIfES/basic/default/aimath/aimath_q7_default.o 

C_DEPS += \
./Middlewares/AIfES/basic/default/aimath/aimath_f32_default.d \
./Middlewares/AIfES/basic/default/aimath/aimath_q31_default.d \
./Middlewares/AIfES/basic/default/aimath/aimath_q7_default.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/AIfES/basic/default/aimath/%.o Middlewares/AIfES/basic/default/aimath/%.su Middlewares/AIfES/basic/default/aimath/%.cyclo: ../Middlewares/AIfES/basic/default/aimath/%.c Middlewares/AIfES/basic/default/aimath/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4R9xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/micro/STM32CubeIDE/workspace_1.15.0/AIfES/Middlewares/AIfES" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-AIfES-2f-basic-2f-default-2f-aimath

clean-Middlewares-2f-AIfES-2f-basic-2f-default-2f-aimath:
	-$(RM) ./Middlewares/AIfES/basic/default/aimath/aimath_f32_default.cyclo ./Middlewares/AIfES/basic/default/aimath/aimath_f32_default.d ./Middlewares/AIfES/basic/default/aimath/aimath_f32_default.o ./Middlewares/AIfES/basic/default/aimath/aimath_f32_default.su ./Middlewares/AIfES/basic/default/aimath/aimath_q31_default.cyclo ./Middlewares/AIfES/basic/default/aimath/aimath_q31_default.d ./Middlewares/AIfES/basic/default/aimath/aimath_q31_default.o ./Middlewares/AIfES/basic/default/aimath/aimath_q31_default.su ./Middlewares/AIfES/basic/default/aimath/aimath_q7_default.cyclo ./Middlewares/AIfES/basic/default/aimath/aimath_q7_default.d ./Middlewares/AIfES/basic/default/aimath/aimath_q7_default.o ./Middlewares/AIfES/basic/default/aimath/aimath_q7_default.su

.PHONY: clean-Middlewares-2f-AIfES-2f-basic-2f-default-2f-aimath

