#!/bin/bash
set -e

mkdir -p build/perl-error
cd tmp/Error-0.17030

perl Makefile.PL PREFIX=/usr INSTALLDIRS=vendor

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/perl-error) install

cd ../..

tar -czf done/perl-error.tar.gz -C build/perl-error .