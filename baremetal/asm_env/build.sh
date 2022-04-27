#!/bin/bash

# Remove old files
rm *.out

# Build
arm-linux-gnueabi-as -g -mthumb start.S
arm-linux-gnueabi-ld -T start.ld -o a.elf a.out
arm-linux-gnueabi-objcopy -O binary a.elf  a.bin

# Upload
st-flash write a.bin 0x08000000	
