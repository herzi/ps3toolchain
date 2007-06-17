#!/bin/sh
# check-libgmp3.sh by Dan Peori (danpeori@oopo.net)

 ## Check for libgmp3.
 ls -l /usr/include/gmp.h 1> /dev/null || { echo "ERROR: Install libgmp3 before continuing."; exit 1; }
