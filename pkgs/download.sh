#!/bin/bash

mkdir -p pkgs/tmp
cd pkgs/tmp

git clone https://github.com/torvalds/linux --depth=1

git clone https://sourceware.org/git/glibc.git --depth=1

if [ ! -f ncurses-6.5.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/ncurses/ncurses-6.5.tar.gz
    tar -xvzf ncurses-6.5.tar.gz
fi

if [ ! -f tar-1.35.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/tar/tar-1.35.tar.gz
    tar -xvzf tar-1.35.tar.gz
fi

if [ ! -f gettext-0.26.tar.gz ]; then
    wget https://ftp.gnu.org/pub/gnu/gettext/gettext-0.26.tar.gz
    tar -xvzf gettext-0.26.tar.gz
fi

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

if [ ! -f gdbm-1.26.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/gdbm/gdbm-1.26.tar.gz
    tar -xvzf gdbm-1.26.tar.gz
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

if [ ! -f libbsd-0.12.2.tar.xz ]; then
    wget https://libbsd.freedesktop.org/releases/libbsd-0.12.2.tar.xz
    tar -xvJf libbsd-0.12.2.tar.xz
fi

if [ ! -f libmd-1.1.0.tar.xz ]; then
    # fucking freedesktop guys put it into the libbsd dir???
    wget https://libbsd.freedesktop.org/releases/libmd-1.1.0.tar.xz
    tar -xvJf libmd-1.1.0.tar.xz
fi

if [ ! -f findutils-4.10.0.tar.xz ]; then
    wget https://ftp.gnu.org/gnu/findutils/findutils-4.10.0.tar.xz
    tar -xvJf findutils-4.10.0.tar.xz
fi

if [ ! -f less-679.tar.gz ]; then
    wget https://www.greenwoodsoftware.com/less/less-679.tar.gz
    tar -xvzf less-679.tar.gz
fi

if [ ! -f libssh2-1.11.1.tar.gz ]; then
    wget https://libssh2.org/download/libssh2-1.11.1.tar.gz
    tar -xvzf libssh2-1.11.1.tar.gz
fi

if [ ! -f libidn2-v2.3.8-src.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/libidn/libidn2-v2.3.8-src.tar.gz
    tar -xvzf libidn2-v2.3.8-src.tar.gz
fi

if [ ! -f libunistring-1.3.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/libunistring/libunistring-1.3.tar.gz
    tar -xvzf libunistring-1.3.tar.gz
fi

if [ ! -f nghttp2-1.66.0.tar.gz ]; then
    wget https://github.com/nghttp2/nghttp2/releases/download/v1.66.0/nghttp2-1.66.0.tar.gz
    tar -xvzf nghttp2-1.66.0.tar.gz
fi

if [ ! -f p11-kit-0.25.5.tar.xz ]; then
    wget https://github.com/p11-glue/p11-kit/releases/download/0.25.5/p11-kit-0.25.5.tar.xz
    tar -xvJf p11-kit-0.25.5.tar.xz
fi

if [ ! -f libffi-3.4.5.tar.gz ]; then
    wget https://github.com/libffi/libffi/releases/download/v3.4.5/libffi-3.4.5.tar.gz
    tar -xvzf libffi-3.4.5.tar.gz
fi

if [ ! -f libtasn1-v4.20.0-src.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/libtasn1/libtasn1-v4.20.0-src.tar.gz
    tar -xvzf libtasn1-v4.20.0-src.tar.gz
fi

if [ ! -f Error-0.17030.tar.gz ]; then
    wget https://cpan.metacpan.org/authors/id/S/SH/SHLOMIF/Error-0.17030.tar.gz
    tar -xvzf Error-0.17030.tar.gz
fi

if [ ! -f libunwind-1.6.2.tar.gz ]; then
    wget https://download.savannah.nongnu.org/releases/libunwind/libunwind-1.6.2.tar.gz
    tar -xvzf libunwind-1.6.2.tar.gz
fi

if [ ! -f nettle-3.10.tar.gz ]; then
    wget https://ftp.gnu.org/gnu/nettle/nettle-3.10.tar.gz
    tar -xvzf nettle-3.10.tar.gz
fi

if [ ! -f gmp-6.3.0.tar.xz ]; then
    wget https://gmplib.org/download/gmp/gmp-6.3.0.tar.xz
    tar -xvJf gmp-6.3.0.tar.xz
fi

if [ ! -f xterm.tar.gz ]; then
    wget https://invisible-island.net/datafiles/release/xterm.tar.gz
    tar -xvzf xterm.tar.gz
fi

if [ ! -f mtdev-1.1.7.tar.gz ]; then
    wget https://bitmath.se/org/code/mtdev/mtdev-1.1.7.tar.gz
    tar -xvzf mtdev-1.1.7.tar.gz
fi

git clone https://github.com/limine-bootloader/limine/ --branch=v8.x --depth=1

git clone https://git.savannah.gnu.org/git/bash.git --depth=1

git clone https://github.com/coreutils/coreutils.git --depth=1

git clone https://github.com/util-linux/util-linux.git --depth=1

git clone https://git.savannah.gnu.org/git/nano.git --depth=1

git clone https://github.com/madler/zlib --depth=1

git clone https://github.com/file/file --depth=1

git clone https://gitlab.com/bzip2/bzip2.git --depth=1 --branch=bzip2-1.0.8

git clone https://github.com/seccomp/libseccomp --branch=release-2.6 --depth=1

git clone https://github.com/tukaani-project/xz --depth=1

git clone https://github.com/facebook/zstd --branch=v1.5.7 --depth=1

git clone https://git.savannah.nongnu.org/git/acl.git --depth=1

git clone https://git.savannah.nongnu.org/git/attr.git --depth=1

git clone https://git.savannah.gnu.org/git/readline.git --depth=1

git clone https://github.com/PCRE2Project/pcre2 --depth=1

git clone https://git.savannah.gnu.org/git/grep.git --depth=1

git clone https://git.savannah.gnu.org/git/sed.git --depth=1

git clone https://git.savannah.gnu.org/git/gzip.git --depth=1

git clone http://github.com/GNOME/libxml2 --depth=1

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

git clone git://git.kernel.org/pub/scm/network/iproute2/iproute2.git --depth=1

git clone https://github.com/libbpf/libbpf.git --depth=1

git clone https://sourceware.org/git/elfutils.git --depth=1

git clone https://git.netfilter.org/libmnl.git --depth=1

git clone https://github.com/iputils/iputils.git --depth=1

git clone https://github.com/SELinuxProject/selinux.git --depth=1

git clone https://github.com/altlinux/libutempter.git --depth=1

git clone https://github.com/curl/curl --depth=1

git clone https://github.com/rockdaboot/libpsl --depth=1

git clone https://github.com/ngtcp2/nghttp3 --depth=1

git clone https://github.com/google/brotli --depth=1

git clone https://github.com/ibireme/yyjson/ --depth=1

git clone https://github.com/fastfetch-cli/fastfetch --depth=1

git clone https://github.com/libexpat/libexpat.git --depth=1

git clone https://github.com/Perl/perl5.git --depth=1

git clone https://github.com/markov2/perl5-MailTools.git perl_mailtools --depth=1

git clone https://github.com/atoomic/perl-TimeDate.git perl_timedate --depth=1

git clone git://git.kernel.org/pub/scm/git/git.git --depth=1

git clone https://github.com/python/cpython.git --depth=1

git clone https://gitlab.freedesktop.org/dbus/dbus.git --depth=1

git clone https://gitlab.freedesktop.org/mesa/drm.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libpciaccess --depth=1

git clone https://github.com/anholt/libepoxy.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libx11 --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxcb.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxau.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/proto/xorgproto.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxdmcp.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/proto/xcbproto.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/xserver.git --depth=1 --branch=server-21.1-branch

git clone https://gitlab.freedesktop.org/libinput/libinput.git --depth=1

git clone https://gitlab.freedesktop.org/libevdev/libevdev.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/driver/xf86-input-libinput.git --depth=1 --branch=xf86-input-libinput-1.5.0

git clone https://gitlab.freedesktop.org/xorg/driver/xf86-video-fbdev.git --depth=1 --branch=xf86-video-fbdev-0.5.1

git clone https://gitlab.freedesktop.org/xorg/app/xauth.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxext.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxmu.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxt.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libice.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libsm.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/app/xmodmap.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/app/xrdb.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/app/xinit.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/app/twm.git --depth=1

git clone https://gitlab.freedesktop.org/pixman/pixman.git --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxshmfence --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxfont --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libfontenc --depth=1

git clone https://gitlab.freedesktop.org/xorg/font/encodings --depth=1

git clone https://gitlab.freedesktop.org/xorg/app/setxkbmap --depth=1

git clone https://gitlab.freedesktop.org/xkeyboard-config/xkeyboard-config --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxkbfile --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxrandr --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxrender --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxcvt --depth=1

git clone https://gitlab.freedesktop.org/xorg/app/xkbcomp --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxaw --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxinerama --depth=1

git clone https://gitlab.freedesktop.org/xorg/lib/libxpm --depth=1

git clone https://gitlab.freedesktop.org/xorg/app/xclock.git --depth=1