#!/bin/bash

set -e

dist=$(pwd)/dist_dovi_tool
cd dovi_tool
cargo fetch
cargo cbuild --meson-paths --release --manifest-path dolby_vision/Cargo.toml
cargo cinstall --meson-paths --destdir $dist --manifest-path dolby_vision/Cargo.toml
# This makes things work, by using dlltool to re-create the import lib
# dlltool.exe  -D$dist/bin/libdovi.dll -d$dist/lib/dovi.def -l$dist/lib/libdovi.dll.a
cd ..
PATH="$dist/bin:$PATH"
cd dovi_tool/dolby_vision/examples
c++ simple_edit.cpp -ldovi -L"$dist/lib" -I"$dist/include" -o simple_edit.exe
./simple_edit.exe