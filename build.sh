#!/bin/bash
set -e

sh pkgs/dl-core.sh
sh pkgs/build-core.sh
sh scripts/make-image.sh