#!/bin/bash

set -xe

export NODE_VERSIONS="14.16.1"

for VERSION in $NODE_VERSIONS; do
    ARCHIVE="node-v$VERSION-linux-x64.tar.xz"
    
    curl -fSsL "https://nodejs.org/dist/v$VERSION/$ARCHIVE" -o /tmp/$ARCHIVE
    mkdir /usr/local/node-$VERSION
    tar -xf /tmp/$ARCHIVE -C /usr/local/node-$VERSION --strip-components=1
    rm -rf /tmp/*;
done
