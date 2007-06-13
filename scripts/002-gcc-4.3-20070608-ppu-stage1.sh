#!/bin/sh
# gcc-4.3-20070608-ppu-stage1.sh by Dan Peori (danpeori@oopo.net)
exit;
 ## Download the source code.
 wget --continue ftp://sourceware.org/pub/gcc/snapshots/LATEST-4.3/gcc-4.3-20070608.tar.bz2 || { exit 1; }

 ## Unpack the source code.
 rm -Rf gcc-4.3-20070608 && tar xfvj gcc-4.3-20070608.tar.bz2 || { exit 1; }

 ## Enter the source directory and patch the source code.
 cd gcc-4.3-20070608 && cat ../../patches/gcc-4.3-20070608-PPU.patch | patch -p1 || { exit 1; }

 ## Create and enter the build directory.
 mkdir build-ppu-stage1 && cd build-ppu-stage1 || { exit 1; }

 ## Configure the build.
 ../configure --prefix="$PS3DEV/ppu" --target="ppu" --enable-languages="c" --with-newlib --without-headers --disable-libssp \
  --enable-threads --disable-checking --with-system-zlib	\
  --enable-__cxa_atexit --disable-libunwind-exceptions		\
  --enable-version-specific-runtime-libs			\
  --with-long-double-128 || { exit 1; }

 ## Compile and install.
 make clean && make -j 2 && make install && make clean || { exit 1; }
