#!/bin/bash
set -e

mkdir -p build/perl
cd tmp/perl5

./Configure -des -Dusedevel -Dprefix=/usr -Dvendorprefix=/usr -Dman1dir=/usr/share/man/man1 -Dman3dir=/usr/share/man/man3 -Dpager="/usr/bin/less -isR" -Duseshrplib -Dusethreads

make -j$(nproc)
make -j$(nproc) DESTDIR=$(realpath ../../build/perl) install

cd ../..

tar -czf done/perl.tar.gz -C build/perl .