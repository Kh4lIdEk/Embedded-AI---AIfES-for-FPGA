################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/AIfES/basic/default/ailayer/ailayer_dense_default.c \
../Middlewares/AIfES/basic/default/ailayer/ailayer_elu_default.c \
../Middlewares/AIfES/basic/default/ailayer/ailayer_input_default.c \
../Middlewares/AIfES/basic/default/ailayer/ailayer_leaky_relu_default.c \
../Middlewares/AIfES/basic/default/ailayer/ailayer_relu_default.c \
../Middlewares/AIfES/basic/default/ailayer/ailayer_sigmoid_default.c \
../Middlewares/AIfES/basic/default/ailayer/ailayer_softmax_default.c \
../Middlewares/AIfES/basic/default/ailayer/ailayer_softsign_default.c \
../Middlewares/AIfES/basic/default/ailayer/ailayer_tanh_default.c 

OBJS += \
./Middlewares/AIfES/basic/default/ailayer/ailayer_dense_default.o \
./Middlewares/AIfES/basic/default/ailayer/ailayer_elu_default.o \
./Middlewares/AIfES/basic/default/ailayer/ailayer_input_default.o \
./Middlewares/AIfES/basic/default/ailayer/ailayer_leaky_relu_default.o \
./Middlewares/AIfES/basic/default/ailayer/ailayer_relu_default.o \
./Middlewares/AIfES/basic/default/ailayer/ailayer_sigmoid_default.o \
./Middlewares/AIfES/basic/default/ailayer/ailayer_softmax_default.o \
./Middlewares/AIfES/basic/default/ailayer/ailayer_softsign_default.o \
./Middlewares/AIfES/basic/default/ailayer/ailayer_tanh_default.o 

C_DEPS += \
./Middlewares/AIfES/basic/default/ailayer/ailayer_dense_default.d \
./Middlewares/AIfES/basic/default/ailayer/ailayer_elu_default.d \
./Middlewares/AIfES/basic/default/ailayer/ailayer_input_default.d \
./Middlewares/AIfES/basic/default/ailayer/ailayer_leaky_relu_default.d \
./Middlewares/AIfES/basic/default/ailayer/ailayer_relu_default.d \
./Middlewares/AIfES/basic/default/ailayer/ailayer_sigmoid_default.d \
./Middlewares/AIfES/basic/default/ailayer/ailayer_softmax_default.d \
./Middlewares/AIfES/basic/default/ailayer/ailayer_softsign_default.d \
./Middlewares/AIfES/basic/default/ailayer/ailayer_tanh_default.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/AIfES/basic/default/ailayer/%.o Middlewares/AIfES/basic/default/ailayer/%.su Middlewares/AIfES/basic/default/ailayer/%.cyclo: ../Middlewares/AIfES/basic/default/ailayer/%.c Middlewares/AIfES/basic/default/ailayer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4R9xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/micro/STM32CubeIDE/workspace_1.15.0/AIfES/Middlewares/AIfES" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-AIfES-2f-basic-2f-default-2f-ailayer

clean-Middlewares-2f-AIfES-2f-basic-2f-default-2f-ailayer:
	-$(RM) ./Middlewares/AIfES/basic/default/ailayer/ailayer_dense_default.cyclo ./Middlewares/AIfES/basic/default/ailayer/ailayer_dense_default.d ./Middlewares/AIfES/basic/default/ailayer/ailayer_dense_default.o ./Middlewares/AIfES/basic/default/ailayer/ailayer_dense_default.su ./Middlewares/AIfES/basic/default/ailayer/ailayer_elu_default.cyclo ./Middlewares/AIfES/basic/default/ailayer/ailayer_elu_default.d ./Middlewares/AIfES/basic/default/ailayer/ailayer_elu_default.o ./Middlewares/AIfES/basic/default/ailayer/ailayer_elu_default.su ./Middlewares/AIfES/basic/default/ailayer/ailayer_input_default.cyclo ./Middlewares/AIfES/basic/default/ailayer/ailayer_input_default.d ./Middlewares/AIfES/basic/default/ailayer/ailayer_input_default.o ./Middlewares/AIfES/basic/default/ailayer/ailayer_input_default.su ./Middlewares/AIfES/basic/default/ailayer/ailayer_leaky_relu_default.cyclo ./Middlewares/AIfES/basic/default/ailayer/ailayer_leaky_relu_default.d ./Middlewares/AIfES/basic/default/ailayer/ailayer_leaky_relu_default.o ./Middlewares/AIfES/basic/default/ailayer/ailayer_leaky_relu_default.su ./Middlewares/AIfES/basic/default/ailayer/ailayer_relu_default.cyclo ./Middlewares/AIfES/basic/default/ailayer/ailayer_relu_default.d ./Middlewares/AIfES/basic/default/ailayer/ailayer_relu_default.o ./Middlewares/AIfES/basic/default/ailayer/ailayer_relu_default.su ./Middlewares/AIfES/basic/default/ailayer/ailayer_sigmoid_default.cyclo ./Middlewares/AIfES/basic/default/ailayer/ailayer_sigmoid_default.d ./Middlewares/AIfES/basic/default/ailayer/ailayer_sigmoid_default.o ./Middlewares/AIfES/basic/default/ailayer/ailayer_sigmoid_default.su ./Middlewares/AIfES/basic/default/ailayer/ailayer_softmax_default.cyclo ./Middlewares/AIfES/basic/default/ailayer/ailayer_softmax_default.d ./Middlewares/AIfES/basic/default/ailayer/ailayer_softmax_default.o ./Middlewares/AIfES/basic/default/ailayer/ailayer_softmax_default.su ./Middlewares/AIfES/basic/default/ailayer/ailayer_softsign_default.cyclo ./Middlewares/AIfES/basic/default/ailayer/ailayer_softsign_default.d ./Middlewares/AIfES/basic/default/ailayer/ailayer_softsign_default.o ./Middlewares/AIfES/basic/default/ailayer/ailayer_softsign_default.su ./Middlewares/AIfES/basic/default/ailayer/ailayer_tanh_default.cyclo ./Middlewares/AIfES/basic/default/ailayer/ailayer_tanh_default.d ./Middlewares/AIfES/basic/default/ailayer/ailayer_tanh_default.o ./Middlewares/AIfES/basic/default/ailayer/ailayer_tanh_default.su

.PHONY: clean-Middlewares-2f-AIfES-2f-basic-2f-default-2f-ailayer

