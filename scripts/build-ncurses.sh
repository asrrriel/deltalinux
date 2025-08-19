#!/bin/bash

mkdir builds/ncurses
cd builds/ncurses

export CC=clang
export CXX=clang++
../../tmp/ncurses-6.5/configure --with-shared --without-cxx-binding --with-termlib --enable-widec --with-versioned-syms --prefix=/usr

make CXX="clang++" CC="clang" -j$(nproc)
