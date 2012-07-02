#! /bin/sh

export AR=${CROSS_COMPILE}ar
export AS=${CROSS_COMPILE}as
export LD=${CROSS_COMPILE}ld
export RANLIB=${CROSS_COMPILE}ranlib
export CC=${CROSS_COMPILE}gcc
export NM=${CROSS_COMPILE}nm
export CXX=${CROSS_COMPILE}g++
export STRIP=${CROSS_COMPILE}strip
export ac_cv_linux_vers=2

#./configure --build=i686 --host=ppc-4xx-linux --with-pcap=linux
./configure --build=x86_64 --host=powerpc-apm-linux-gnu --prefix=/AMCC/yvo/working/materials/stress-1.0.4/_BUILD

