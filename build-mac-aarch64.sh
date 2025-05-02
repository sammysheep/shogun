#!/bin/bash
# This script builds Shogun for macOS on ARM64 architecture

export MACOSX_DEPLOYMENT_TARGET=11.0
export LDFLAGS="$LDFLAGS -Wl,-ld_classic"
export CFLAGS="$CFLAGS -mmacosx-version-min=$MACOSX_DEPLOYMENT_TARGET"
cd src && CXXFLAGS="-std=gnu++03 -fpermissive -mmacosx-version-min=$MACOSX_DEPLOYMENT_TARGET" ./configure \
    --disable-hdf5 \
    --disable-json \
    --disable-xml \
    --disable-lzo \
    --disable-snappy \
    --disable-gzip \
    --disable-bzip2 \
    --disable-lzma \
    --disable-svm-light \
    --disable-doxygen \
    --enable-static \
    --disable-readline \
    --interfaces=cmdline_static \
    --cxx=/opt/local/bin/g++ \
    --cc=/opt/local/bin/gcc \
    --disable-cpudetection \
    && make \
        -j 12 \
        PRELINKFLAGS_CMDLINE_STATIC=

# Note: we clear prelink flags so we link via the internal archive path
