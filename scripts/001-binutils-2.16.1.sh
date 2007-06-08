#!/bin/sh
# binutils-2.17.sh by Dan Peori (danpeori@oopo.net)

 ## Download the source code.
 wget --continue ftp://ftp.gnu.org/pub/gnu/binutils/binutils-2.17.tar.bz2 || { exit 1; }

 ## Unpack the source code.
 rm -Rf binutils-2.17 && tar xfvj binutils-2.17.tar.bz2 || { exit 1; }

 ## Enter the source directory and patch the source code.
 cd binutils-2.17 && cat ../../patches/binutils-2.17-PS3.patch | patch -p1 || { exit 1; }

 ## For each target...
 for TARGET in "ppu" "spu"; do

  ## Create and enter the build directory.
  mkdir build-$TARGET && cd build-$TARGET || { exit 1; }

  ## Configure the build.
  ../configure --prefix="$PS3DEV/$TARGET" --target="$TARGET" --disable-shared --disable-nls --disable-werror || { exit 1; }

  ## Compile and install.
  make clean && make -j 2 && make install && make clean || { exit 1; }

  ## Exit the build directory.
  cd .. || { exit 1; }

 ## End target.
 done
