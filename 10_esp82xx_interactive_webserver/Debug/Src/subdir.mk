################################################################################
# Automatically-generated file. Do not edit!
# Toolchain: GNU Tools for STM32 (9-2020-q2-update)
################################################################################

# Add inputs and outputs from these tool invocations to the build variables 
C_SRCS += \
../Src/circular_buffer.c \
../Src/esp82xx_driver.c \
../Src/esp82xx_lib.c \
../Src/fifo.c \
../Src/hardware_modules.c \
../Src/main.c \
../Src/syscalls.c \
../Src/sysmem.c 

OBJS += \
./Src/circular_buffer.o \
./Src/esp82xx_driver.o \
./Src/esp82xx_lib.o \
./Src/fifo.o \
./Src/hardware_modules.o \
./Src/main.o \
./Src/syscalls.o \
./Src/sysmem.o 

C_DEPS += \
./Src/circular_buffer.d \
./Src/esp82xx_driver.d \
./Src/esp82xx_lib.d \
./Src/fifo.d \
./Src/hardware_modules.d \
./Src/main.d \
./Src/syscalls.d \
./Src/sysmem.d 


# Each subdirectory must supply rules for building sources it contributes
Src/circular_buffer.o: ../Src/circular_buffer.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F411RETx -DSTM32F411xE -c -I../Inc -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Include" -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Device/ST/STM32F4xx/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/circular_buffer.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/esp82xx_driver.o: ../Src/esp82xx_driver.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F411RETx -DSTM32F411xE -c -I../Inc -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Include" -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Device/ST/STM32F4xx/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/esp82xx_driver.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/esp82xx_lib.o: ../Src/esp82xx_lib.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F411RETx -DSTM32F411xE -c -I../Inc -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Include" -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Device/ST/STM32F4xx/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/esp82xx_lib.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/fifo.o: ../Src/fifo.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F411RETx -DSTM32F411xE -c -I../Inc -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Include" -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Device/ST/STM32F4xx/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/fifo.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/hardware_modules.o: ../Src/hardware_modules.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F411RETx -DSTM32F411xE -c -I../Inc -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Include" -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Device/ST/STM32F4xx/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/hardware_modules.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/main.o: ../Src/main.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F411RETx -DSTM32F411xE -c -I../Inc -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Include" -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Device/ST/STM32F4xx/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/main.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/syscalls.o: ../Src/syscalls.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F411RETx -DSTM32F411xE -c -I../Inc -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Include" -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Device/ST/STM32F4xx/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/syscalls.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"
Src/sysmem.o: ../Src/sysmem.c Src/subdir.mk
	arm-none-eabi-gcc "$<" -mcpu=cortex-m4 -std=gnu11 -g3 -DDEBUG -DSTM32 -DSTM32F4 -DSTM32F411RETx -DSTM32F411xE -c -I../Inc -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Include" -I"C:/Users/Israel/Documents/Embedded-STM32-WIFI-Course/10_esp82xx_interactive_webserver/chip_headers/CMSIS/Device/ST/STM32F4xx/Include" -O0 -ffunction-sections -fdata-sections -Wall -fstack-usage -MMD -MP -MF"Src/sysmem.d" -MT"$@" --specs=nano.specs -mfpu=fpv4-sp-d16 -mfloat-abi=hard -mthumb -o "$@"

