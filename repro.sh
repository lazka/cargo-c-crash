#!/bin/bash

set -e

dist=$(pwd)/dist
cd libimagequant
cargo fetch
cargo cbuild --release --manifest-path imagequant-sys/Cargo.toml
cargo cinstall --destdir $dist --manifest-path imagequant-sys/Cargo.toml
cd ..
PATH="$dist/bin:$PATH"
cc crash.c -limagequant -L"$dist/lib" -I"$dist/include" -o crash.exe
./crash.exe