#wget https://developer.download.nvidia.com/embedded/L4T/bootlin/toolchain-sources_toolchains.bootlin.com-2020.08-1.tar.bz2
#wget https://developer.download.nvidia.com/embedded/L4T/r35_Release_v3.1/sources/public_sources.tbz2
#wget https://developer.nvidia.com/downloads/embedded/l4t/r35_release_v4.1/sources/public_sources.tbz2

KERNEL_SRCS_URL="https://developer.download.nvidia.com/embedded/L4T/r35_Release_v3.1/sources/public_sources.tbz2"
TOOLS_URL="https://developer.download.nvidia.com/embedded/L4T/bootlin/aarch64--glibc--stable-final.tar.gz"

BASE_DIR=~/build

mkdir $BASE_DIR
mkdir $BASE_DIR/x-tools
mkdir $BASE_DIR/jetson_kernel/

cd $BASE_DIR
wget $TOOLS_URL
wget $KERNEL_SRCS_URL

tar xvf $(basename "$TOOLS_URL") -C "$BASE_DIR/x-tools"
tar xvf $(basename "$KERNEL_SRCS_URL") -C "$BASE_DIR/jetson_kernel"
cd $BASE_DIR/jetson_kernel/Linux_for_Tegra/source/public
tar xvf kernel_src.tbz2
mkdir kernel_out
export KERNEL_OUT=$PWD/kernel_out
export CROSS_COMPILE_AARCH64=$BASE_DIR/x-tools/bin/aarch64-buildroot-linux-gnu-
export CROSS_COMPILE_AARCH64_PATH=$BASE_DIR/x-tools/
./nvbuild.sh -o $KERNEL_OUT
