#!/bin/sh
EXPECTED_ARGS=1
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  echo "Usage: `basename $0` <uRamdisk_file>"
  exit $E_BADARGS
fi

dd if=$1 of=$1.ext2.gz bs=64 skip=1; 
gunzip $1.ext2.gz
