#!/bin/bash

mkdir builds/glibc
cd builds/glibc

../../tmp/glibc/configure --libdir=/lib --prefix=/usr

make -j$(nproc)
