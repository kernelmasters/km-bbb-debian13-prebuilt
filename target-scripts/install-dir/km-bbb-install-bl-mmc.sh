#!/bin/sh

echo "---------------------------------------------"
if [ -z $1 ]
then
        echo "Command Usage: $0 </dev/mmcblkx>"
        echo "x indicates 0(SDCARD) or 1(EMMC)"
	echo "---------------------------------------------"
        exit 0
fi

if [ $1 = "/dev/mmcblk1" ] || [ $1 = "/dev/mmcblk0" ] ; then
	echo "Installing MLO image"
        sudo dd if=MLO of=$1 count=2 seek=1 bs=128k
	echo "Installing u-boot image"
        sudo dd if=u-boot.img of=$1 count=4 seek=1 bs=384k
        sync
fi
echo "---------------------------------------------"
