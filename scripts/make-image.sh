#!/bin/bash
set -e

cleanup() {
    if [ -n "$LOOP_DEV" ] && [ -e "$LOOP_DEV" ]; then
        sudo umount "$EFI_PART" 2>/dev/null || true
        sudo umount "$ROOT_PART" 2>/dev/null || true
        sudo losetup -d "$LOOP_DEV" 2>/dev/null || true
    fi
    sudo rm -rf mnt 2>/dev/null || true
}
trap cleanup EXIT

for dir in builds/{limine,linux,bash,coreutils,util-linux,nano,glibc,ncurses,zlib,file,libseccomp,xz,zstd}; do
    if [ ! -d "$dir" ]; then
        echo "Error: $dir not found"
        exit 1
    fi
done

mkdir -p disk
rm -f disk/disk.img

dd if=/dev/zero of=disk/disk.img bs=1M count=1024

LOOP_DEV=$(sudo losetup --show -fP disk/disk.img)

sudo sgdisk -o "$LOOP_DEV"
sudo sgdisk -n 1:1MiB:+128MiB -t 1:EF00 "$LOOP_DEV"
sudo sgdisk -n 2:129MiB:0 -t 2:8300 "$LOOP_DEV"

EFI_PART="${LOOP_DEV}p1"
ROOT_PART="${LOOP_DEV}p2"

sudo mkfs.fat -F32 "$EFI_PART"
sudo mkfs.ext4 "$ROOT_PART"

mkdir -p mnt
mkdir -p mnt/efi
mkdir -p mnt/root

sudo mount "$EFI_PART" mnt/efi
sudo mount "$ROOT_PART" mnt/root

EFI_PATH=$(realpath mnt/efi)
ROOT_PATH=$(realpath mnt/root)

sudo mkdir -p $EFI_PATH/boot/limine

sudo cp builds/limine/share/limine/limine-bios.sys     $EFI_PATH/limine-bios.sys
sudo cp builds/limine/share/limine/limine-bios-cd.bin  $EFI_PATH/boot/limine/
sudo cp builds/limine/share/limine/limine-bios-pxe.bin $EFI_PATH/boot/limine/
sudo cp builds/limine/share/limine/limine-uefi-cd.bin  $EFI_PATH/boot/limine/
sudo cp builds/limine/share/limine/BOOTIA32.EFI        $EFI_PATH/boot/
sudo cp builds/linux/vmlinuz $EFI_PATH/boot/
sudo cp configs/limine.conf $EFI_PATH/boot/limine/

sudo mkdir -p $ROOT_PATH/{etc,dev,sys,proc,tmp,var,run,home/root}
sudo mkdir -p $ROOT_PATH/usr/{bin,lib,sbin,lib64,libx32,include,share,src}

sudo ln -sf usr/bin   $ROOT_PATH/bin
sudo ln -sf usr/sbin  $ROOT_PATH/sbin
sudo ln -sf usr/lib   $ROOT_PATH/lib
sudo ln -sf usr/lib64 $ROOT_PATH/lib64

sudo chmod 1777 $ROOT_PATH/tmp

sudo mknod $ROOT_PATH/dev/null c 1 3
sudo mknod $ROOT_PATH/dev/zero c 1 5
sudo mknod $ROOT_PATH/dev/random c 1 8
sudo mknod $ROOT_PATH/dev/urandom c 1 9

echo "root:x:0:0:root:/root:/bin/bash" | sudo tee $ROOT_PATH/etc/passwd > /dev/null
echo "root:x:0:" | sudo tee $ROOT_PATH/etc/group > /dev/null

sudo cp main $ROOT_PATH/sbin/init

sudo cp builds/bash/bash        $ROOT_PATH/usr/bin/bash
sudo cp builds/bash/bashbug     $ROOT_PATH/usr/bin/bashbug
sudo cp builds/bash/bashversion $ROOT_PATH/usr/bin/bashversion
sudo ln -sf bash $ROOT_PATH/usr/bin/sh

cd builds/coreutils/
sudo make DESTDIR=$ROOT_PATH install
cd ../..

cd builds/util-linux
sudo make DESTDIR=$ROOT_PATH install
cd ../..

cd builds/nano
sudo make DESTDIR=$ROOT_PATH install
cd ../..

cd builds/glibc
sudo make DESTDIR=$ROOT_PATH install
cd ../..

cd builds/ncurses
sudo make DESTDIR=$ROOT_PATH install
cd ../..

cd builds/zlib
sudo make DESTDIR=$ROOT_PATH install
cd ../..

cd builds/file
sudo make DESTDIR=$ROOT_PATH install
cd ../..

mkdir -p builds/bzip2
cd builds/bzip2
sudo cmake -DCMAKE_INSTALL_PREFIX:PATH=$ROOT_PATH ../../tmp/bzip2
sudo cmake --build . --target install --config Release
cd ../..

cd builds/libseccomp
sudo make DESTDIR=$ROOT_PATH install
cd ../..

cd builds/xz
sudo make DESTDIR=$ROOT_PATH install
cd ../..

cd builds/zstd
sudo make DESTDIR=$ROOT_PATH install
cd ../..

sudo ln -sf /usr/lib/libncursesw.so.6 $ROOT_PATH/usr/lib/libncurses.so.6
sudo ln -sf /usr/lib/libtinfow.so.6   $ROOT_PATH/usr/lib/libtinfo.so.6

if [ -f $ROOT_PATH/usr/lib/libbz2.so ]; then
    sudo ln -sf libbz2.so $ROOT_PATH/usr/lib/libbz2.so.1.0
    sudo ln -sf libbz2.so $ROOT_PATH/usr/lib/libbz2.so.1
fi

sudo cp configs/ld.so.conf $ROOT_PATH/etc/ld.so.conf
sudo ldconfig -v -r $ROOT_PATH

sudo cp -r $ROOT_PATH/usr/local/* $ROOT_PATH/usr/

sudo umount $EFI_PART
sudo umount $ROOT_PART
sudo rm -rf mnt

./builds/limine/bin/limine bios-install disk/disk.img

sudo losetup -d "$LOOP_DEV"

echo "Raw bootable disk image created at disk/disk.img"