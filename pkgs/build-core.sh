#!/bin/bash
set -e


cd pkgs
mkdir -p build
mkdir -p done

for pkg in buildscripts/*; do
        fakeroot sh $pkg
done