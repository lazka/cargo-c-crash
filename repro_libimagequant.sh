#!/bin/bash

set -e

dist=$(pwd)/dist_libimagequant
cd libimagequant
cargo fetch
cargo cbuild --meson-paths --release --manifest-path imagequant-sys/Cargo.toml
cargo cinstall --meson-paths --destdir $dist --manifest-path imagequant-sys/Cargo.toml
# This makes things work, by using dlltool to re-create the import lib
# dlltool.exe  -D$dist/bin/libimagequant.dll -d$dist/lib/imagequant.def -l$dist/lib/libimagequant.dll.a
cd ..
PATH="$dist/bin:$PATH"
cc crash.c -limagequant -L"$dist/lib" -I"$dist/include" -o crash.exe
./crash.exe