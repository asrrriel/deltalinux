#!/bin/bash
set -e

# Create workspace
mkdir -p disk
rm -f disk/disk.img

# Create a 1GB raw disk image
dd if=/dev/zero of=disk/disk.img bs=1M count=1024

# Set up loop device
LOOP_DEV=$(sudo losetup --show -fP disk/disk.img)

# Partition the disk using sgdisk
sudo sgdisk -o "$LOOP_DEV"               # Create new GPT
sudo sgdisk -n 1:1MiB:+128MiB -t 1:EF00 "$LOOP_DEV"  # EFI System Partition
sudo sgdisk -n 2:129MiB:0 -t 2:8300 "$LOOP_DEV"      # Linux root

# Partition devices
EFI_PART="${LOOP_DEV}p1"
ROOT_PART="${LOOP_DEV}p2"

# Format partitions
sudo mkfs.fat -F32 "$EFI_PART"
sudo mkfs.ext4 "$ROOT_PART"

# Populate EFI partition
mkdir -p /tmp/efi
sudo mount "$EFI_PART" /tmp/efi

sudo mkdir -p /tmp/efi/boot/limine

# BIOS files
sudo cp builds/limine/share/limine/limine-bios.sys      /tmp/efi/limine-bios.sys
sudo cp builds/limine/share/limine/limine-bios-cd.bin  /tmp/efi/boot/limine/
sudo cp builds/limine/share/limine/limine-bios-pxe.bin /tmp/efi/boot/limine/

# UEFI files
sudo cp builds/limine/share/limine/limine-uefi-cd.bin  /tmp/efi/boot/limine/
sudo cp builds/limine/share/limine/BOOTIA32.EFI        /tmp/efi/boot/
sudo cp builds/limine/share/limine/BOOTX64.EFI        /tmp/efi/boot/

# Linux kernel
sudo cp builds/linux/vmlinuz /tmp/efi/boot/

# Limine config
sudo cp configs/limine.conf /tmp/efi/boot/limine/

sudo umount /tmp/efi
rmdir /tmp/efi

# Populate root partition
mkdir -p /tmp/root
sudo mount "$ROOT_PART" /tmp/root

sudo mkdir -p /tmp/root/{bin,etc,sbin,usr,dev,sys,proc,lib,lib64}
sudo mkdir -p /tmp/root/usr/{bin,lib,sbin,lib64}

sudo ln -sf /lib  /tmp/root/usr/lib
sudo ln -sf /lib64 /tmp/root/usr/lib64
sudo ln -sf /bin  /tmp/root/usr/bin
sudo ln -sf /sbin /tmp/root/usr/sbin

sudo cp main /tmp/root/sbin/init

sudo cp builds/bash/bash /tmp/root/usr/bin/bash
sudo cp builds/bash/bashbug /tmp/root/usr/bin/bashbug
sudo cp builds/bash/bashversion /tmp/root/usr/bin/bashversion

# symlink bash to sh
sudo ln -sf /usr/bin/bash /tmp/root/bin/sh

cd builds/coreutils/
sudo make DESTDIR=/tmp/root install
cd ../..

cd builds/util-linux
sudo make DESTDIR=/tmp/root install
cd ../..

cd builds/nano
sudo make DESTDIR=/tmp/root install
cd ../..

cd builds/glibc
sudo make DESTDIR=/tmp/root install
cd ../..

cd builds/ncurses
sudo make DESTDIR=/tmp/root install
cd ../..

# symlink libncursesw.so.6 -> libncurses.so.6
sudo ln -sf /usr/lib/libncursesw.so.6 /tmp/root/usr/lib/libncurses.so.6
sudo ln -sf /usr/lib/libtinfow.so.6 /tmp/root/usr/lib/libtinfo.so.6

sudo ldconfig -v -r /tmp/root

sudo umount /tmp/root
rmdir /tmp/root

# Install Limine bootloader (BIOS)
./builds/limine/bin/limine bios-install disk/disk.img

# Detach loop device
sudo losetup -d "$LOOP_DEV"

echo "Raw bootable disk image created at disk/disk.img"
