################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/AIfES/cnn/base/ailayer/ailayer_batch_normalization.c \
../Middlewares/AIfES/cnn/base/ailayer/ailayer_conv2d.c \
../Middlewares/AIfES/cnn/base/ailayer/ailayer_maxpool2d.c \
../Middlewares/AIfES/cnn/base/ailayer/ailayer_reshape.c 

OBJS += \
./Middlewares/AIfES/cnn/base/ailayer/ailayer_batch_normalization.o \
./Middlewares/AIfES/cnn/base/ailayer/ailayer_conv2d.o \
./Middlewares/AIfES/cnn/base/ailayer/ailayer_maxpool2d.o \
./Middlewares/AIfES/cnn/base/ailayer/ailayer_reshape.o 

C_DEPS += \
./Middlewares/AIfES/cnn/base/ailayer/ailayer_batch_normalization.d \
./Middlewares/AIfES/cnn/base/ailayer/ailayer_conv2d.d \
./Middlewares/AIfES/cnn/base/ailayer/ailayer_maxpool2d.d \
./Middlewares/AIfES/cnn/base/ailayer/ailayer_reshape.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/AIfES/cnn/base/ailayer/%.o Middlewares/AIfES/cnn/base/ailayer/%.su Middlewares/AIfES/cnn/base/ailayer/%.cyclo: ../Middlewares/AIfES/cnn/base/ailayer/%.c Middlewares/AIfES/cnn/base/ailayer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4R9xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/micro/STM32CubeIDE/workspace_1.15.0/AIfES/Middlewares/AIfES" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-AIfES-2f-cnn-2f-base-2f-ailayer

clean-Middlewares-2f-AIfES-2f-cnn-2f-base-2f-ailayer:
	-$(RM) ./Middlewares/AIfES/cnn/base/ailayer/ailayer_batch_normalization.cyclo ./Middlewares/AIfES/cnn/base/ailayer/ailayer_batch_normalization.d ./Middlewares/AIfES/cnn/base/ailayer/ailayer_batch_normalization.o ./Middlewares/AIfES/cnn/base/ailayer/ailayer_batch_normalization.su ./Middlewares/AIfES/cnn/base/ailayer/ailayer_conv2d.cyclo ./Middlewares/AIfES/cnn/base/ailayer/ailayer_conv2d.d ./Middlewares/AIfES/cnn/base/ailayer/ailayer_conv2d.o ./Middlewares/AIfES/cnn/base/ailayer/ailayer_conv2d.su ./Middlewares/AIfES/cnn/base/ailayer/ailayer_maxpool2d.cyclo ./Middlewares/AIfES/cnn/base/ailayer/ailayer_maxpool2d.d ./Middlewares/AIfES/cnn/base/ailayer/ailayer_maxpool2d.o ./Middlewares/AIfES/cnn/base/ailayer/ailayer_maxpool2d.su ./Middlewares/AIfES/cnn/base/ailayer/ailayer_reshape.cyclo ./Middlewares/AIfES/cnn/base/ailayer/ailayer_reshape.d ./Middlewares/AIfES/cnn/base/ailayer/ailayer_reshape.o ./Middlewares/AIfES/cnn/base/ailayer/ailayer_reshape.su

.PHONY: clean-Middlewares-2f-AIfES-2f-cnn-2f-base-2f-ailayer

