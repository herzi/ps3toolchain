#!/bin/sh
# gcc-4.3-stage1.sh by Dan Peori (danpeori@oopo.net)

 ## Download the source code.
 wget --continue ftp://sourceware.org/pub/gcc/snapshots/LATEST-4.3/gcc-4.3-20070608.tar.bz2 || { exit 1; }

 ## Unpack the source code.
 rm -Rf gcc-4.3-20070608 && tar xfvj gcc-4.3-20070608.tar.bz2 || { exit 1; }

 ## Enter the source directory and patch the source code.
 cd gcc-4.3-20070608 && cat ../../patches/gcc-4.3-20070608-PS3.patch | patch -p1 || { exit 1; }

 ## For each target...
 for TARGET in "ppu" "spu"; do

  ## Create and enter the build directory.
  mkdir build-$TARGET && cd build-$TARGET || { exit 1; }

  ## Configure the build.
  ../configure --prefix="$PS3DEV/$TARGET" --target="$TARGET" --enable-languages="c" --with-newlib --without-headers --disable-libssp || { exit 1; }

  ## Compile and install.
  make clean && make -j 2 && make install && make clean || { exit 1; }

  ## Exit the build directory.
  cd .. || { exit 1; }

 ## End target.
 done
