# Repro

For https://github.com/msys2/MINGW-packages/issues/23358

* git clone
* git submodule update --init
* ./repro.sh

Expected:

Prints version

Actual:

segfault