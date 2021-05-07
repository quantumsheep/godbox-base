#!/bin/bash

set -xe

apt-get update
apt-get install -y --no-install-recommends git libcap-dev cmake
rm -rf /var/lib/apt/lists/*
