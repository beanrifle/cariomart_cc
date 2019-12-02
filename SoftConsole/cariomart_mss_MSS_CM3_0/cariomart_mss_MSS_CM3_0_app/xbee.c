#include "xbee.h"
#include "drivers/mss_uart/mss_uart.h"

void XBEE_init(void) {
	MSS_UART_init(
		&g_mss_uart0,
		MSS_UART_9600_BAUD,
		MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT
	);
}

void XBEE_send(char* data) {
	MSS_UART_polled_tx_string( &g_mss_uart0, (uint8_t*)data);
}
