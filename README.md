# ATtiny85 sample

## Program using Micronucleus

See: https://github.com/aabbtree77/digispark-attiny85-command-line

### Burn bootloader

The programmer and port settings are correct for my system only.

```sh
cd micronucleus-master/firmware/releases
avrdude -c avrispv2 -P /dev/cu.usbmodem001432501 -b 38400 -p t85 -U flash:w:t85_default.hex
#avrdude -c avrispv2 -P /dev/cu.usbmodem001432501 -b 38400 -p t85 -U lfuse:w:0x62:m -U hfuse:w:0xdf:m -U efuse:w:0xfe:m

# make CONFIG=t85_default fuse
avrdude -c avrispv2 -P /dev/cu.usbmodem001432501 -b 38400 -p attiny85  -U lfuse:w:0xe1:m -U hfuse:w:0xdd:m -U efuse:w:0xfe:m -B 20
```

Can use [this tool](http://eleccelerator.com/fusecalc/fusecalc.php?chip=attiny85) to verify fuse settings.

Burn bootloader:

```sh
$ cd ../micronucleus/firmware/releases/
$ avrdude -c avrispv2 -P /dev/cu.usbmodem001432501 -b 38400 -p t85 -U flash:w:t85_default.hex

avrdude: AVR device initialized and ready to accept instructions

Reading | ################################################## | 100% 0.02s

avrdude: Device signature = 0x1e930b (probably t85)
avrdude: NOTE: "flash" memory has been specified, an erase cycle will be performed
         To disable this feature, specify the -D option.
avrdude: erasing chip
avrdude: reading input file "t85_default.hex"
avrdude: input file t85_default.hex auto detected as Intel Hex
avrdude: writing flash (8170 bytes):

Writing | ################################################## | 100% 0.00s

avrdude: 8170 bytes of flash written
avrdude: verifying flash memory against t85_default.hex:
avrdude: input file t85_default.hex auto detected as Intel Hex

Reading | ################################################## | 100% 0.00s

avrdude: 8170 bytes of flash verified

avrdude done.  Thank you.
```

Set fuses:

```sh
$ avrdude -c avrispv2 -P /dev/cu.usbmodem001432501 -b 38400 -p attiny85  -U lfuse:w:0xe1:m -U hfuse:w:0xdd:m -U efuse:w:0xfe:m -B 20

avrdude: AVR device initialized and ready to accept instructions

Reading | ################################################## | 100% 0.03s

avrdude: Device signature = 0x1e930b (probably t85)
avrdude: reading input file "0xe1"
avrdude: writing lfuse (1 bytes):

Writing | ################################################## | 100% 0.02s

avrdude: 1 bytes of lfuse written
avrdude: verifying lfuse memory against 0xe1:

Reading | ################################################## | 100% 0.01s

avrdude: 1 bytes of lfuse verified
avrdude: reading input file "0xdd"
avrdude: writing hfuse (1 bytes):

Writing | ################################################## | 100% 0.02s

avrdude: 1 bytes of hfuse written
avrdude: verifying hfuse memory against 0xdd:

Reading | ################################################## | 100% 0.01s

avrdude: 1 bytes of hfuse verified
avrdude: reading input file "0xfe"
avrdude: writing efuse (1 bytes):

Writing | ################################################## | 100% 0.02s

avrdude: 1 bytes of efuse written
avrdude: verifying efuse memory against 0xfe:

Reading | ################################################## | 100% 0.01s

avrdude: 1 bytes of efuse verified

avrdude done.  Thank you.

```
