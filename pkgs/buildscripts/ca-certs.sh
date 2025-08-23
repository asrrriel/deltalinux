#!/bin/bash
set -e

mkdir -p build/ca-certs
cd tmp/ca-certs

rpm2cpio *.rpm > ca-certs.cpio

CPIO_PATH=$(realpath ca-certs.cpio)

cd ../../build/ca-certs
cpio -idmv -F $CPIO_PATH
cd ../..

tar -czf done/ca-certs.tar.gz -C build/ca-certs .
