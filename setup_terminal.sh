cp tmux/tmux.conf ~/.tmux.conf
cp tmux/tmux.conf.local ~/.tmux.conf.local
mkdir -p ~/.config/nvim
cp -r config/nvim ~/.config
cp clang-format ~ 

git clone --branch v0.12.5 --depth 1 https://github.com/neovim/neovim.git
cd neovim
make CMAKE_BUILD_TYPE=Release CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local"
make install

echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
echo 'alias vi=nvim' >> ~/.bashrc
echo 'alias vim=nvim' >> ~/.bashrc
source ~/.bashrc

mkdir -p ~/.local/bin

curl -L https://github.com/tree-sitter/tree-sitter/releases/latest/download/tree-sitter-linux-x64.gz \
  | gunzip > ~/.local/bin/tree-sitter

chmod +x ~/.local/bin/tree-sitter

nvim --headless "+Lazy! sync" "+qall"

# Install Treesitter parsers
nvim --headless "+lua require('nvim-treesitter').install({'javascript', 'python', 'typescript', 'cpp', 'cmake', 'bash', 'java', 'c', 'lua'})" "+qa"
#nvim --headless "+TSInstall javascript typescript cpp cmake bash java c lua" "+qall"

#git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
#
##
## ====> go to packer.lua do :so and :PackerSync
## ====> you have to type ":so" and then ":PackerSync" otherwise it wont work
### this is to download the packages
### run :checkHealth to ensure everything was downloaded
##nvim +':so | :PackerSync | :checkHealth' ~/.config/nvim/lua/alon/packer.lua
##
### configure darkone theme for terminal
#wget https://raw.githubusercontent.com/r3tex/one-dark/master/dircolors\
#    -O ~/.dircolors
#wget https://raw.githubusercontent.com/r3tex/one-dark/master/onedark_prompt.sh\
#    -O ~/.onedark_prompt.sh
#wget https://raw.githubusercontent.com/r3tex/one-dark/master/bashrc -O\
#    - >> ~/.bashrc
#
#. ~/.bashrc
#
## need to install decent UTF-8 fonts, https://github.com/r3tex/one-dark recommends 
##  Julia Mono with NerdFont
#https://github.com/ryanoasis/nerd-fonts/archive/refs/tags/v3.2.1.tar.gz
#tar zxvf v3.2.1.tar.gz
#cd nerd-fonts-3.2.1
## ? do i need to install nerd-fonts ? if yes use ./install.sh
#wget https://github.com/cormullion/juliamono/releases/download/v0.057/JuliaMono-ttf.tar.gz
#tar zxvf JuliaMono-ttf.tar.gz
#python3 ./font-patcher --mono --complete --careful JuliaMono-Regular.ttf
