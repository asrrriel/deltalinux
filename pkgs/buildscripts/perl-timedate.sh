#!/bin/bash
set -e

mkdir -p build/perl-timedate
cd tmp/perl_timedate

perl Makefile.PL PREFIX=/usr INSTALLDIRS=vendor

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/perl-timedate) install

cd ../..

tar -czf done/perl-timedate.tar.gz -C build/perl-timedate .