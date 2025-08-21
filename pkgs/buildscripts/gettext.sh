#!/bin/bash
set -e

mkdir -p build/gettext
cd tmp/gettext-0.26

./configure --prefix=/usr --without-emacs --disable-java --disable-d --disable-c++

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/gettext) install

cd ../..

tar -czf done/gettext.tar.gz -C build/gettext .