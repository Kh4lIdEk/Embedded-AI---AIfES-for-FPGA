################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_inference.c \
../Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_training.c 

OBJS += \
./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_inference.o \
./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_training.o 

C_DEPS += \
./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_inference.d \
./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_training.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/AIfES/basic/base/aialgo/%.o Middlewares/AIfES/basic/base/aialgo/%.su Middlewares/AIfES/basic/base/aialgo/%.cyclo: ../Middlewares/AIfES/basic/base/aialgo/%.c Middlewares/AIfES/basic/base/aialgo/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4R9xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/micro/STM32CubeIDE/workspace_1.15.0/AIfES/Middlewares/AIfES" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-aialgo

clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-aialgo:
	-$(RM) ./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_inference.cyclo ./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_inference.d ./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_inference.o ./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_inference.su ./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_training.cyclo ./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_training.d ./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_training.o ./Middlewares/AIfES/basic/base/aialgo/aialgo_sequential_training.su

.PHONY: clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-aialgo

