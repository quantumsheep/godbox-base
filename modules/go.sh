#!/bin/bash

set -xe

export GO_VERSIONS="1.16.3"

for VERSION in $GO_VERSIONS; do
    ARCHIVE="go$VERSION.linux-amd64.tar.gz"
    
    curl -fSsL "https://storage.googleapis.com/golang/$ARCHIVE" -o /tmp/$ARCHIVE
    mkdir /usr/local/go-$VERSION
    tar -xf /tmp/$ARCHIVE -C /usr/local/go-$VERSION --strip-components=1
    rm -rf /tmp/*;
done
