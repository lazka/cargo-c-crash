# Repro

For https://github.com/msys2/MINGW-packages/issues/23358

* git clone
* git submodule update --init
* ./repro.sh

Expected:

Prints version

Actual:

segfault


## Requirements

* a MSYS2 install
* Use UCRT64 or CLANG64 environment (problem exists in both)
* `pacman -S --needed git ${MINGW_PACKAGE_PREFIX}-cargo-c ${MINGW_PACKAGE_PREFIX}-cc ${MINGW_PACKAGE_PREFIX}-rust`
