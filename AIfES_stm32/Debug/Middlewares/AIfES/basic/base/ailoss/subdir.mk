################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/AIfES/basic/base/ailoss/ailoss_crossentropy.c \
../Middlewares/AIfES/basic/base/ailoss/ailoss_mse.c 

OBJS += \
./Middlewares/AIfES/basic/base/ailoss/ailoss_crossentropy.o \
./Middlewares/AIfES/basic/base/ailoss/ailoss_mse.o 

C_DEPS += \
./Middlewares/AIfES/basic/base/ailoss/ailoss_crossentropy.d \
./Middlewares/AIfES/basic/base/ailoss/ailoss_mse.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/AIfES/basic/base/ailoss/%.o Middlewares/AIfES/basic/base/ailoss/%.su Middlewares/AIfES/basic/base/ailoss/%.cyclo: ../Middlewares/AIfES/basic/base/ailoss/%.c Middlewares/AIfES/basic/base/ailoss/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4R9xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/micro/STM32CubeIDE/workspace_1.15.0/AIfES/Middlewares/AIfES" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-ailoss

clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-ailoss:
	-$(RM) ./Middlewares/AIfES/basic/base/ailoss/ailoss_crossentropy.cyclo ./Middlewares/AIfES/basic/base/ailoss/ailoss_crossentropy.d ./Middlewares/AIfES/basic/base/ailoss/ailoss_crossentropy.o ./Middlewares/AIfES/basic/base/ailoss/ailoss_crossentropy.su ./Middlewares/AIfES/basic/base/ailoss/ailoss_mse.cyclo ./Middlewares/AIfES/basic/base/ailoss/ailoss_mse.d ./Middlewares/AIfES/basic/base/ailoss/ailoss_mse.o ./Middlewares/AIfES/basic/base/ailoss/ailoss_mse.su

.PHONY: clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-ailoss

