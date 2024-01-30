################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (10.3-2021.10)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/adc.c \
../Src/circular_buffer.c \
../Src/esp82xx_driver.c \
../Src/esp82xx_lib.c \
../Src/fifo.c \
../Src/hardware_modules.c \
../Src/main.c \
../Src/syscalls.c \
../Src/sysmem.c 

OBJS += \
./Src/adc.o \
./Src/circular_buffer.o \
./Src/esp82xx_driver.o \
./Src/esp82xx_lib.o \
./Src/fifo.o \
./Src/hardware_modules.o \
./Src/main.o \
./Src/syscalls.o \
./Src/sysmem.o 

C_DEPS += \
./Src/adc.d \
./Src/circular_buffer.d \
./Src/esp82xx_driver.d \
./Src/esp82xx_lib.d \
./Src/fifo.d \
./Src/hardware_modules.d \
./Src/main.d \
./Src/syscalls.d \
./Src/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
Src/%.o Src/%.su Src/%.cyclo: ../Src/%.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F411RETx -DSTM32F411xE -c -I../Inc -I"/Users/moafk22/mwafa2/STM32CubeIDE/Embedded-STM32-WIFI-Course/13_esp82xx_multil_sensor_data_cloud/chip_headers/CMSIS/Include" -I"/Users/moafk22/mwafa2/STM32CubeIDE/Embedded-STM32-WIFI-Course/13_esp82xx_multil_sensor_data_cloud/chip_headers/CMSIS/Device/ST/STM32F4xx/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -fcyclomatic-complexity -MMD -MP -MF"$(@:%.o=%.d)" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

clean: clean-Src

clean-Src:
	-$(RM) ./Src/adc.cyclo ./Src/adc.d ./Src/adc.o ./Src/adc.su ./Src/circular_buffer.cyclo ./Src/circular_buffer.d ./Src/circular_buffer.o ./Src/circular_buffer.su ./Src/esp82xx_driver.cyclo ./Src/esp82xx_driver.d ./Src/esp82xx_driver.o ./Src/esp82xx_driver.su ./Src/esp82xx_lib.cyclo ./Src/esp82xx_lib.d ./Src/esp82xx_lib.o ./Src/esp82xx_lib.su ./Src/fifo.cyclo ./Src/fifo.d ./Src/fifo.o ./Src/fifo.su ./Src/hardware_modules.cyclo ./Src/hardware_modules.d ./Src/hardware_modules.o ./Src/hardware_modules.su ./Src/main.cyclo ./Src/main.d ./Src/main.o ./Src/main.su ./Src/syscalls.cyclo ./Src/syscalls.d ./Src/syscalls.o ./Src/syscalls.su ./Src/sysmem.cyclo ./Src/sysmem.d ./Src/sysmem.o ./Src/sysmem.su

.PHONY: clean-Src

