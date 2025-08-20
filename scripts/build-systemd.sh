#!/bin/bash
cd tmp/systemd

meson build --prefix=/usr
ninja -C build