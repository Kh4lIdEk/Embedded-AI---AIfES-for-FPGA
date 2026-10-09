################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/AIfES/basic/express/aifes_express_f32_fnn.c \
../Middlewares/AIfES/basic/express/aifes_express_q7_fnn.c 

OBJS += \
./Middlewares/AIfES/basic/express/aifes_express_f32_fnn.o \
./Middlewares/AIfES/basic/express/aifes_express_q7_fnn.o 

C_DEPS += \
./Middlewares/AIfES/basic/express/aifes_express_f32_fnn.d \
./Middlewares/AIfES/basic/express/aifes_express_q7_fnn.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/AIfES/basic/express/%.o Middlewares/AIfES/basic/express/%.su Middlewares/AIfES/basic/express/%.cyclo: ../Middlewares/AIfES/basic/express/%.c Middlewares/AIfES/basic/express/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4R9xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/micro/STM32CubeIDE/workspace_1.15.0/AIfES/Middlewares/AIfES" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-AIfES-2f-basic-2f-express

clean-Middlewares-2f-AIfES-2f-basic-2f-express:
	-$(RM) ./Middlewares/AIfES/basic/express/aifes_express_f32_fnn.cyclo ./Middlewares/AIfES/basic/express/aifes_express_f32_fnn.d ./Middlewares/AIfES/basic/express/aifes_express_f32_fnn.o ./Middlewares/AIfES/basic/express/aifes_express_f32_fnn.su ./Middlewares/AIfES/basic/express/aifes_express_q7_fnn.cyclo ./Middlewares/AIfES/basic/express/aifes_express_q7_fnn.d ./Middlewares/AIfES/basic/express/aifes_express_q7_fnn.o ./Middlewares/AIfES/basic/express/aifes_express_q7_fnn.su

.PHONY: clean-Middlewares-2f-AIfES-2f-basic-2f-express

