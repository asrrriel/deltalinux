#!/bin/bash
set -e

mkdir -p pkgs/tmp
cd pkgs/tmp

GNU_MIRROR="https://mirror.accum.se/mirror/gnu.org/gnu"
NON_GNU_MIRROR="https://mirror.accum.se/mirror/gnu.org/savannah/"

download_and_extract() {
    local file=$1
    local url=$2
    if [ ! -f "$file" ]; then
        wget -c "$url"
        tar -xvzf "$file"
    fi
}

clone_repo() {
    local dir=$1
    local url=$2
    shift 2
    if [ ! -d "$dir" ]; then
        git clone "$url" "$dir" "$@" 
    fi
}

clone_repo linux https://github.com/torvalds/linux --depth=1
clone_repo glibc https://sourceware.org/git/glibc.git --depth=1

download_and_extract ncurses-6.5.tar.gz "$GNU_MIRROR/ncurses/ncurses-6.5.tar.gz"
download_and_extract tar-1.35.tar.gz "$GNU_MIRROR/tar/tar-1.35.tar.gz"
download_and_extract gettext-0.26.tar.gz "$GNU_MIRROR/gettext/gettext-0.26.tar.gz"
download_and_extract gdbm-1.26.tar.gz "$GNU_MIRROR/gdbm/gdbm-1.26.tar.gz"
download_and_extract bash-5.2.tar.gz "$GNU_MIRROR/bash/bash-5.2.tar.gz"
download_and_extract coreutils-9.5.tar.gz "$GNU_MIRROR/coreutils/coreutils-9.5.tar.gz"
download_and_extract nano-8.1.tar.gz "$GNU_MIRROR/nano/nano-8.1.tar.gz"
download_and_extract readline-8.2.tar.gz "$GNU_MIRROR/readline/readline-8.2.tar.gz"
download_and_extract grep-3.11.tar.gz "$GNU_MIRROR/grep/grep-3.11.tar.gz"
download_and_extract sed-4.9.tar.gz "$GNU_MIRROR/sed/sed-4.9.tar.gz"
download_and_extract gzip-1.13.tar.gz "$GNU_MIRROR/gzip/gzip-1.13.tar.gz"

download_and_extract kmod-34.tar.gz "https://www.kernel.org/pub/linux/utils/kernel/kmod/kmod-34.tar.gz"
download_and_extract openssl-3.5.2.tar.gz "https://github.com/openssl/openssl/releases/download/openssl-3.5.2/openssl-3.5.2.tar.gz"
download_and_extract e2fsprogs-1.47.3.tar.gz "https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.47.3/e2fsprogs-1.47.3.tar.gz"
download_and_extract keyutils-1.6.3.tar.gz "https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/keyutils.git/snapshot/keyutils-1.6.3.tar.gz"
download_and_extract cyrus-sasl-2.1.28.tar.gz "https://github.com/cyrusimap/cyrus-sasl/releases/download/cyrus-sasl-2.1.28/cyrus-sasl-2.1.28.tar.gz"
download_and_extract openldap-2.6.9.tgz "https://www.openldap.org/software/download/OpenLDAP/openldap-release/openldap-2.6.9.tgz"
download_and_extract krb5-1.22.1.tar.gz "https://kerberos.org/dist/krb5/1.22/krb5-1.22.1.tar.gz"

download_and_extract acl-2.3.2.tar.gz "$NON_GNU_MIRROR/acl/acl-2.3.2.tar.gz"
download_and_extract attr-2.5.2.tar.gz "$NON_GNU_MIRROR/attr/attr-2.5.2.tar.gz"

clone_repo limine https://github.com/limine-bootloader/limine/ --branch=v8.x --depth=1
clone_repo util-linux https://github.com/util-linux/util-linux.git --depth=1
clone_repo zlib https://github.com/madler/zlib --depth=1
clone_repo file https://github.com/file/file --depth=1
clone_repo bzip2 https://gitlab.com/bzip2/bzip2.git --depth=1 --branch=bzip2-1.0.8
clone_repo libseccomp https://github.com/seccomp/libseccomp --branch=release-2.6 --depth=1
clone_repo xz https://github.com/tukaani-project/xz --depth=1
clone_repo zstd https://github.com/facebook/zstd --branch=v1.5.7 --depth=1
clone_repo pcre2 https://github.com/PCRE2Project/pcre2 --depth=1
clone_repo libxml2 https://github.com/GNOME/libxml2 --depth=1
clone_repo kbd https://github.com/legionus/kbd/ --depth=1
clone_repo systemd https://github.com/systemd/systemd.git --depth=1
clone_repo libcap https://git.kernel.org/pub/scm/libs/libcap/libcap.git/ --depth=1
clone_repo audit-userspace https://github.com/linux-audit/audit-userspace --depth=1
clone_repo libxcrypt https://github.com/besser82/libxcrypt --depth=1
clone_repo libcap-ng https://github.com/stevegrubb/libcap-ng --depth=1
clone_repo linux-pam https://github.com/linux-pam/linux-pam --depth=1
clone_repo shadow https://github.com/shadow-maint/shadow --depth=1
clone_repo libnsl https://github.com/thkukuk/libnsl --depth=1
clone_repo libtirpc git://git.linux-nfs.org/projects/steved/libtirpc.git --depth=1
