#!/bin/bash

set -xe

export PYTHON_VERSIONS="2.7.18 3.9.6"

for VERSION in $PYTHON_VERSIONS; do
    ARCHIVE="python-$VERSION.tar.xz"

    curl -fSsL "https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tar.xz" -o /tmp/$ARCHIVE
    mkdir /tmp/python-$VERSION
    tar -xf /tmp/$ARCHIVE -C /tmp/python-$VERSION --strip-components=1
    rm /tmp/$ARCHIVE
    cd /tmp/python-$VERSION
    ./configure --prefix=/usr/local/python-$VERSION
    make -j$(nproc)
    make -j$(nproc) install
    rm -rf /tmp/*;
done
