#!/bin/sh -eux

PREFIX=`opam config var prefix`

rm -f "$PREFIX/lib/zarith/libzarith-xen.a"
rm -f "$PREFIX/lib/zarith/zarith-xen.cma"
rm -f "$PREFIX/lib/zarith/zarith-xen.cmxa"
rm -f "$PREFIX/lib/zarith/zarith-xen.a"
cp "$PREFIX/lib/zarith/META.xen.orig" "$PREFIX/lib/zarith/META"
