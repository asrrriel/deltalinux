mkdir -p builds/bzip2
cd ralsei

make -j$(nproc)

make DESTDIR=../builds/ralsei install