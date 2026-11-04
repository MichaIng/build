# Cix CD8180 SoC 12 core 8-24GB RAM SPI 2xNVMe 2x2.5GBE USB3 PCIe 4.0
BOARD_NAME="Orange Pi 6"
BOARD_VENDOR="xunlong"
BOARDFAMILY="cix-p1"
KERNEL_TARGET="current,edge,vendor"
KERNEL_TEST_TARGET="current"
FULL_DESKTOP="yes"
BOOT_LOGO="desktop"
BOARD_MAINTAINER=""
INTRODUCED="2026"

# The UEFI firmware in SPI flash can pass a vendor device tree. Boot with its ACPI tables, as Xunlong does.
function post_family_config__orangepi6_acpi_force() {
	declare -g GRUB_CMDLINE_LINUX_DEFAULT="${GRUB_CMDLINE_LINUX_DEFAULT} acpi=force"
}
