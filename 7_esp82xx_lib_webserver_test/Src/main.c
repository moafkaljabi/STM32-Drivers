#include <stdio.h>
#include "stm32f4xx.h"
#include "esp82xx_driver.h"
#include "fifo.h"
#include "circular_buffer.h"
#include "esp82xx_lib.h"


#define SSID_NAME  "FRITZ!Box 6660 Cable BP"
#define PASSKEY    "73307968999628369212"

int main()
{
    /*Initialize debug uart*/
	debug_uart_init();

	/*Initialize esp82xx uart*/
	esp_uart_init();

	/*Initialize RS pin*/
	esp_rs_pin_init();

	/*Enable RS pin*/
	esp_rs_pin_enable();

    /*Initialize server*/
	esp82xx_sever_init(SSID_NAME,PASSKEY);

	while(1)
	{
		/*Activate server*/
		server_begin();
	}

}

