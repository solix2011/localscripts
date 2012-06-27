#!/bin/sh

E_CODE=65
EXPECTED_ARGS=3

LOCAL=${PWD}

if [ $# -ne $EXPECTED_ARGS ] ; then
	echo "Usage: `basename $0 ` [rootfs_dir] [jffs2_file_name] [nand_type]"
        echo '          nand_type:'
        echo '			1: block size 128k, page size 2k'
        echo '			2: block size 128k, page size 4k'
        echo '			3: block size 16k, page size 512B'
        exit  $E_CODE
fi

echo 'Create jffs2 from directory.'

ROOT_DIR=$1
JFFS2_FILE=$2
NAND_TYPE=$3

if [ $NAND_TYPE -eq "1" ] ; then
	echo "NAND: block size 128K, page size 2K"
	erase_block=0x20000
	page_size=0x800
elif  [ $NAND_TYPE -eq "2" ] ; then
	echo "NAND: block size 128K, page size 4K"
	erase_block=0x20000
	page_size=0x1000

elif  [ $NAND_TYPE -eq "3" ] ; then
	echo "NAND: block size 16K, page size 512B"
	erase_block=0x4000
	page_size=0x200

else
	echo "Incorrect NAND type"
	exit 1
fi


#sudo mkfs.jffs2 -e 0x20000 -p -b -s 0x800 -d ramdisk_rootfs -o rootfs.jffs2  --no-cleanmarkers
sudo mkfs.jffs2 --eraseblock ${erase_block} --pad --big-endian --pagesize ${page_size} --root ${ROOT_DIR} --output ${JFFS2_FILE}  --no-cleanmarkers

