#!/bin/bash

mkdir builds/nano
cd tmp/nano

./autogen.sh

cd ../../builds/nano
../../tmp/nano/configure --prefix=/usr
make -j$(nproc)