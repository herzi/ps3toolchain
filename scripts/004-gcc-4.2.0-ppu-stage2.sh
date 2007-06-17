#!/bin/sh
# gcc-4.2.0-ppu-stage2.sh by Dan Peori (danpeori@oopo.net)

 ## Download the source code.
 wget --continue ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.2.0/gcc-4.2.0.tar.bz2 || { exit 1; }

 ## Unpack the source code.
 rm -Rf gcc-4.2.0 && tar xfvj gcc-4.2.0.tar.bz2 || { exit 1; }

 ## Enter the source directory and patch the source code.
 cd gcc-4.2.0 && cat ../../patches/gcc-4.2.0-PPU.patch | patch -p1 || { exit 1; }

 ## Create and enter the build directory.
 mkdir build-ppu-stage2 && cd build-ppu-stage2 || { exit 1; }

 ## Configure the build.
 ../configure --prefix=$PS3DEV/ppu --target=ppu --enable-languages=c,c++ --with-newlib --enable-cxx-flags="-G0" --disable-libgomp --disable-libmudflap --disable-nls --disable-shared --disable-threads || { exit 1; }

 ## Compile and install.
 make clean && make -j 2 && make install && make clean || { exit 1; }
