cp tmux/tmux.conf ~/.tmux.conf
cp tmux/tmux.conf.local ~/.tmux.conf.local
mkdir -p ~/.config/nvim
cp -r config/nvim ~/.config
cp clang-format ~ 
sudo apt-get update
sudo apt-get install -y gettext luarocks ripgrep tmux clang-format gcc g++ cmake git \
    build-essential linux-headers-generic
sudo apt-get install -y git build-essential gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu
sudo apt-get install -y build-essential bison flex gawk libncurses5-dev texinfo unzip libtool-bin gperf help2man g++ libtool automake git cvs subversion libexpat-dev libssl-dev patch curl
sudo apt-get install -y python3
sudo apt-get install -y bison clang flex git llvm make maven swig cmake \
    curl g++ libx11-dev libxml2-dev libxt-dev libmotif-common libmotif-dev \
    python3-dev zlib1g-dev llvm-dev libclang-dev libudunits2-dev \
    libgtest-dev openjdk-11-jdk zip

git clone --branch release-0.9 --depth 1 https://github.com/neovim/neovim.git
cd neovim

make CMAKE_BUILD_TYPE=Release \
     CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local"
make install

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
echo 'alias vi=nvim' >> ~/.bashrc
echo 'alias vim=nvim' >> ~/.bashrc
source ~/.bashrc

# go to packer.lua do :so and :PackerSync
# this is to download the packages
# run :checkHealth to ensure everything was downloaded
nvim +':so | :PackerSync | :checkHealth' ~/.config/nvim/lua/alon/packer.lua

# configure darkone theme for terminal
wget https://raw.githubusercontent.com/r3tex/one-dark/master/dircolors\
    -O ~/.dircolors
wget https://raw.githubusercontent.com/r3tex/one-dark/master/onedark_prompt.sh\
    -O ~/.onedark_prompt.sh
wget https://raw.githubusercontent.com/r3tex/one-dark/master/bashrc -O\
    - >> ~/.bashrc

. ~/.bashrc
