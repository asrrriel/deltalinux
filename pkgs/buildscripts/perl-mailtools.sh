#!/bin/bash
set -e

mkdir -p build/perl-mailtools
cd tmp/perl_mailtools

perl Makefile.PL PREFIX=/usr INSTALLDIRS=vendor

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/perl-mailtools) install

cd ../..

tar -czf done/perl-mailtools.tar.gz -C build/perl-mailtools .