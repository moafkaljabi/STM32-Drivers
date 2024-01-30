#include <stdio.h>
#include "stm32f4xx.h"
#include "esp82xx_driver.h"
#include "fifo.h"

int my_tx_data[100];
int my_rx_data[100];


int main()
{
	char tx_data,rx_data;
	debug_uart_init();

	tx_fifo_init();
	rx_fifo_init();

	for(int i=0;i<100;i++)
	{
		tx_fifo_put(i*2);
		rx_fifo_put(i+3);

	}

	for(int i=0;i<100;i++)
	{
		tx_fifo_get(&tx_data);
		rx_fifo_get(&rx_data);

		my_tx_data[i] = tx_data;
		my_rx_data[i] = rx_data;


	}

	printf("-------------------TX Test------------------------\n\r");

	for(int i =0;i<100;i++)
	{
		printf("Data at my_tx_data  idx %d  = %d \n\r",i,my_tx_data[i]);
	}

	printf("-------------------RX Test------------------------\n\r");

//	for(int i =0;i<100;i++)
//	{
//
//		printf("Data at my_rx_data idx %d  = %d \n\r",i,my_rx_data[i]);
//	}


	while(1)
	{
	}

}
