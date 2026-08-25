# Rockchip RK3588S octa core 2/4/8/16GB RAM SoC 32/64/128/256GB onboard eMMC, otherwise depending on base board
BOARD_NAME="Orange Pi CM5"
BOARDFAMILY="rockchip-rk3588"
BOARD_MAINTAINER=""
KERNEL_TARGET="vendor"
BOOT_FDT_FILE="rockchip/rk3588s-orangepi-cm5.dtb"
BOOTCONFIG="orangepi-cm5-rk3588s_defconfig" # vendor name, not standard, see hook below, set BOOT_SOC below to compensate
BOOT_SOC="rk3588"
BOOT_SCENARIO="spl-blobs"
BOOT_SUPPORT_SPI="yes"
BOOT_SPI_RKSPI_LOADER="yes"
IMAGE_PARTITION_TABLE="gpt"
