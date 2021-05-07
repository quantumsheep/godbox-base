#!/bin/bash

git clone https://github.com/judge0/isolate.git /tmp/isolate
cd /tmp/isolate
git checkout ad39cc4d0fbb577fb545910095c9da5ef8fc9a1a
make -j$(nproc) install
rm -rf /tmp/*
