################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/AIfES/cnn/default/ailayer/ailayer_batch_normalization_default.c \
../Middlewares/AIfES/cnn/default/ailayer/ailayer_conv2d_default.c \
../Middlewares/AIfES/cnn/default/ailayer/ailayer_maxpool2d_default.c \
../Middlewares/AIfES/cnn/default/ailayer/ailayer_reshape_default.c 

OBJS += \
./Middlewares/AIfES/cnn/default/ailayer/ailayer_batch_normalization_default.o \
./Middlewares/AIfES/cnn/default/ailayer/ailayer_conv2d_default.o \
./Middlewares/AIfES/cnn/default/ailayer/ailayer_maxpool2d_default.o \
./Middlewares/AIfES/cnn/default/ailayer/ailayer_reshape_default.o 

C_DEPS += \
./Middlewares/AIfES/cnn/default/ailayer/ailayer_batch_normalization_default.d \
./Middlewares/AIfES/cnn/default/ailayer/ailayer_conv2d_default.d \
./Middlewares/AIfES/cnn/default/ailayer/ailayer_maxpool2d_default.d \
./Middlewares/AIfES/cnn/default/ailayer/ailayer_reshape_default.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/AIfES/cnn/default/ailayer/%.o Middlewares/AIfES/cnn/default/ailayer/%.su Middlewares/AIfES/cnn/default/ailayer/%.cyclo: ../Middlewares/AIfES/cnn/default/ailayer/%.c Middlewares/AIfES/cnn/default/ailayer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4R9xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/micro/STM32CubeIDE/workspace_1.15.0/AIfES/Middlewares/AIfES" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-AIfES-2f-cnn-2f-default-2f-ailayer

clean-Middlewares-2f-AIfES-2f-cnn-2f-default-2f-ailayer:
	-$(RM) ./Middlewares/AIfES/cnn/default/ailayer/ailayer_batch_normalization_default.cyclo ./Middlewares/AIfES/cnn/default/ailayer/ailayer_batch_normalization_default.d ./Middlewares/AIfES/cnn/default/ailayer/ailayer_batch_normalization_default.o ./Middlewares/AIfES/cnn/default/ailayer/ailayer_batch_normalization_default.su ./Middlewares/AIfES/cnn/default/ailayer/ailayer_conv2d_default.cyclo ./Middlewares/AIfES/cnn/default/ailayer/ailayer_conv2d_default.d ./Middlewares/AIfES/cnn/default/ailayer/ailayer_conv2d_default.o ./Middlewares/AIfES/cnn/default/ailayer/ailayer_conv2d_default.su ./Middlewares/AIfES/cnn/default/ailayer/ailayer_maxpool2d_default.cyclo ./Middlewares/AIfES/cnn/default/ailayer/ailayer_maxpool2d_default.d ./Middlewares/AIfES/cnn/default/ailayer/ailayer_maxpool2d_default.o ./Middlewares/AIfES/cnn/default/ailayer/ailayer_maxpool2d_default.su ./Middlewares/AIfES/cnn/default/ailayer/ailayer_reshape_default.cyclo ./Middlewares/AIfES/cnn/default/ailayer/ailayer_reshape_default.d ./Middlewares/AIfES/cnn/default/ailayer/ailayer_reshape_default.o ./Middlewares/AIfES/cnn/default/ailayer/ailayer_reshape_default.su

.PHONY: clean-Middlewares-2f-AIfES-2f-cnn-2f-default-2f-ailayer

