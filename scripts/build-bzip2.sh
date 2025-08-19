#!/bin/bash

mkdir -p builds/bzip2
cd tmp/bzip2
meson setup --prefix /usr ../../builds/bzip2

ninja -C ../../builds/bzip2

cd ../../