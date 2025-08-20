#!/bin/bash

mkdir -p builds/zstd
cp -r tmp/zstd/* builds/zstd

cd builds/zstd

make -j$(nproc)