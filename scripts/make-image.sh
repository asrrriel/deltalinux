#!/bin/bash

mkdir -p disk

dd if=/dev/zero of=disk/efipart.img bs=1M count=20

mkfs.fat disk/efipart.img

mmd -i disk/efipart.img ::boot
mmd -i disk/efipart.img ::boot/limine

mcopy -i disk/efipart.img builds/limine/share/limine/limine-bios.sys      ::boot/limine
mcopy -i disk/efipart.img builds/limine/share/limine/limine-bios-cd.bin   ::boot/limine
mcopy -i disk/efipart.img builds/limine/share/limine/limine-bios-pxe.bin  ::boot/limine
mcopy -i disk/efipart.img builds/limine/share/limine/limine-uefi-cd.bin   ::boot/limine

mcopy -i disk/efipart.img configs/limine.conf   ::boot/limine

mcopy -i disk/efipart.img builds/linux/vmlinuz   ::boot

mmd -i disk/efipart.img ::EFI
mmd -i disk/efipart.img ::EFI/BOOT

mcopy -i disk/efipart.img builds/limine/share/limine/BOOTIA32.EFI   ::EFI/BOOT
mcopy -i disk/efipart.img builds/limine/share/limine/BOOTX64.EFI    ::EFI/BOOT



dd if=/dev/zero of=disk/main.img bs=1M count=10

mkfs.fat disk/main.img

xorriso -as mkisofs \
  -volid "CUSTOMDISK" \
  -output disk/out.hdd \
  -isohybrid-gpt-basdat \
  -append_partition 1 0xef disk/efipart.img \
  -append_partition 2 0x83 disk/main.img \
  -appended_part_as_gpt

./builds/limine/bin/limine bios-install disk/out.hdd