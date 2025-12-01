# Purpose of these scripts

These scripts are used to flash custom built u-boot and kernel images on a live target instead of flashing to a SD card. The target should be using Debian 13 image or similar from Kernel Masters.

# Location of these scripts on target

There should a directory named "install" on target in home directory for user 'km'. Anytime you use the Kernel Masters install scripts from (uboot-2022 or 5.10-kernel) repository provided by Kernel Masters, the images will copied from your Ubuntu VM to target's "install" directory. Then from the shell session on target, "km-bbb-install-kernel-mmc.sh" can be used to flash the new kernel image to the current storage (eMMC or SD Card) of the live system and "km-bbb-install-bl-mmc.sh" can used flash the new u-boot image similarly.
