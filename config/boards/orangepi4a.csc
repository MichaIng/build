# Allwinner T527 Cortex-A55 octa core 2/4GB RAM GBE eMMC NVMe SPI USB3 WiFi/BT
BOARD_NAME='Orange Pi 4A'
BOARD_MAINTAINER=''
BOARDFAMILY='sun55iw3'
KERNELSOURCE='https://github.com/orangepi-xunlong/linux-orangepi'
KERNELBRANCH='branch:orange-pi-5.15-sun55iw3'
KERNEL_MAJOR_MINOR='5.15'
KERNELPATCHDIR='sun55iw3-legacy'
OVERLAY_PREFIX='sun55i-t527'
KERNEL_TARGET='legacy'
KERNEL_IMAGE_TYPE='Image.gz'
KERNEL_INSTALL_TYPE='zinstall'
NAME_KERNEL='zImage'
BOOT_FDT_FILE='allwinner/sun55i-t527-orangepi-4a.dtb'
IMAGE_PARTITION_TABLE='gpt'

# Adjustments needed for Xunlongs U-Boot source: https://github.com/orangepi-xunlong/u-boot-orangepi/blob/v2018.05-t527/Makefile
post_config_uboot_target()
{
	# xxd used two times
	run_host_command_logged apt-get -qq install xxd device-tree-compiler
	# Replace x86_64 dtc
	run_host_command_logged ln -sf "$(which dtc)" scripts/dtc/dtc
}

post_family_config__orangepi4a_uboot()
{
	BOOTSOURCE='https://github.com/orangepi-xunlong/u-boot-orangepi'
	BOOTBRANCH='branch:v2018.05-t527'
	BOOTPATCHDIR='legacy'
	BOOTCONFIG='sun55iw3p1_t527_defconfig'
	UBOOT_COMPILER='arm-linux-gnueabi-'
	#UBOOT_TARGET_MAP=';;u-boot-sun55iw3p1.bin'
	UBOOT_TARGET_MAP=';;u-boot-sunxi-with-spl.bin'
	#BOOT_SUPPORT_SPI='yes' # rockchip64 only
	ATF_COMPILE='no' # does not prevent ATF compiling if ATFSOURCE is defined
	ATFSOURCE='none'

	write_uboot_platform()
	{
		#dd if="$1/u-boot-sun55iw3p1.bin" of="$2" bs=1k seek=8 conv=notrunc status=progress
		dd if="$1/u-boot-sunxi-with-spl.bin" of="$2" bs=1k seek=8 conv=notrunc status=progress
	}
}
