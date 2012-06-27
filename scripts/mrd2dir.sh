#!/bin/sh

E_CODE=65
if [ $1 ] ; then
        RAMDISK_FILE=$1
else
        echo "Usage: `basename $0 ` [uRamdisk_file] [extract_dir_name]"
        echo "       `basename $0 ` [uRadisk_file]"
        exit  $E_CODE
fi

echo 'Extract ramdisk... to directory'

if [ -f $RAMDISK_FILE ] ; then
	echo $RAMDISK_FILE
else
	echo "No ["$RAMDISK_FILE"] file. Please check..."
	exit 1
fi

LOCAL=${PWD}

if [ $2 ] ; then	
	MDIR=${LOCAL}/$2
else
	MDIR=${LOCAL}/ramdisk_rootfs
fi

if [ -d $MDIR ] ; then
	rm -rf ${MDIR}
fi

echo "Extract dir: " $MDIR
mkdir ${MDIR}

# Delete garbage
rm -rf ramdisk.gz
sudo rm -rf ramdisk_rootfs
rm -rf ramdisk

#
dd if=${RAMDISK_FILE} bs=64 skip=1 of=ramdisk.gz
gunzip -v ramdisk.gz
mkdir mp
chmod 777 ramdisk
sudo mount -o loop ramdisk mp
mkdir ramdisk_rootfs
sudo cp -R mp/* ${MDIR}
sudo umount mp
rm -rf mp
rm -rf ramdisk
echo "Done"
