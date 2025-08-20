#!/bin/bash
set -e

mkdir -p build/ncurses
cd tmp/ncurses-6.5

./configure --with-shared --without-cxx-binding --with-termlib --enable-widec --with-versioned-syms --prefix=/usr

make CXX="clang++" CC="clang" -j$(nproc)

make -j$(nproc) DESTDIR=$(realpath ../../build/ncurses) install

ln -sf ./libncursesw.so.6 $(realpath ../../build/ncurses)/usr/lib/libncurses.so.6
ln -sf ./libtinfow.so.6   $(realpath ../../build/ncurses)/usr/lib/libtinfo.so.6

cd ../..

tar -czf done/ncurses.tar.gz -C build/ncurses .