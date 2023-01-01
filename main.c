
#include <avr/io.h>
#include <util/delay.h>

int main() {
	while (1) {
    PORTB ^= 2;
    _delay_ms(500);
  }
}
