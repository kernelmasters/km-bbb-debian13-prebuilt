#!/bin/sh

if [ -f uEnv.txt ]; then
	KERNEL_UTS=$( grep uname_r  uEnv.txt | sed 's/uname_r=//g')
	echo "---------------------------------------------"
	echo "Found uname_r: $KERNEL_UTS"
	echo "---------------------------------------------"
	echo ""

	sudo rm -rf  /boot/vmlinuz-4.19.94-Kernel-Masters-*
	sudo rm -rf  /boot/config-4.19.94-Kernel-Masters-*
	sudo rm -rf  /boot/System.map-4.19.94-Kernel-Masters-*
	echo "copying vmlinux, config and System.map files"
	echo "---------------------------------------------"
	echo  "cp ${KERNEL_UTS}.zImage /boot/vmlinuz-${KERNEL_UTS}"
	sudo cp ./${KERNEL_UTS}.zImage   /boot/vmlinuz-${KERNEL_UTS}
	echo "cp ./config-${KERNEL_UTS}   /boot/"
	sudo cp ./config-${KERNEL_UTS}   /boot/
	echo "cp ./System.map-${KERNEL_UTS}   /boot/"
	sudo cp ./System.map-${KERNEL_UTS}   /boot/
	echo ""

	sudo rm -rf  /boot/dtbs/4.19.94-Kernel-Masters-*
	#if [ -d "/boot/dtbs/${KERNEL_UTS}" ];then
	#	echo "File is found"
	#else
	#	sudo mkdir -p  /boot/dtbs/${KERNEL_UTS}
	#fi
	#
	#echo  "cp km-bbb-am335x.dtb /boot/dtbs/${KERNEL_UTS} "
	#sudo cp km-bbb-am335x.dtb  /boot/dtbs/${KERNEL_UTS}/
	sudo mkdir -p  /boot/dtbs/${KERNEL_UTS}
	echo "extracting dtb and overlay files"
	echo "---------------------------------------------"
	echo  "tar -xf ./${KERNEL_UTS}-dtbs.tar.gz  -C /boot/dtbs/${KERNEL_UTS}/"
	sudo tar -xf ./${KERNEL_UTS}-dtbs.tar.gz  -C  /boot/dtbs/${KERNEL_UTS}/

	echo ""
	echo "copying uEnv.txt"
	echo "---------------------------------------------"
	echo "sudo cp uEnv.txt /boot/uEnv.txt"
	sudo cp uEnv.txt /boot/uEnv.txt
	echo ""

	sudo rm -rf  /usr/lib/modules/4.19.94-Kernel-Masters-*
	echo "extracting kernel modules"
	echo "---------------------------------------------"
	echo  "tar -xf ./${KERNEL_UTS}-modules.tar.gz  -C /usr/"
	sudo tar -xf ./${KERNEL_UTS}-modules.tar.gz  -C  /usr/
	echo ""

	echo "Removing zImage, dtb, modules, config and System.map"
	echo "---------------------------------------------"
	rm ./${KERNEL_UTS}.zImage
	rm ./config-${KERNEL_UTS}
	rm ./System.map-${KERNEL_UTS}
	#rm am335x-boneblack.dtb
	#rm km-bbb-am335x.dtb
	rm ./${KERNEL_UTS}-dtbs.tar.gz
	rm ./${KERNEL_UTS}-modules.tar.gz
	rm ./uEnv.txt
	echo ""
else
	echo "images not found. install images with SCP"
fi
