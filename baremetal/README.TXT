To install toolchain and stlink

#toolchain
sudo apt-get install libc6-armel-cross libc6-dev-armel-cross binutils-arm-linux-gnueabi libncurses5-dev build-essential bison flex libssl-dev bc
sudo apt-get install gcc-arm-linux-gnueabi g++-arm-linux-gnueabi

#stlink
git clone https://github.com/texane/stlink stlink.git
cd stlink.git
cmake .
make
cd bin
sudo cp st-* /usr/local/bin
cd ../lib
sudo cp *.so* /lib32



Reference:

https://www.acmesystems.it/arm9_toolchain


asm_env - contains a basic enviorment to program in asm
c_env   - contains a basic enviorment to program in C / C++ with possibility
to use openocd as debuger

