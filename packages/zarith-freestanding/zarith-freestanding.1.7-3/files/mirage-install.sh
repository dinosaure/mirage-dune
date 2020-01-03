#!/bin/sh -eux

PREFIX=`opam config var prefix`
PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH

cp libzarith.a "$PREFIX/lib/zarith/libzarith-freestanding.a"
cp zarith.cma  "$PREFIX/lib/zarith/zarith-freestanding.cma"
cp zarith.cmxa "$PREFIX/lib/zarith/zarith-freestanding.cmxa"
cp zarith.a    "$PREFIX/lib/zarith/zarith-freestanding.a"

patch -d $PREFIX/lib/zarith < meta.patch
