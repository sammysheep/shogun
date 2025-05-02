#!/bin/bash

# Tested on Oraclelinux 7

OS=$(uname -s)
ARCH=$(uname -m)

if [[ "$OS" == "Linux" && "$ARCH" == "aarch64" ]]; then
    extra="--disable-cpudetection --target=arm-linux"
fi

yum update &&
    yum install -y gcc gcc-c++ git make &&
    cd src && ./configure \
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
    --interfaces=cmdline_static $extra && make
