#include <stdio.h>
#include <string.h>
#include "esp82xx_driver.h"
#include "circular_buffer.h"



extern portType esp82xx_port;
extern portType debug_port;


static void esp82xx_reset(void);
static void esp82xx_startup_test(void);
static  void esp82xx_sta_mode(void);
static  void esp82xx_ap_connect(char *ssid, char *password);
static void esp82xx_get_local_ip(void);
static void esp82xx_multi_conn_en(void);
static void esp82xx_create_tcp_server(void);


void esp82xx_sever_init(char * ssid, char *password)
{
	circular_buffer_init();
	esp82xx_reset();
	esp82xx_startup_test();
	esp82xx_sta_mode();
	esp82xx_ap_connect(ssid,password);
	esp82xx_get_local_ip();
	esp82xx_multi_conn_en();
	esp82xx_create_tcp_server();




}
/*Reset esp82xx*/

 static void esp82xx_reset(void)
{
	/*Send reset command*/
	buffer_send_string("AT+RST\r\n",esp82xx_port);

	/*Delay for 1 second*/
	systick_delay_ms(1000);

	/*Wait for "OK" response*/
	while(! (is_response("OK\r\n"))){}

	buffer_send_string("Reset was successful...\n\r",debug_port);
}


 /*Test AT startup*/
 static void esp82xx_startup_test(void)
 {
	 /*Clear esp uart buffer*/
	 buffer_clear(esp82xx_port);

	 /*Send test command*/
	buffer_send_string("AT\r\n",esp82xx_port);



     /*Wait for "OK" response*/
	while(! (is_response("OK\r\n"))){}

	buffer_send_string("AT Startup test successful...\n\r",debug_port);

}

 /*Enable station mode*/
 static  void esp82xx_sta_mode(void)
 {
	 /*Clear esp uart buffer*/
	 buffer_clear(esp82xx_port);

	 /*Send STA command*/
	buffer_send_string("AT+CWMODE=1\r\n",esp82xx_port);

    /*Wait for "OK" response*/
	while(! (is_response("OK\r\n"))){}

	buffer_send_string("STA Mode set successfully...\n\r",debug_port);

 }


 /*Connect to Access Apoint (AP)*/

 static  void esp82xx_ap_connect(char *ssid, char *password)
 {
	 char data[80];

	 /*Clear esp uart buffer*/
	 buffer_clear(esp82xx_port);

	 buffer_send_string("Connecting to access point...\n\r",debug_port);

	 /*Put ssid,password  and command into one packet*/
	 sprintf(data,"AT+CWJAP=\"%s\",\"%s\"\r\n",ssid,password);

	 /*Send entire packet to esp uart*/
	 buffer_send_string(data,esp82xx_port);

	  /*Wait for "OK" response*/
	 while(! (is_response("OK\r\n"))){}

	 sprintf(data, "Connected : \"%s\"\r\n",ssid);

	 buffer_send_string(data,debug_port);

 }

 /*Get device local IP address*/

 static void esp82xx_get_local_ip(void)
 {
	 char data[80];
	 char buffer[20];
	 int len;

	 /*Clear buffer*/
	 buffer_clear(esp82xx_port);

	 /*Send 'get ip address ' command*/
	 buffer_send_string("AT+CIFSR\r\n",esp82xx_port);

	 /*Wait for 'Station IP'  response*/
	 while(!(is_response("CIFSR:STAIP,\""))){}

	 /*Copy IP address portion*/
	 while(!(copy_up_to_string("\"",buffer))){}

	  /*Wait for "OK" response*/
	 while(! (is_response("OK\r\n"))){}

	 len = strlen(buffer);

	 buffer[len - 1] = '\0';

	 sprintf(data,"Local IP Address :  %s \r\n",buffer);

	 buffer_send_string(data,debug_port);


 }

 /*Enable multiple connections*/
 static void esp82xx_multi_conn_en(void)
 {
	 /*Clear buffer*/
	 buffer_clear(esp82xx_port);

	 /*Send 'enable multi conn cmd'*/
	 buffer_send_string("AT+CIPMUX=1\r\n",esp82xx_port);

	  /*Wait for "OK" response*/
	 while(! (is_response("OK\r\n"))){}

	 buffer_send_string("Multiple connections enabled....\n\r",debug_port);

 }


 /*Creat tcp server*/

 static void esp82xx_create_tcp_server(void)
 {
	 /*Clear buffer*/
	 buffer_clear(esp82xx_port);

	 /*Send 'create tcp server cmd'*/
	 buffer_send_string("AT+CIPSERVER=1,80\r\n",esp82xx_port);

	  /*Wait for "OK" response*/
	 while(! (is_response("OK\r\n"))){}

	 buffer_send_string("Please connect to the Local IP above....\n\r",debug_port);

 }


 /*Send data to the server*/

 int8_t send_server_data(char *str, int Link_ID)
 {
	 char data[80];

	 /*Get length of data to send*/
	 int len = strlen(str);

	 /*Send link id and data length*/
	 sprintf(data,"AT+CIPSEND=%d,%d\r\n",Link_ID,len);
	 buffer_send_string(data,esp82xx_port);

	  /*Wait for ">" response*/
	  while(! (is_response(">"))){}

	  /*Send data*/
	  buffer_send_string(str,esp82xx_port);

	  /*Wait for "SEND OK" response*/
	   while(! (is_response("SEND OK"))){}

	  /*Close connection*/
	   sprintf(data,"AT+CIPCLOSE=5\r\n");
	   buffer_send_string(data,esp82xx_port);

		/*Wait for "OK" response*/
	   while(! (is_response("OK\r\n"))){}

	   return 1;

 }

void USART1_IRQHandler(void)
{
	esp82_uart_callback();
}


void USART2_IRQHandler(void)
{
	debug_uart_callback();
}
