#!/bin/bash

mkdir builds/bash

cd builds/bash

../../tmp/bash/configure --prefix=/usr

make -j$(nproc)