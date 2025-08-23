#!/bin/bash
set -e

cd pkgs
mkdir -p build
mkdir -p done

for pkg in buildscripts/*; do
        if [ "buildscripts/util-linux.sh" == $pkg ] || [ "buildscripts/pam.sh" == $pkg ] || [ "buildscripts/libutmp.sh" == $pkg ]; then
                fakeroot sh $pkg
        else
                sh $pkg
        fi
done