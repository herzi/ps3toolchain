#!/bin/sh
# gcc-4.3-20070608-spu-stage2.sh by Dan Peori (danpeori@oopo.net)

 ## Download the source code.
 wget --continue ftp://sourceware.org/pub/gcc/snapshots/LATEST-4.3/gcc-4.3-20070608.tar.bz2 || { exit 1; }

 ## Unpack the source code.
 rm -Rf gcc-4.3-20070608 && tar xfvj gcc-4.3-20070608.tar.bz2 || { exit 1; }

 ## Enter the source directory.
 cd gcc-4.3-20070608 || { exit 1; }

 ## Create and enter the build directory.
 mkdir build-spu-stage2 && cd build-spu-stage2 || { exit 1; }

 ## Configure the build.
 ../configure --prefix="$PS3DEV/spu" --target="spu" --enable-languages="c,c++" --with-newlib --enable-cxx-flags="-G0" || { exit 1; }

 ## Compile and install.
 make clean && make -j 2 && make install && make clean || { exit 1; }
