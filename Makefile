DEVICE = attiny85
AVRDUDE = avrdude -p $(DEVICE) -c avrispv2 -P /dev/cu.usbmodem001432501 -b 38400
CLOCK      = 8000000            # 8Mhz

OBJECTS    = main.o             # Add more objects for each .c file here

# fuse settings:
# use http://www.engbedded.com/fusecalc
#FUSES      = -U lfuse:w:0x62:m -U hfuse:w:0xdf:m -U efuse:w:0xff:m  # 1mhz
FUSES      = -U lfuse:w:0xe2:m -U hfuse:w:0xdf:m -U efuse:w:0xff:m

CFLAGS = -Wall -Os -mmcu=$(DEVICE)
CPPFLAGS = -DF_CPU=$(CLOCK)
CC = avr-gcc

all: main.hex

main.s : main.c
	$(CC) $(CFLAGS) $(CPPFLAGS) -S main.c

clean:
	rm -f main.s main.hex main.elf $(OBJECTS)

# file targets:
main.elf: $(OBJECTS)
	$(CC) $(CFLAGS) $(CPPFLAGS) -o main.elf $(OBJECTS)

main.hex: main.elf
	avr-objcopy -j .text -j .data -O ihex main.elf main.hex
	avr-size --format=avr --mcu=$(DEVICE) main.elf

update : main.hex
	$(AVRDUDE) -U flash:w:main.hex
