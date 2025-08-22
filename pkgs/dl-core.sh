#!/bin/bash

mkdir -p pkgs/tmp
cd pkgs/tmp

git clone https://github.com/torvalds/linux --depth=1
git clone https://sourceware.org/git/glibc.git --depth=1

GNU_MIRROR="https://mirror.accum.se/mirror/gnu.org/gnu"

download_and_extract() {
    local name=$1
    local file=$2
    local url=$3
    if [ ! -f "$file" ]; then
        wget "$url"
        tar -xvzf "$file"
    fi
}

download_and_extract "ncurses" ncurses-6.5.tar.gz "$GNU_MIRROR/ncurses/ncurses-6.5.tar.gz"
download_and_extract "tar" tar-1.35.tar.gz "$GNU_MIRROR/tar/tar-1.35.tar.gz"
download_and_extract "gettext" gettext-0.26.tar.gz "$GNU_MIRROR/gettext/gettext-0.26.tar.gz"
download_and_extract "gdbm" gdbm-1.26.tar.gz "$GNU_MIRROR/gdbm/gdbm-1.26.tar.gz"
download_and_extract "bash" bash-5.2.tar.gz "$GNU_MIRROR/bash/bash-5.2.tar.gz"
download_and_extract "coreutils" coreutils-9.5.tar.gz "$GNU_MIRROR/coreutils/coreutils-9.5.tar.gz"
download_and_extract "nano" nano-8.1.tar.gz "$GNU_MIRROR/nano/nano-8.1.tar.gz"
download_and_extract "readline" readline-8.2.tar.gz "$GNU_MIRROR/readline/readline-8.2.tar.gz"
download_and_extract "grep" grep-3.11.tar.gz "$GNU_MIRROR/grep/grep-3.11.tar.gz"
download_and_extract "sed" sed-4.9.tar.gz "$GNU_MIRROR/sed/sed-4.9.tar.gz"
download_and_extract "gzip" gzip-1.13.tar.gz "$GNU_MIRROR/gzip/gzip-1.13.tar.gz"

if [ ! -f kmod-34.tar.gz ]; then
    wget https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-34.tar.gz
    tar -xvzf kmod-34.tar.gz
fi

if [ ! -f openssl-3.5.2.tar.gz ]; then
    wget https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz
    tar -xvzf openssl-3.5.2.tar.gz
fi

if [ ! -f e2fsprogs-1.47.3.tar.gz ]; then
    wget https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.3/e2fsprogs-1.47.3.tar.gz
    tar -xvzf e2fsprogs-1.47.3.tar.gz
fi

if [ ! -f keyutils-1.6.3.tar.gz ]; then
    wget https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot/keyutils-1.6.3.tar.gz
    tar -xvzf keyutils-1.6.3.tar.gz
fi

if [ ! -f cyrus-sasl-2.1.28.tar.gz ]; then
    wget https://github.com/cyrusimap/cyrus-sasl/releases/download/cyrus-sasl-2.1.28/cyrus-sasl-2.1.28.tar.gz
    tar -xvzf cyrus-sasl-2.1.28.tar.gz
fi

if [ ! -f openldap-2.6.9.tgz ]; then
    wget https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.9.tgz
    tar -xvzf openldap-2.6.9.tgz
fi

if [ ! -f krb5-1.22.1.tar.gz ]; then
    wget https://kerberos.org/dist/krb5/1.22/krb5-1.22.1.tar.gz
    tar -xvzf krb5-1.22.1.tar.gz
fi

git clone https://github.com/limine-bootloader/limine/ --branch=v8.x --depth=1
git clone https://github.com/util-linux/util-linux.git --depth=1
git clone https://github.com/madler/zlib --depth=1
git clone https://github.com/file/file --depth=1
git clone https://gitlab.com/bzip2/bzip2.git --depth=1 --branch=bzip2-1.0.8
git clone https://github.com/seccomp/libseccomp --branch=release-2.6 --depth=1
git clone https://github.com/tukaani-project/xz --depth=1
git clone https://github.com/facebook/zstd --branch=v1.5.7 --depth=1
git clone https://git.savannah.nongnu.org/git/acl.git --depth=1
git clone https://git.savannah.nongnu.org/git/attr.git --depth=1
git clone https://github.com/PCRE2Project/pcre2 --depth=1
git clone https://github.com/GNOME/libxml2 --depth=1
git clone https://github.com/legionus/kbd/ --depth=1
git clone https://github.com/systemd/systemd.git --depth=1
git clone https://git.kernel.org/pub/scm/libs/libcap/libcap.git/ --depth=1
git clone https://github.com/linux-audit/audit-userspace --depth=1
git clone https://github.com/besser82/libxcrypt --depth=1
git clone https://github.com/stevegrubb/libcap-ng --depth=1
git clone https://github.com/linux-pam/linux-pam --depth=1
git clone https://github.com/shadow-maint/shadow --depth=1
git clone https://github.com/thkukuk/libnsl --depth=1
git clone git://git.linux-nfs.org/projects/steved/libtirpc.git --depth=1
