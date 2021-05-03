!/bin/bash

set -xe

export GCC_VERSIONS="7.5.0 8.4.0 9.3.0 11.1.0"

for VERSION in $GCC_VERSIONS; do
    ARCHIVE="gcc-$VERSION.tar.gz"

    curl -fSsL "https://ftpmirror.gnu.org/gcc/gcc-$VERSION/$ARCHIVE" -o /tmp/$ARCHIVE
    mkdir /tmp/gcc-$VERSION
    tar -xf /tmp/$ARCHIVE -C /tmp/gcc-$VERSION --strip-components=1
    rm /tmp/$ARCHIVE
    cd /tmp/gcc-$VERSION
    ./contrib/download_prerequisites
    tmpdir="$(mktemp -d)"
    cd "$tmpdir"
    /tmp/gcc-$VERSION/configure --disable-multilib --enable-languages=c,c++,fortran --prefix=/usr/local/gcc-$VERSION
    make -j$(nproc)
    make -j$(nproc) install-strip
    rm -rf /tmp/*;
done
