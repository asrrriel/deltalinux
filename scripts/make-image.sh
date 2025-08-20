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
mkdir -p mnt/root

sudo mount "/dev/loop0p2" mnt/root

sudo mkdir -p mnt/root/boot

sudo mount "/dev/loop0p1" mnt/root/boot

ROOT_PATH=$(realpath mnt/root)
EFI_PATH=$(realpath mnt/root/boot)

sudo mkdir -p $ROOT_PATH/{etc,dev,sys,proc,tmp,var,run,home,root}
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

for pkg in pkgs/done/*; do
        sudo pkgs/build/ralsei/usr/bin/ralsei install $pkg -r $ROOT_PATH
done

sudo cp configs/ld.so.conf $ROOT_PATH/etc/ld.so.conf
sudo cp configs/limine.conf $ROOT_PATH/boot/boot/limine/limine.conf
sudo ldconfig -v -r $ROOT_PATH

sudo umount $EFI_PART
sudo umount $ROOT_PART
sudo rm -rf mnt

./pkgs/build/limine/usr/bin/limine bios-install disk/disk.img

sudo losetup -d "$LOOP_DEV"

echo "Raw bootable disk image created at disk/disk.img"