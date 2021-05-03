#!/bin/bash

set -xe

export PYTHON_VERSIONS="3.9.4"

ARCHIVE="cpython-3.9.4-x86_64-unknown-linux-gnu-pgo+lto-20210414T1515.tar.zst"
curl -fSsL "https://github.com/indygreg/python-build-standalone/releases/download/20210415/$ARCHIVE" -o /tmp/$ARCHIVE
mkdir /tmp/python-3.9.4
tar -axvf /tmp/$ARCHIVE -C /tmp/python-3.9.4 --strip-components=1
