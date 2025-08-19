#!/bin/bash

mkdir -p tmp
cd tmp

git clone https://github.com/torvalds/linux --depth=1

git clone https://sourceware.org/git/glibc.git --depth=1

wget https://ftp.gnu.org/gnu/ncurses/ncurses-6.5.tar.gz
tar -xvzf ncurses-6.5.tar.gz

git clone https://github.com/notnekodev/jash --depth=1

git clone https://github.com/limine-bootloader/limine/ --branch=v8.x --depth=1

git clone https://git.savannah.gnu.org/git/bash.git --depth=1

git clone https://github.com/coreutils/coreutils.git --depth=1

git clone https://github.com/util-linux/util-linux.git --depth=1

git clone https://git.savannah.gnu.org/git/nano.git --depth=1

git clone https://github.com/systemd/systemd.git --depth=1