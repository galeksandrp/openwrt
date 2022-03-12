#!/usr/bin/env sh
./scripts/feeds update -a
./scripts/feeds install -a

./scripts/feeds uninstall dawn
./scripts/feeds install -p galeksandrp_packages dawn
