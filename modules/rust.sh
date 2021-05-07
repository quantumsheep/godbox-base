#!/bin/bash

set -xe

export RUST_VERSIONS="1.52.0 beta nightly"

for VERSION in $RUST_VERSIONS; do
    curl -fSsL "https://static.rust-lang.org/dist/rust-$VERSION-x86_64-unknown-linux-gnu.tar.gz" -o /tmp/rust-$VERSION.tar.gz
    mkdir /tmp/rust-$VERSION
    tar -xf /tmp/rust-$VERSION.tar.gz -C /tmp/rust-$VERSION --strip-components=1
    rm /tmp/rust-$VERSION.tar.gz
    cd /tmp/rust-$VERSION
    ./install.sh --prefix=/usr/local/rust-$VERSION --components=rustc,rust-std-x86_64-unknown-linux-gnu,cargo
    rm -rf /tmp/*;
done
