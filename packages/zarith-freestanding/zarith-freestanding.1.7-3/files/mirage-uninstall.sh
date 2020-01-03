#!/bin/sh -eux

PREFIX=`opam config var prefix`

rm -f "$PREFIX/lib/zarith/libzarith-freestanding.a"
rm -f "$PREFIX/lib/zarith/zarith-freestanding.cma"
rm -f "$PREFIX/lib/zarith/zarith-freestanding.cmxa"
rm -f "$PREFIX/lib/zarith/zarith-freestanding.a"
cp META.orig "$PREFIX/lib/zarith/META"
