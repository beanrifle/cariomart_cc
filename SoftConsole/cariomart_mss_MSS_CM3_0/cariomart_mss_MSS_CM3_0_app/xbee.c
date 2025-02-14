#include "xbee.h"
#include "mux.h"
#include "drivers/mss_uart/mss_uart.h"
#include "hal/hal.h"

void XBEE_init(void) {
	MSS_UART_init(
		&g_mss_uart1,
		MSS_UART_115200_BAUD,
		MSS_UART_DATA_8_BITS | MSS_UART_NO_PARITY | MSS_UART_ONE_STOP_BIT
	);
	MSS_UART_set_rx_handler( &g_mss_uart1, XBEE_rx_handler, MSS_UART_FIFO_SINGLE_BYTE);
}

void XBEE_send(char* data) {
	psr_t interrupt_status = HAL_disable_interrupts();
	MUX_changeSource(0);
	MSS_UART_polled_tx_string( &g_mss_uart1, (uint8_t*)data);
	delay(5);
	HAL_restore_interrupts(interrupt_status);
}

void XBEE_rx_handler( mss_uart_instance_t * this_uart ) {
	char rx_buff[1];
	char recieved_data[50];
	int rx_size = MSS_UART_get_rx( this_uart, (uint8_t*)rx_buff, sizeof(rx_buff) );
	if (*rx_buff == '\r' || *rx_buff == '\n') rx_size = MSS_UART_get_rx( this_uart, (uint8_t*)rx_buff, sizeof(rx_buff) );
	if (*rx_buff == '\r' || *rx_buff == '\n') rx_size = MSS_UART_get_rx( this_uart, (uint8_t*)rx_buff, sizeof(rx_buff) );

	int i = 0, no_rcv = 0;
	while (*rx_buff != '\n' && *rx_buff != '\r' && i < 50 && no_rcv < 500) {
		if (rx_size > 0 ) {
			recieved_data[i++] = *rx_buff;
			no_rcv = 0;
		}
		else no_rcv++;
		rx_size = MSS_UART_get_rx( this_uart, (uint8_t*)rx_buff, sizeof(rx_buff) );
	}
	recieved_data[i] = '\0';

	// Process the packet string recieved data, i is the length of the recieved data

	// Car packet reception for telling race time and powerup status
	// Packet structure is: "1,{player},{event}\r\n"
	// {player} is either 1 or 2
	// {event} is either 0 for crossed the finish line or 1 for collected powerup
	if (recieved_data[0] == '1') {

		// Player 1
		if (recieved_data[2] == '1') {
			if (recieved_data[4] == '0') p1lap++;
			else if (recieved_data[4] == '1') p1powerup = 1;
		}

		// Player 2
		else if (recieved_data[2] == '2') {
			if (recieved_data[4] == '0') p2lap++;
			else if (recieved_data[4] == '1') p2powerup = 1;
		}
	}
}
