#!/bin/bash

set -xe

export RUBY_VERSIONS="2.7.3 3.0.1"

for VERSION in $RUBY_VERSIONS; do
    ARCHIVE="ruby-$VERSION.tar.gz"
    
    curl -fSsL "https://cache.ruby-lang.org/pub/ruby/${VERSION%.*}/$ARCHIVE" -o /tmp/$ARCHIVE
    mkdir /tmp/ruby-$VERSION
    tar -xf /tmp/$ARCHIVE -C /tmp/ruby-$VERSION --strip-components=1
    rm /tmp/$ARCHIVE
    cd /tmp/ruby-$VERSION
    ./configure --disable-install-doc --prefix=/usr/local/ruby-$VERSION
    make -j$(nproc)
    make -j$(nproc) install
    rm -rf /tmp/*;
done
