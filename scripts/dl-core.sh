#!/bin/bash

mkdir -p tmp
cd tmp

git clone https://github.com/torvalds/linux --depth=1

git clone https://sourceware.org/git/glibc.git --depth=1

if [ ! -f ncurses-6.5.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/ncurses/ncurses-6.5.tar.gz
    tar -xvzf ncurses-6.5.tar.gz
fi

git clone https://github.com/notnekodev/jash --depth=1

git clone https://github.com/limine-bootloader/limine/ --branch=v8.x --depth=1

git clone https://git.savannah.gnu.org/git/bash.git --depth=1

git clone https://github.com/coreutils/coreutils.git --depth=1

git clone https://github.com/util-linux/util-linux.git --depth=1

git clone https://git.savannah.gnu.org/git/nano.git --depth=1

git clone https://github.com/systemd/systemd.git --depth=1

git clone https://github.com/madler/zlib --depth=1

git clone https://github.com/file/file --depth=1

git clone https://gitlab.com/bzip2/bzip2.git --depth=1

git clone https://github.com/seccomp/libseccomp --branch=release-2.6 --depth=1

git clone https://github.com/tukaani-project/xz --depth=1

git clone https://github.com/facebook/zstd --branch=v1.5.7 --depth=1