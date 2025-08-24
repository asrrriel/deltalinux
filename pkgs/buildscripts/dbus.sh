#!/bin/bash
set -e

mkdir -p build/dbus
cd tmp/dbus

meson setup build \
    --prefix=/usr \
    --sysconfdir=/etc \
    --localstatedir=/var \
    --buildtype=release \
    -Ddoxygen_docs=disabled \
    -Dxml_docs=disabled \
    -Dsystem_pid_file=/run/dbus/pid \
    -Dsystem_socket=/run/dbus/system_bus_socket \
    -Dsession_socket_dir=/tmp

ninja -C build

DESTDIR=$(realpath ../../build/dbus) ninja -C build install

cd ../..

tar -czf done/dbus.tar.gz -C build/dbus .