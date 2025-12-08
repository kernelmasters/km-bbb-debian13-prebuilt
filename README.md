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
`U-Boot SPL 2022.04-g00ee8651-dirty (Dec 08 2025 - 17:22:13 +0530)`

U-Boot Version:
`U-Boot 2022.04-g00ee8651-dirty (Dec 08 2025 - 17:22:13 +0530)`
`Source: https://github.com/kernelmasters/km-bbb-uboot-2022.git - branch: km-bbb-porting-wip-1 commit: `e73db0419d86fa58aa62203308779a2feea6e964

Kernel Version:
`Linux km-bbb-expansion-board 5.10.168-Kernel-Masters+ #1 SMP PREEMPT Mon Dec 8 17:10:40 IST 2025 armv7l GNU/Linux`
`Source: https://github.com/kernelmasters/km-bbb-kernel-5.10.git - branch: km-bbb-porting-wip-2 commit: e0fac52f4db4ca3125e9c31df68b92535a7d12c6`
