# Debian 13 on KM-BBB Expansion Board.

#### Clone this [km-bbb-debian13-prebuilt] reposiotry in your home folder under KM_GITHUB.
```sh
$ mkdir ~/KM_GITHUB
$ cd ~/KM_GITHUB
$ git clone https://github.com/kernelmasters/km-bbb-debian13-prebuilt.git
$ cd ~/KM_GITHUB/km-bbb-debian13-prebuilt/
```

## Install Debian 13 Prebuilt images
### Using SDCard:
1. Enter prebuilt Folder

   `$ cd ~/KM_GITHUB/km-bbb-debian13-prebuilt/prebuilt`
2. Format SD Card with 1 partition and load boot loader images [MLO, u-boot.img] and debian 13 rootfs using the below script.

   `$ sudo ./km-bbb-sdcard-prebuilt-debian13.sh --mmc /dev/[drive]`

   "drive" is sdb or mmcblk0. find out using dmesg command after inserting sd card.
   script run 5 to 10 minutes.
3. Insert SDcard on BBB target and press switch2 and power on board. "km_bootmenu" choose sd card option and now BBB booting from SD card.
4. By default `username:km; password:km` enter login prompt. And update software packages otherwise sudo permission problem encounter.

   `$ sudo apt-get update`


## MLO, U-boot & Kernel Versions

MLO [SPL] Version:
`U-Boot SPL 2022.04-gcb465595-dirty (Dec 02 2025 - 17:34:16 +0530)`

U-Boot Version:
`U-Boot 2022.04-gcb465595-dirty (Dec 02 2025 - 17:34:16 +0530)`
`Source: https://github.com/kernelmasters/km-bbb-uboot-2022.git - branch: km-bbb-porting-wip-1 commit: 3decb5fdf48f22c42deed05c930990b881d09d2a`

Kernel Version:
`Linux km-bbb-expansion-board 5.10.168-Kernel-Masters+ #1 SMP PREEMPT Tue Dec 2 19:55:18 IST 2025 armv7l GNU/Linux`
`Source: https://github.com/kernelmasters/km-bbb-kernel-5.10.git - branch: km-bbb-porting-wip-1 commit: f159b08eef6be0c62618d90f0f0e673c8538ac6b`
