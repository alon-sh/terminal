cp tmux/tmux.conf ~/.tmux.conf
cp tmux/tmux.conf.local ~/.tmux.conf.local
cp -r config/nvim ~/.config/nvim
cp clang-format ~ 
sudo apt-get update
sudo apt-get install -y gettext luarocks ripgrep tmux clang-format gcc g++ cmake git \
    build-essential linux-headers-generic

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
vi +':so | :PackerSync | :checkHealth' ~/.config/nvim/lua/alon/packer.lua

# configure darkone theme for terminal
wget https://raw.githubusercontent.com/r3tex/one-dark/master/dircolors\
    -O ~/.dircolors
wget https://raw.githubusercontent.com/r3tex/one-dark/master/onedark_prompt.sh\
    -O ~/.onedark_prompt.sh
wget https://raw.githubusercontent.com/r3tex/one-dark/master/bashrc -O\
    - >> ~/.bashrc

. ~/.bashrc
