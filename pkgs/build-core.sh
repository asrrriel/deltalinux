#!/bin/bash
set -e

cd pkgs
mkdir -p build
mkdir -p done

for pkg in buildscripts/*; do
        if [ "buildscripts/util-linux.sh" -eq $pkg ]; then
                fakeroot sh $pkg
        else
                sh $pkg
        fi
done