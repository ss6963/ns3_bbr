#!/bin/bash
hg clone http://code.nsnam.org/bake bake
export BAKE_HOME=`pwd`/bake
export PATH=$PATH:$BAKE_HOME
export PYTHONPATH=$PYTHONPATH:$BAKE_HOME
cp -fv bakeconf_mod.xml bake/bakeconf.xml
mkdir dce_bbr
cd dce_bbr
bake.py configure -e dce-linux-1.9
bake.py download
cp -rfv ../net-next-nuse source/
cp -fv ../dce-iperf.cc source/ns-3-dce/example/
bake.py build
rm -f source/net-next-nuse/liblinux.so
ln -s arch/lib/tools/libsim-linux-4.7.0-rc5.so source/net-next-nuse/liblinux.so
