if [ -f /etc/arch-release ]; then
    echo "Installing on Arch Linux ... "
    sudo pacman -Syu
    sudo pacman -S --noconfirm riscv64-linux-gnu-binutils riscv64-linux-gnu-gcc riscv64-linux-gnu-gdb qemu-arch-extra
    sudo pacman -S --noconfirm gettext luarocks ripgrep tmux gcc cmake git base-devel linux-headers
    # no g++ or cla--noconfirm ng-format
    sudo pacman -S --noconfirm base-devel bison flex gawk ncurses texinfo unzip libtool gperf help2man gcc libtool automake git expat openssl patch curl python
    sudo pacman -S --noconfirm bison clang flex git llvm make maven swig cmake curl gcc libx11 libxml2 libxt python zlib llvm gtest zip jdk21-openjdk
    sudo pacman -S --noconfirm clang
elif [ -f /etc/lsb-release ] && grep -q "Ubuntu" /etc/lsb-release; then
    echo "Ubuntu"
    sudo apt-get update
    sudo apt-get install -y gettext luarocks ripgrep tmux clang-format gcc g++ cmake git \
         build-essential linux-headers-generic libevent libevent-dev
    sudo apt-get install -y git build-essential gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu
    sudo apt-get install -y build-essential bison flex gawk libncurses5-dev texinfo unzip libtool-bin gperf help2man g++ libtool automake git cvs subversion libexpat-dev libssl-dev patch curl
    sudo apt-get install -y python3 fontforge python3-fontforge
    sudo apt-get install -y bison clang flex git llvm make maven swig cmake \
        curl g++ libx11-dev libxml2-dev libxt-dev libmotif-common libmotif-dev \
        python3-dev zlib1g-dev llvm-dev libclang-dev libudunits2-dev \
        libgtest-dev openjdk-11-jdk zip
else
    echo "Unknown distro - exiting"
    exit 0
fi
