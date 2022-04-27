#!/bin/bash

# used system:
# neo@matrix:~/kernel_rpi/5.15/linux$ cat /etc/issue
# Debian GNU/Linux 11 


# Model: Raspiberry pi zero w

#
# Before start install :
#
# sudo apt install git bc bison flex libssl-dev make libc6-dev libncurses5-dev
# sudo apt install crossbuild-essential-armhf

# the compilation is done outside of raspiberry to avoid time wasting

#
# The raspiberry pi zero w uses the kernel.img as default image
# other plataforms e.g. raspibiberry pi 3 uses kernel7.img
# the  image also can be declared as 
# kernel = image_name e.g.
# kernel = zImage

#name of image without extension
KERNEL=kernel

# disabling automatic mount of sdcards
# to avoid problems with "mount"
# when process is repeated a couple of times
 
sudo systemctl mask udisks2
sudo systemctl unmask udisks2
sudo systemctl unmask udisks2.service
sudo systemctl stop udisks2.service
sudo systemctl status udisks2

#clone the  kernel
#git clone https://github.com/raspberrypi/linux.git

# goto the folder
cd linux


# This is trick. Altough the cat /proc/cpuinfo shows bcm2835, please
# dont use the bcm2835_defconfig to compile the kernel. It's just for
# raspiberry pi 4 instead use bcmrpi_defconfig 

#prepare the basic .config
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- bcmrpi_defconfig

# Here a menu will come up. Do your choices !!
make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- menuconfig

# kernel compilation go to take a coffe
make -j4 ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- zImage modules dtbs



# this part was extracted to install.sh
# todo - organize those scripts

#create partitions
#sudo mkdir  /mnt/fat32
#sudo mkdir /mnt/ext4


# check with lsblk which partitions are yours
# and mout it

#sudo mount /dev/mmcblk0p1 /mnt/fat32
#sudo mount /dev/mmcblk0p2 /mnt/ext4

#compilation
#sudo env PATH=$PATH make ARCH=arm CROSS_COMPILE=arm-linux-gnueabihf- INSTALL_MOD_PATH=/mnt/ext4 modules_install

# I dont do th backup.. I am taking the risk
# sudo cp mnt/fat32/$KERNEL.img mnt/fat32/$KERNEL-backup.img
#sudo cp ./arch/arm/boot/zImage /mnt/fat32/$KERNEL.img
#sudo cp ./arch/arm/boot/dts/*.dtb /mnt/fat32/
#sudo cp ./arch/arm/boot/dts/overlays/*.dtb* /mnt/fat32/overlays/
#sudo cp ./arch/arm/boot/dts/overlays/README /mnt/fat32/overlays/
#sudo umount /mnt/fat32
#sudo umount /mnt/ext4




