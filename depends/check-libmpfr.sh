#!/bin/sh
# check-libmpfr.sh by Dan Peori (danpeori@oopo.net)

 ## Check for libmprf.
 ( ls -l /usr/include/mpfr.h || ls -l /usr/local/include/mpfr.h ) 1> /dev/null 2> /dev/null || { echo "ERROR: Install libmpfr before continuing."; exit 1; }
