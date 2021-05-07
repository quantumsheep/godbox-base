#!/bin/bash

set -xe

cp /etc/apt/sources.list /etc/apt/sources.list.bkp
echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list
echo "deb-src http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list
apt-get update
apt-get install -y --no-install-recommends linux-perf-5.10/buster-backports
rm -rf /var/lib/apt/lists/*
mv /etc/apt/sources.list.bkp /etc/apt/sources.list
