#!/bin/bash
# This script builds Shogun for macOS on ARM64 architecture

export MACOSX_DEPLOYMENT_TARGET=11.0
cd src && CXXFLAGS="-std=gnu++03" ./configure \
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
    --disable-cpudetection \
    --cxx=/usr/bin/clang++ \
    --cc=/usr/bin/clang \
    && make \
        -j 12 \
        PRELINKFLAGS_CMDLINE_STATIC=

# Note: we clear prelink flags so we link via the internal archive path