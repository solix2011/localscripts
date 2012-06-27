#!/bin/sh

USER_PATH=/user/hcm/yvo/working/scripts/tools
E_CODE=65

LOCAL=${PWD}

if [ $1 ] ; then
        ROOT_DIR=$1
else   
	echo "Usage: `basename $0 ` [rootfs_dir] [squashfs_new_file] [description]"
        echo "       `basename $0 ` [directory]"
        echo '          ramdisk file    : rootfs.squashfs.img'
        echo "          description     : squashfs new [`echo ${USER}`@apm.com]"
        exit  $E_CODE
fi

echo 'Create squashfs from directory.'

if [ -d $ROOT_DIR ] ; then
	echo "Rootfs:" $ROOT_DIR
else
	echo "No ["$ROOT_DIR"] directory. Please check..."
	exit 1
fi

if [ $2 ] ; then
	RAMDISK_FILE=$2
else
	RAMDISK_FILE=rootfs.squashfs.img
fi

if [ $3 ] ; then
        LABEL="$3 [`echo ${USER}`@apm.com]"
else
        LABEL="squashfs new [`echo ${USER}`@apm.com]"
fi

sudo mksquashfs ${ROOT_DIR} ramdisk.gz
#sudo ${USER_PATH}/
sudo mkimage -A ppc -O Linux -T Ramdisk -C gzip -n "${LABEL}" -d ${LOCAL}/ramdisk.gz ${LOCAL}/${RAMDISK_FILE}
rm -rf ${LOCAL}/ramdisk.gz
