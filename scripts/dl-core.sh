#!/bin/bash

mkdir -p tmp
cd tmp

git clone https://github.com/torvalds/linux --depth=1

git clone https://sourceware.org/git/glibc.git --depth=1

git clone https://github.com/notnekodev/jash --depth=1

git clone https://github.com/limine-bootloader/limine/ --branch=v8.x --depth=1