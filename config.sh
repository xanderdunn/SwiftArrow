#!/bin/sh
#
# Configuration for the module to compile, the Swift toolchain, and
# the compiler and linker flags to use.
#
VER=1.0
GLIB_VER=2.0
Mod=`grep name: Package.swift | head -n1 | cut -d'"' -f2`
Module=${Mod}-${VER}
module=`echo "${Module}" | tr '[:upper:]' '[:lower:]'`
mod="arrow-glib"

echo $mod
LINKFLAGS=`pkg-config --libs $mod gio-unix-$GLIB_VER glib-$GLIB_VER | tr ' ' '\n' | sed -e 's/^/-Xlinker /' -e 's/-Wl,//g' -e 's/ -pthread/ -lpthread/g' | tr '\n' ' ' | sed -e 's/-Xcc[ 	]*-Xlinker/-Xlinker/g' -e 's/-Xlinker[ 	]*-Xcc/-Xcc/g' -e 's/-Xlinker[ 	]*--export-dynamic//g' -e 's/-Xlinker[ 	]*-Xlinker/-Xlinker/g' -e 's/-Xcc *$//' -e 's/-Xlinker *$//'`
CCFLAGS=`pkg-config --cflags $mod gio-unix-$GLIB_VER glib-$GLIB_VER | tr ' ' '\n' | sed 's/^/-Xcc /' | tr '\n' ' ' | sed -e 's/-Xcc[ 	]*-Xlinker/-Xlinker/g' -e 's/-Xlinker[ 	]*-Xcc/-Xcc/g' -e 's/-Xlinker[ 	]*--export-dynamic//g' -e 's/-Xlinker[ 	]*-Xlinker/-Xlinker/g' -e 's/-Xcc *$//' -e 's/-Xlinker *$//'`
TAC="tail -r"
echo $LINKFLAGS
echo $CCFLAGS
if which tac >/dev/null ; then
   TAC=tac
   else if which gtac >/dev/null ; then
	TAC=gtac
   fi
fi
