#!/bin/sh
# gcc-4.1.1-spu-stage2.sh by Dan Peori (danpeori@oopo.net)

 ## Download the source code.
 wget --continue ftp://ftp.gnu.org/pub/gnu/gcc/gcc-4.1.1/gcc-4.1.1.tar.bz2 || { exit 1; }

 ## Unpack the source code.
 rm -Rf gcc-4.1.1 && tar xfvj gcc-4.1.1.tar.bz2 || { exit 1; }

 ## Enter the source directory and patch the source code.
 cd gcc-4.1.1 && cat ../../patches/gcc-4.1.1-SPU.patch | patch -p1 || { exit 1; }

 ## Create and enter the build directory.
 mkdir build-spu && cd build-spu || { exit 1; }

 ## Configure the build.
 ../configure --prefix="$PS3DEV/spu" --target="spu" --enable-languages="c,c++" --with-newlib --disable-libssp --disable-checking --enable-cxx-flags="-G0" || { exit 1; }

 ## Compile and install.
 make clean && make -j 2 && make install && make clean || { exit 1; }
