#!/bin/bash
sh scripts/dl-core.sh
sh scripts/build-limine.sh
sh scripts/build-linux.sh
sh scripts/build-glibc.sh
sh scripts/build-coreutils.sh
sh scripts/build-bash.sh
sh scripts/build-nano.sh
sh scripts/build-ncurses.sh
sh scripts/build-utillinux.sh
sh scripts/build-bzip2.sh
sh scripts/build-file.sh
sh scripts/build-seccomp.sh
sh scripts/build-xz.sh
sh scripts/build-zlib.sh
sh scripts/build-zstd.sh
sh scripts/build-ralsei.sh
sh scripts/make-image.sh