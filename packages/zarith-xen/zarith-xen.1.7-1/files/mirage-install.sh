#!/bin/sh -eux

PREFIX=`opam config var prefix`
PKG_CONFIG_PATH="$PREFIX/lib/pkgconfig"
export PKG_CONFIG_PATH

LDFLAGS=`pkg-config --libs gmp-xen`
export LDFLAGS

# WARNING: if you pass invalid cflags here, zarith will silently
# fall back to compiling with the default flags instead!
CFLAGS="`pkg-config --cflags gmp-xen mirage-xen-posix` -O2 -pedantic -fomit-frame-pointer -fno-builtin"
export CFLAGS
OCAMLFLAGS="-no-keep-locs"
export OCAMLFLAGS
OCAMLOPTFLAGS="-no-keep-locs"
export OCAMLOPTFLAGS
./configure -nodynlink -gmp
make

cp libzarith.a "$PREFIX/lib/zarith/libzarith-xen.a"
cp zarith.cma  "$PREFIX/lib/zarith/zarith-xen.cma"
cp zarith.cmxa "$PREFIX/lib/zarith/zarith-xen.cmxa"
cp zarith.a    "$PREFIX/lib/zarith/zarith-xen.a"
cp "$PREFIX/lib/zarith/META" "$PREFIX/lib/zarith/META.xen.orig"

cat >>"$PREFIX/lib/zarith/META" <<EOM
xen_linkopts = "-lzarith-xen -L@gmp-xen -lgmp-xen"

package "xen" (
  requires = "mirage-xen"
  archive(byte) = "zarith-xen.cma"
  archive(native) = "zarith-xen.cmxa"
)
EOM
