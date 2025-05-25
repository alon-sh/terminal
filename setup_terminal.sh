cp tmux/tmux.conf ~/.tmux.conf
cp tmux/tmux.conf.local ~/.tmux.conf.local
mkdir -p ~/.config/nvim
cp -r config/nvim ~/.config
cp clang-format ~ 


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
         build-essential linux-headers-generic
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

git clone --branch release-0.11 --depth 1 https://github.com/neovim/neovim.git
cd neovim
#
make CMAKE_BUILD_TYPE=Release \
     CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local"
make install


git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
echo 'alias vi=nvim' >> ~/.bashrc
echo 'alias vim=nvim' >> ~/.bashrc
source ~/.bashrc
#
# ====> go to packer.lua do :so and :PackerSync
# ====> you have to type ":so" and then ":PackerSync" otherwise it wont work
## this is to download the packages
## run :checkHealth to ensure everything was downloaded
#nvim +':so | :PackerSync | :checkHealth' ~/.config/nvim/lua/alon/packer.lua
#
## configure darkone theme for terminal
wget https://raw.githubusercontent.com/r3tex/one-dark/master/dircolors\
    -O ~/.dircolors
wget https://raw.githubusercontent.com/r3tex/one-dark/master/onedark_prompt.sh\
    -O ~/.onedark_prompt.sh
wget https://raw.githubusercontent.com/r3tex/one-dark/master/bashrc -O\
    - >> ~/.bashrc

. ~/.bashrc

# need to install decent UTF-8 fonts, https://github.com/r3tex/one-dark recommends 
#  Julia Mono with NerdFont
https://github.com/ryanoasis/nerd-fonts/archive/refs/tags/v3.2.1.tar.gz
tar zxvf v3.2.1.tar.gz
cd nerd-fonts-3.2.1
# ? do i need to install nerd-fonts ? if yes use ./install.sh
wget https://github.com/cormullion/juliamono/releases/download/v0.057/JuliaMono-ttf.tar.gz
tar zxvf JuliaMono-ttf.tar.gz
python3 ./font-patcher --mono --complete --careful JuliaMono-Regular.ttf
