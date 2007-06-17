#!/bin/sh
# gcc-4.3-20070608-spu-stage1.sh by Dan Peori (danpeori@oopo.net)

 ## Download the source code.
 wget --continue ftp://sourceware.org/pub/gcc/snapshots/4.3-20070608/gcc-4.3-20070608.tar.bz2 || { exit 1; }

 ## Unpack the source code.
 rm -Rf gcc-4.3-20070608 && tar xfvj gcc-4.3-20070608.tar.bz2 || { exit 1; }

 ## Enter the source directory.
 cd gcc-4.3-20070608 || { exit 1; }

 ## Create and enter the build directory.
 mkdir build-spu-stage1 && cd build-spu-stage1 || { exit 1; }

 ## Configure the build.
 ../configure --prefix="$PS3DEV/spu" --target="spu" --enable-languages="c" --with-newlib --disable-nls || { exit 1; }

 ## Compile and install.
 make clean && make -j 2 && make install && make clean || { exit 1; }
