#!/bin/bash

mkdir -p pkgs/tmp
cd pkgs/tmp

git clone https://github.com/torvalds/linux --depth=1

git clone https://sourceware.org/git/glibc.git --depth=1

if [ ! -f ncurses-6.5.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/ncurses/ncurses-6.5.tar.gz
    tar -xvzf ncurses-6.5.tar.gz
fi

if [ ! -f tar-1.35.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/tar/tar-1.35.tar.gz
    tar -xvzf tar-1.35.tar.gz
fi

if [ ! -f gettext-0.26.tar.gz ]; then
    wget https://ftp.gnu.org/pub/gnu/gettext/gettext-0.26.tar.gz
    tar -xvzf gettext-0.26.tar.gz
fi

if [ ! -f kmod-34.tar.gz ]; then
    wget https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-34.tar.gz
    tar -xvzf kmod-34.tar.gz
fi

https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-34.tar.gz

git clone https://github.com/limine-bootloader/limine/ --branch=v8.x --depth=1

git clone https://git.savannah.gnu.org/git/bash.git --depth=1

git clone https://github.com/coreutils/coreutils.git --depth=1

git clone https://github.com/util-linux/util-linux.git --depth=1

git clone https://git.savannah.gnu.org/git/nano.git --depth=1

git clone https://github.com/systemd/systemd.git --depth=1

git clone https://github.com/madler/zlib --depth=1

git clone https://github.com/file/file --depth=1

git clone https://gitlab.com/bzip2/bzip2.git --depth=1 --branch=bzip2-1.0.8

git clone https://github.com/seccomp/libseccomp --branch=release-2.6 --depth=1

git clone https://github.com/tukaani-project/xz --depth=1

git clone https://github.com/facebook/zstd --branch=v1.5.7 --depth=1

git clone https://git.savannah.nongnu.org/git/acl.git --depth=1

git clone https://git.savannah.nongnu.org/git/attr.git --depth=1

git clone https://git.savannah.gnu.org/git/readline.git --depth=1

git clone https://github.com/PCRE2Project/pcre2 --depth=1

git clone https://git.savannah.gnu.org/git/grep.git --depth=1

git clone https://git.savannah.gnu.org/git/sed.git --depth=1

git clone https://git.savannah.gnu.org/git/gzip.git --depth=1

git clone http://github.com/GNOME/libxml2 --depth=1

git clone https://github.com/legionus/kbd/ --depth=1