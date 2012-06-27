#!/bin/sh

E_CODE=65
if [ $1 ] ; then
        RAMDISK_FILE=$1
else   
        echo "Usage: `basename $0 ` [squashfs file name]"
        exit  $E_CODE
fi

echo 'Extract unsquashfs file... to directory'

if [ -f $RAMDISK_FILE ] ; then
	echo $RAMDISK_FILE
else
	echo "No ["$RAMDISK_FILE"] file. Please check..."
	exit 1
fi

# Delete garbage
rm -rf ramdisk.gz
sudo rm -rf squashfs-root
rm -rf ramdisk

#
dd if=${RAMDISK_FILE} bs=64 skip=1 of=ramdisk.gz
sudo unsquashfs ramdisk.gz
rm -rf ramdisk.gz
echo "Done"
