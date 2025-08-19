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

# Mount Shit(todo: do fuse mount so this POS doesnt need unneeded root perms)
mkdir -p mnt
mkdir -p mnt/efi
mkdir -p mnt/root

sudo mount "$EFI_PART" mnt/efi
sudo mount "$ROOT_PART" mnt/root

EFI_PATH=$(realpath mnt/efi)
ROOT_PATH=$(realpath mnt/root)

# Populate EFI partition
sudo mkdir -p $EFI_PATH/boot/limine

# BIOS files
sudo cp builds/limine/share/limine/limine-bios.sys     $EFI_PATH/limine-bios.sys
sudo cp builds/limine/share/limine/limine-bios-cd.bin  $EFI_PATH/boot/limine/
sudo cp builds/limine/share/limine/limine-bios-pxe.bin $EFI_PATH/boot/limine/

# UEFI files
sudo cp builds/limine/share/limine/limine-uefi-cd.bin  $EFI_PATH/boot/limine/
sudo cp builds/limine/share/limine/BOOTIA32.EFI        $EFI_PATH/boot/

# Linux kernel
sudo cp builds/linux/vmlinuz $EFI_PATH/boot/

# Limine config
sudo cp configs/limine.conf $EFI_PATH/boot/limine/

# Populate root partition
sudo mkdir -p $ROOT_PATH/{bin,etc,sbin,usr,dev,sys,proc,lib,lib64}
sudo mkdir -p $ROOT_PATH/usr/{bin,lib,sbin,lib64,libx32,include,share,src}

sudo ln -sf /lib  $ROOT_PATH/usr/lib
sudo ln -sf /lib64 $ROOT_PATH/usr/lib64
sudo ln -sf /bin  $ROOT_PATH/usr/bin
sudo ln -sf /sbin $ROOT_PATH/usr/sbin

sudo cp main $ROOT_PATH/sbin/init

sudo cp builds/bash/bash $ROOT_PATH/usr/bin/bash
sudo cp builds/bash/bashbug $ROOT_PATH/usr/bin/bashbug
sudo cp builds/bash/bashversion $ROOT_PATH/usr/bin/bashversion

# symlink bash to sh
sudo ln -sf /usr/bin/bash $ROOT_PATH/bin/sh

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

cd builds/bzip2
sudo DESTDIR=$ROOT_PATH meson install
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

# symlink libncursesw.so.6 -> libncurses.so.6
sudo ln -sf /usr/lib/libncursesw.so.6 $ROOT_PATH/usr/lib/libncurses.so.6
sudo ln -sf /usr/lib/libtinfow.so.6 $ROOT_PATH/usr/lib/libtinfo.so.6

sudo ldconfig -v -r $ROOT_PATH

# Unmount partitions
sudo umount $EFI_PART
sudo umount $ROOT_PART

sudo rm -rf mnt

# Install Limine bootloader (BIOS)
./builds/limine/bin/limine bios-install disk/disk.img

# Detach loop device
sudo losetup -d "$LOOP_DEV"

echo "Raw bootable disk image created at disk/disk.img"
