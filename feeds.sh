#!/usr/bin/env sh
./scripts/feeds update -a
./scripts/feeds install -a

cp diffconfig .config
make defconfig

./scripts/diffconfig.sh > diffconfig
