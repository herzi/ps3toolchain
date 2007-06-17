#!/bin/sh
# binutils-2.17.50-ppu.sh by Dan Peori (danpeori@oopo.net)

 ## Download the source code.
 wget --continue ftp://sourceware.org/pub/binutils/snapshots/binutils-2.17.50.tar.bz2 || { exit 1; }

 ## Unpack the source code.
 rm -Rf binutils-2.17.50 && tar xfvj binutils-2.17.50.tar.bz2 || { exit 1; }

 ## Enter the source directory and patch the source code.
 cd binutils-2.17.50 && cat ../../patches/binutils-2.17.50-PPU.patch | patch -p1 || { exit 1; }

 ## Create and enter the build directory.
 mkdir build-ppu && cd build-ppu || { exit 1; }

 ## Configure the build.
 ../configure --prefix="$PS3DEV/ppu" --target="ppu" --disable-nls || { exit 1; }

 ## Compile and install.
 make clean && make -j 2 && make install && make clean || { exit 1; }
