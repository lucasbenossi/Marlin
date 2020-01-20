#!/bin/bash

pio run || exit

scp .pio/build/mega2560/firmware.hex pi@raspberrypi.local:/home/pi || exit

ssh pi@raspberrypi.local avrdude -p m2560 -c stk500v2 -P /dev/ttyUSB0 -U flash:w:firmware.hex -v -D || exit