#!/bin/bash
set -e

mkdir -p build/less
cd tmp/less-679

ac_cv_header_dirent_h=yes ac_cv_func_closedir_void=yes ./configure --prefix=/usr 
make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/less) install

cd ../..

tar -czf done/less.tar.gz -C build/less .