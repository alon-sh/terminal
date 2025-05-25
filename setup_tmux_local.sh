wget https://github.com/libevent/libevent/archive/refs/tags/release-2.1.12-stable.tar.gz
cd libevent-release-2.1.12-stable
libtoolize --force
aclocal
autoheader
automake --force-missing --add-missing
autoconf
./configure
./configure --prefix=$HOME/.local --enable-shared
make && make install

wget https://github.com/tmux/tmux/archive/refs/tags/3.5a.tar.gz
tar -zxf 3.5a.tar.gz
cd tmux-3.5a
libtoolize --force
aclocal
autoheader
automake --force-missing --add-missing
autoconf
./configure
 
PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig ./configure --prefix=$HOME/.local

make && make install
