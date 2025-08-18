#!/bin/bash
sh scripts/dl-core.sh
sh scripts/build-limine.sh
sh scripts/build-linux.sh
sh scripts/make-image.sh