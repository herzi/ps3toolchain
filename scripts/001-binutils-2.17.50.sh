#!/bin/sh
# binutils-2.17.50.sh by Dan Peori (danpeori@oopo.net)

 ## Download the source code.
 wget --continue ftp://sourceware.org/pub/binutils/snapshots/binutils-2.17.50.tar.bz2 || { exit 1; }

 ## Unpack the source code.
 rm -Rf binutils-2.17.50 && tar xfvj binutils-2.17.50.tar.bz2 || { exit 1; }

 ## Enter the source directory and patch the source code.
 cd binutils-2.17.50 && cat ../../patches/binutils-2.17.50-PS3.patch | patch -p1 || { exit 1; }

 ## For each target...
 for TARGET in "ppu" "spu"; do

  ## Create and enter the build directory.
  mkdir build-$TARGET && cd build-$TARGET || { exit 1; }

  ## Configure the build.
  ../configure --prefix="$PS3DEV/$TARGET" --target="$TARGET" || { exit 1; }

  ## Compile and install.
  make clean && make -j 2 && make install && make clean || { exit 1; }

  ## Exit the build directory.
  cd .. || { exit 1; }

 ## End target.
 done
