cp .tmux.conf ..
cp -r .config/nvim ../.config/nvim
cp clang-format ..
sudo apt-get update
sudo apt-get install gettext ripgrep tmux clang-format gcc g++ cmake git build-essential linux-headers-generic
#sudo dnf install ripgrep tmux clang

git clone https://github.com/neovim/neovim.git
cd neovim
git checkout release-0.9

make CMAKE_BUILD_TYPE=Release \
     CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=$HOME/.local"
make install

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

# go to packer.lua do :so and :PackerSync
#
echo 'export PATH=~/.local/bin:$PATH' >> ~/.bashrc
echo 'alias vi=nvim' >> ~/.bashrc
echo 'alias vim=nvim' >> ~/.bashrc
