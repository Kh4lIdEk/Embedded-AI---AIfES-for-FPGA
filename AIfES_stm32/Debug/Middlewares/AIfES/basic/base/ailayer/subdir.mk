################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (12.3.rel1)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Middlewares/AIfES/basic/base/ailayer/ailayer_dense.c \
../Middlewares/AIfES/basic/base/ailayer/ailayer_elu.c \
../Middlewares/AIfES/basic/base/ailayer/ailayer_input.c \
../Middlewares/AIfES/basic/base/ailayer/ailayer_leaky_relu.c \
../Middlewares/AIfES/basic/base/ailayer/ailayer_relu.c \
../Middlewares/AIfES/basic/base/ailayer/ailayer_sigmoid.c \
../Middlewares/AIfES/basic/base/ailayer/ailayer_softmax.c \
../Middlewares/AIfES/basic/base/ailayer/ailayer_softsign.c \
../Middlewares/AIfES/basic/base/ailayer/ailayer_tanh.c \
../Middlewares/AIfES/basic/base/ailayer/ailayer_template.c 

OBJS += \
./Middlewares/AIfES/basic/base/ailayer/ailayer_dense.o \
./Middlewares/AIfES/basic/base/ailayer/ailayer_elu.o \
./Middlewares/AIfES/basic/base/ailayer/ailayer_input.o \
./Middlewares/AIfES/basic/base/ailayer/ailayer_leaky_relu.o \
./Middlewares/AIfES/basic/base/ailayer/ailayer_relu.o \
./Middlewares/AIfES/basic/base/ailayer/ailayer_sigmoid.o \
./Middlewares/AIfES/basic/base/ailayer/ailayer_softmax.o \
./Middlewares/AIfES/basic/base/ailayer/ailayer_softsign.o \
./Middlewares/AIfES/basic/base/ailayer/ailayer_tanh.o \
./Middlewares/AIfES/basic/base/ailayer/ailayer_template.o 

C_DEPS += \
./Middlewares/AIfES/basic/base/ailayer/ailayer_dense.d \
./Middlewares/AIfES/basic/base/ailayer/ailayer_elu.d \
./Middlewares/AIfES/basic/base/ailayer/ailayer_input.d \
./Middlewares/AIfES/basic/base/ailayer/ailayer_leaky_relu.d \
./Middlewares/AIfES/basic/base/ailayer/ailayer_relu.d \
./Middlewares/AIfES/basic/base/ailayer/ailayer_sigmoid.d \
./Middlewares/AIfES/basic/base/ailayer/ailayer_softmax.d \
./Middlewares/AIfES/basic/base/ailayer/ailayer_softsign.d \
./Middlewares/AIfES/basic/base/ailayer/ailayer_tanh.d \
./Middlewares/AIfES/basic/base/ailayer/ailayer_template.d 


# Each subdirectory must supply rules for building sources it contributes
Middlewares/AIfES/basic/base/ailayer/%.o Middlewares/AIfES/basic/base/ailayer/%.su Middlewares/AIfES/basic/base/ailayer/%.cyclo: ../Middlewares/AIfES/basic/base/ailayer/%.c Middlewares/AIfES/basic/base/ailayer/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DUSE_HAL_DRIVER -DSTM32L4R9xx -c -I../Core/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc -I../Drivers/STM32L4xx_HAL_Driver/Inc/Legacy -I../Drivers/CMSIS/Device/ST/STM32L4xx/Include -I../Drivers/CMSIS/Include -I"C:/Users/micro/STM32CubeIDE/workspace_1.15.0/AIfES/Middlewares/AIfES" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-ailayer

clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-ailayer:
	-$(RM) ./Middlewares/AIfES/basic/base/ailayer/ailayer_dense.cyclo ./Middlewares/AIfES/basic/base/ailayer/ailayer_dense.d ./Middlewares/AIfES/basic/base/ailayer/ailayer_dense.o ./Middlewares/AIfES/basic/base/ailayer/ailayer_dense.su ./Middlewares/AIfES/basic/base/ailayer/ailayer_elu.cyclo ./Middlewares/AIfES/basic/base/ailayer/ailayer_elu.d ./Middlewares/AIfES/basic/base/ailayer/ailayer_elu.o ./Middlewares/AIfES/basic/base/ailayer/ailayer_elu.su ./Middlewares/AIfES/basic/base/ailayer/ailayer_input.cyclo ./Middlewares/AIfES/basic/base/ailayer/ailayer_input.d ./Middlewares/AIfES/basic/base/ailayer/ailayer_input.o ./Middlewares/AIfES/basic/base/ailayer/ailayer_input.su ./Middlewares/AIfES/basic/base/ailayer/ailayer_leaky_relu.cyclo ./Middlewares/AIfES/basic/base/ailayer/ailayer_leaky_relu.d ./Middlewares/AIfES/basic/base/ailayer/ailayer_leaky_relu.o ./Middlewares/AIfES/basic/base/ailayer/ailayer_leaky_relu.su ./Middlewares/AIfES/basic/base/ailayer/ailayer_relu.cyclo ./Middlewares/AIfES/basic/base/ailayer/ailayer_relu.d ./Middlewares/AIfES/basic/base/ailayer/ailayer_relu.o ./Middlewares/AIfES/basic/base/ailayer/ailayer_relu.su ./Middlewares/AIfES/basic/base/ailayer/ailayer_sigmoid.cyclo ./Middlewares/AIfES/basic/base/ailayer/ailayer_sigmoid.d ./Middlewares/AIfES/basic/base/ailayer/ailayer_sigmoid.o ./Middlewares/AIfES/basic/base/ailayer/ailayer_sigmoid.su ./Middlewares/AIfES/basic/base/ailayer/ailayer_softmax.cyclo ./Middlewares/AIfES/basic/base/ailayer/ailayer_softmax.d ./Middlewares/AIfES/basic/base/ailayer/ailayer_softmax.o ./Middlewares/AIfES/basic/base/ailayer/ailayer_softmax.su ./Middlewares/AIfES/basic/base/ailayer/ailayer_softsign.cyclo ./Middlewares/AIfES/basic/base/ailayer/ailayer_softsign.d ./Middlewares/AIfES/basic/base/ailayer/ailayer_softsign.o ./Middlewares/AIfES/basic/base/ailayer/ailayer_softsign.su ./Middlewares/AIfES/basic/base/ailayer/ailayer_tanh.cyclo ./Middlewares/AIfES/basic/base/ailayer/ailayer_tanh.d ./Middlewares/AIfES/basic/base/ailayer/ailayer_tanh.o ./Middlewares/AIfES/basic/base/ailayer/ailayer_tanh.su ./Middlewares/AIfES/basic/base/ailayer/ailayer_template.cyclo ./Middlewares/AIfES/basic/base/ailayer/ailayer_template.d ./Middlewares/AIfES/basic/base/ailayer/ailayer_template.o ./Middlewares/AIfES/basic/base/ailayer/ailayer_template.su

.PHONY: clean-Middlewares-2f-AIfES-2f-basic-2f-base-2f-ailayer

