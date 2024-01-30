#include "esp82xx_driver.h"



#define GPIOAEN				(1U<<0)
#define UART2EN				(1U<<17)
#define CR1_UE				(1U<<13)
#define SYS_FREQ			16000000
#define APB1_CLK			SYS_FREQ
#define UART_BAUDRATE		115200
#define CR1_TE				(1U<<3)
#define CR1_RE				(1U<<2)



static uint16_t compute_uart_bd(uint32_t periph_clk, uint32_t baudrate);



int __io_putchar(int ch)
{
	debug_uart_write(ch);
	return ch;
}

void debug_uart_init(void)
{
	/*Enable clock access to UART pins' GPIO port (PORT A)*/
	RCC->AHB1ENR |= GPIOAEN;

	/*Set PA2 mode to alternate function mode*/
	GPIOA->MODER &=~(1U<<4);
	GPIOA->MODER |= (1U<<5);

	/*Set PA3 mode to alternate function mode*/
	GPIOA->MODER &=~(1U<<6);
	GPIOA->MODER |= (1U<<7);

	/*Set PA2 alternate function type to UART_TX (AF07)*/
	GPIOA->AFR[0] |=(1U<<8);
	GPIOA->AFR[0] |=(1U<<9);
	GPIOA->AFR[0] |=(1U<<10);
	GPIOA->AFR[0] &=~(1U<<11);

	/*Set PA3 alternate function type to UART_RX (AF07)*/
	GPIOA->AFR[0] |=(1U<<12);
	GPIOA->AFR[0] |=(1U<<13);
	GPIOA->AFR[0] |=(1U<<14);
	GPIOA->AFR[0] &=~(1U<<15);

	/************Configure UART module*****************/

	/*Enable clock access to UART module*/
	RCC->APB1ENR |= UART2EN;

	/*Disable UART module*/
	USART2->CR1 &=~CR1_UE;

	/*Set UART baudrate*/
	USART2->BRR =  compute_uart_bd(APB1_CLK,UART_BAUDRATE);

	/*Set transfer direction*/
	USART2->CR1 = (CR1_TE | CR1_RE);

	/*Enable UART module*/
	USART2->CR1 |= CR1_UE;


}

void debug_uart_write(int ch)
{
	/*Make sure the transmit data register is empty*/
	while(!(USART2->SR & SR_TXE)){}

	/*Write to transmit data register*/
	USART2->DR  =  (ch & 0xFF);
}

static uint16_t compute_uart_bd(uint32_t periph_clk, uint32_t baudrate)
{
	return ((periph_clk + (baudrate/2U))/baudrate);
}

