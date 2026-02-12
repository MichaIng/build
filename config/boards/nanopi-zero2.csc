# Rockchip RK3528 quad core 1/2GB RAM SoC GBe eMMC USB2 USB-C PCIe 2.1
BOARD_NAME="NanoPi Zero2"
BOARD_VENDOR="friendlyelec"
BOARDFAMILY="rk35xx"
BOOTCONFIG="hinlink_rk3528_defconfig"
BOARD_MAINTAINER=""
KERNEL_TARGET="vendor,current,edge"
FULL_DESKTOP="no"
HAS_VIDEO_OUTPUT="no"
BOOT_FDT_FILE="rockchip/rk3528-nanopi-rev01.dtb"
BOOT_SCENARIO="spl-blobs"
IMAGE_PARTITION_TABLE="gpt"
BOOTFS_TYPE="ext4"
BOOTSIZE="512"

function post_family_config__nanopi_zero2_use_mainline_dtb() {
	# Only if mainline kernel is used
	[[ "${BRANCH}" == 'vendor' ]] && return 0

	display_alert "$BOARD" "Using mainline device tree for $BOARD / $BRANCH" 'info'

	declare -g BOOT_FDT_FILE='rockchip/rk3528-nanopi-zero2.dtb'
}
