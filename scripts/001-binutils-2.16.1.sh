#!/bin/sh
# binutils-2.16.1.sh by Dan Peori (danpeori@oopo.net)

 ## Download the source code.
 if test ! -f "binutils-2.16.1.tar.bz2"; then
  wget --continue http://www.bsc.es/projects/deepcomputing/linuxoncell/cellsimulator/sdk2.1/sources/toolchain/binutils-2.17.50-20070112.tar.bz2 || { exit 1; }
 fi

 ## Unpack the source code.
 rm -Rf src && tar xfvj binutils-2.17.50-20070112.tar.bz2 || { exit 1; }

 ## Enter the source directory and patch the source code.
 cd src && cat ../../patches/binutils-2.17.50-20070112-PS3.patch | patch -p1 || { exit 1; }

 ## For each target...
 for TARGET in "ppu" "spu"; do

  ## Create and enter the build directory.
  mkdir build-$TARGET && cd build-$TARGET || { exit 1; }

  ## Configure the build.
  ../configure --prefix="$PS3DEV/$TARGET" --target="$TARGET" --enable-install-libbfd || { exit 1; }

  ## Compile and install.
  make clean && make -j 2 && make install && make clean || { exit 1; }

  ## Exit the build directory.
  cd .. || { exit 1; }

 ## End target.
 done
