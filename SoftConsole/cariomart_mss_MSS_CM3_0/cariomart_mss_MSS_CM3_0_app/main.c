#include <stdlib.h>
#include <stdio.h>
#include "lcd.h"
#include "utility.h"
#include "xbee.h"
#include "mux.h"
#include "drivers/mss_uart/mss_uart.h"
#include "drivers/mss_timer/mss_timer.h"

int race_status;

__attribute__ ((interrupt)) void Fabric_IRQHandler( void ) {
	printf("Interrupt triggered\r\n");
	race_status = 1;
	NVIC_ClearPendingIRQ( Fabric_IRQn );
}

int main() {
	//XBEE_init();
	//LCD_init();
	NVIC_EnableIRQ(Fabric_IRQn);

	race_status = 0;

	printf("System Initialized\r\n");

	while(1);

	/*while(1) {
		MSS_TIM2_init(MSS_TIMER_ONE_SHOT_MODE);
		MSS_TIM2_load_immediate(125823134);
		MSS_TIM2_start();
		LCD_showRaceIntro();
		srand(MSS_TIM1_get_current_value());

		delay(1000);

		NVIC_EnableIRQ(Fabric_IRQn);

		while (race_status == 0);

		NVIC_DisableIRQ(Fabric_IRQn);

		LCD_countdown();

		// Broadcast the race status
		XBEE_send("0,1\r\n");

		LCD_startTimer();

		int leaderboard_shown = 0, lap_stats = 1;
		p1lap = 1, p2lap = 1, p1powerup = 0, p2powerup = 0;

		while (1) {
			// Show the leaderboard if any player is in second lap
			if (!leaderboard_shown && (p1lap > 1 || p2lap > 1)) {
				LCD_showLeaderboard();
				leaderboard_shown = 1;
			}

			// Check for a winner
			if (p1lap >= 4) {
				LCD_stopTimer();
				LCD_clear();
				LCD_setTextProps(39, 55, 0);
				LCD_print("Player 1 Wins!");
				break;
			}
			else if (p2lap >= 4) {
				LCD_stopTimer();
				LCD_clear();
				LCD_setTextProps(39, 55, 0);
				LCD_print("Player 2 Wins!");
				break;
			}

			// Update the leaderboard when someone crosses the finish line
			if (leaderboard_shown && lap_stats == p1lap && p2lap > p1lap) {
				LCD_showP2first();
				++lap_stats;
			}
			else if (leaderboard_shown && lap_stats == p2lap && p1lap > p2lap) {
				LCD_showP1first();
				++lap_stats;
			}
			else lap_stats = (p1lap > p2lap) ? p1lap : p2lap;

			// Handle powerups
			if (p1powerup) {
				if (rand() % 2 == 0) XBEE_send("4,0\r\n");
				else XBEE_send("5,1\r\n");
				p1powerup = 0;
			}
			if (p2powerup) {
				if (rand() % 2 == 0) XBEE_send("5,0\r\n");
				else XBEE_send("4,1\r\n");
				p2powerup = 0;
			}
		}

		// Game over, stop the cars and timer
		XBEE_send("0,0\r\n");
		race_status = 0;
		delay(10000);
	}*/
}
