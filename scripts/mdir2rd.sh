#!/bin/sh

#USER_PATH=/user/hcm/yvo/working/scripts/tools

LOCAL=${PWD}

E_CODE=65

if [ $1 ] ; then
        ROOT_DIR=$1
else   
	echo "Usage: `basename $0 ` [rootfs_dir] [uRamdisk_new_file] [description]"
	echo "       `basename $0 ` [directory]"
	echo '		ramdisk file	: new-uRamdisk.bin'
	echo "		description	: uRamdisk new [`echo ${USER}`@apm.com]"
	exit  $E_CODE
fi

echo 'Create ramdisk from directory.'

if [ -d $ROOT_DIR ] ; then
	echo "Rootfs:" $ROOT_DIR
else
	echo "No ["$ROOT_DIR"] directory. Please check..."
	exit 1
fi

if [ $2 ] ; then
	RAMDISK_FILE=$2
else
	RAMDISK_FILE=new-uRamdisk.bin
fi

if [ $3 ] ; then
	LABEL="$3 [`echo ${USER}`@apm.com]"
else
	LABEL="uRamdisk new [`echo ${USER}`@apm.com]"
fi

rootfs_size=`sudo du -s --block-size=MB ${ROOT_DIR} | awk '{print $1}' | sed -e "s/MB//"`	
# free 10 MB
rootfs_new_size=$((${rootfs_size} + 10))
dd if=/dev/zero of=${LOCAL}/rootfs.ext2 bs=1M count=${rootfs_new_size}
mkfs.ext2 -F ${LOCAL}/rootfs.ext2

if [ -d ${LOCAL}/.tmp_mnt ] ; then
	sudo rm -rf ${LOCAL}/.tmp_mnt
fi

mkdir ${LOCAL}/.tmp_mnt
sudo mount -o loop ${LOCAL}/rootfs.ext2 ${LOCAL}/.tmp_mnt
sudo cp -ra $ROOT_DIR/* ${LOCAL}/.tmp_mnt
sudo umount ${LOCAL}/.tmp_mnt
sleep 1
sudo rm -rf ${LOCAL}/.tmp_mnt

#sudo ${USER_PATH}/genext2fs --squash-uids --size-in-blocks 49152 --number-of-inodes 6000 --root ${LOCAL}/${ROOT_DIR} ${LOCAL}/rootfs.ext2
gzip -v9 -f ${LOCAL}/rootfs.ext2
${USER_PATH}/mkimage -A ppc -O Linux -T Ramdisk -C gzip -n "${LABEL}" -d ${LOCAL}/rootfs.ext2.gz ${LOCAL}/${RAMDISK_FILE}

rm -rf ${LOCAL}/.tmp_uramdisk.ext2
rm -rf ${LOCAL}/rootfs.ext2.gz


