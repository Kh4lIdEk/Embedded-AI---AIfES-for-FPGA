################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/AIfES/basic/default/aiopti/aiopti_adam_default.c \
../Middlewares/AIfES/basic/default/aiopti/aiopti_sgd_default.c 

OBJS += \
./Middlewares/AIfES/basic/default/aiopti/aiopti_adam_default.o \
./Middlewares/AIfES/basic/default/aiopti/aiopti_sgd_default.o 

C_DEPS += \
./Middlewares/AIfES/basic/default/aiopti/aiopti_adam_default.d \
./Middlewares/AIfES/basic/default/aiopti/aiopti_sgd_default.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/AIfES/basic/default/aiopti/%.o Middlewares/AIfES/basic/default/aiopti/%.su Middlewares/AIfES/basic/default/aiopti/%.cyclo: ../Middlewares/AIfES/basic/default/aiopti/%.c Middlewares/AIfES/basic/default/aiopti/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4R9xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/micro/STM32CubeIDE/workspace_1.15.0/AIfES/Middlewares/AIfES" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-AIfES-2f-basic-2f-default-2f-aiopti

clean-Middlewares-2f-AIfES-2f-basic-2f-default-2f-aiopti:
	-$(RM) ./Middlewares/AIfES/basic/default/aiopti/aiopti_adam_default.cyclo ./Middlewares/AIfES/basic/default/aiopti/aiopti_adam_default.d ./Middlewares/AIfES/basic/default/aiopti/aiopti_adam_default.o ./Middlewares/AIfES/basic/default/aiopti/aiopti_adam_default.su ./Middlewares/AIfES/basic/default/aiopti/aiopti_sgd_default.cyclo ./Middlewares/AIfES/basic/default/aiopti/aiopti_sgd_default.d ./Middlewares/AIfES/basic/default/aiopti/aiopti_sgd_default.o ./Middlewares/AIfES/basic/default/aiopti/aiopti_sgd_default.su

.PHONY: clean-Middlewares-2f-AIfES-2f-basic-2f-default-2f-aiopti

