#!/bin/sh

E_CODE=65

ROOT_DIR=${PWD}

#RAMDISK_FILE=/tftpboot/yvo/ramdisk/uRamdisk_net.bin
RAMDISK_FILE=/tftpboot/yvo/ramdisk/uRamdisk_lmbench.bin
RAMDISK_DIR=ramdisk_rootfs
IMAGE_DIR=_image_himawari_ig4_ap
LINUX_DIR=${ROOT_DIR}/../linux
SCRIPT_DIR=${ROOT_DIR}

OUTPUT_FILE=uRamdisk.ath9k
JFFS2_FILE=rootfs.ath9k.jffs2
DES="uRamdisk ath9k"

#Application
CONFIG_ATH9K=n
CONFIG_VMSTAT=y
ATH9K_MODE=AP
CP_IMAGE=y
CONFIG_LMBENCH=n


if [ -d ${RAMDISK_DIR} ] ; then
	sudo rm -rf ${RAMDISK_DIR}
fi

if [ -f ${RAMDISK_FILE} ] ; then 
	echo "\033[31mPrepare ... \033[0m"
	mrd2dir.sh ${RAMDISK_FILE}
else
	echo 'Ramdisk file is not exist.'
	exit $E_CODE
fi

#Compact wireless
if [ ${CONFIG_ATH9K} = "y" ] ; then
	COMPACT_WIRELESS=${ROOT_DIR}/compat-wireless-2010-07-06
	COMPACT_WIRELESS_BUILD=${ROOT_DIR}/_BUILD.ath9k #....................

	if [ -d ${COMPACT_WIRELESS_BUILD} ] ; then
		rm -rf ${COMPACT_WIRELESS_BUILD}
	fi

	mkdir ${COMPACT_WIRELESS_BUILD}

	find ${COMPACT_WIRELESS} -name "*.ko" -exec cp {} ${COMPACT_WIRELESS_BUILD} \;

	echo "\033[34mCopy ath9k driver and scripts .... to root filesystem\033[0m"
	sudo mkdir -p ${RAMDISK_DIR}/sta/lib
	sudo cp ${COMPACT_WIRELESS_BUILD}/* ${RAMDISK_DIR}/sta/lib
	sudo cp ${SCRIPT_DIR}/load_ath9k.sh ${RAMDISK_DIR}/sta

	if [ ${ATH9K_MODE} = "AP" ] ; then
		echo "\033[33mAP mode\033[0m"
		sudo ${SCRIPT_DIR}/cp hostapd-minimal.conf ${RAMDISK_DIR}/sta
		sudo cp ${SCRIPT_DIR}/ap.sh ${RAMDISK_DIR}/sta
		OUTPUT_FILE=$OUTPUT_FILE.ap

	else
		echo "\033[33mStation mode\033[0m"
		sudo cp ${SCRIPT_DIR}/sta.sh ${RAMDISK_DIR}/sta
		sudo cp ${SCRIPT_DIR}/wpa_supplicant.conf ${RAMDISK_DIR}/sta
		OUTPUT_FILE=$OUTPUT_FILE.sta
	fi

	sudo chmod +x ${RAMDISK_DIR}/sta/*
fi

if [ ${CONFIG_VMSTAT} = "y" ] ; then
	echo "\033[34mCopy vmstat .... to root filesystem\033[0m"
	sudo cp /tftpboot/yvo/bin/vmstat ${RAMDISK_DIR}/bin
	sudo cp /tftpboot/yvo/bin/libproc-3.2.7.so ${RAMDISK_DIR}/lib
fi

if [ ${CONFIG_LMBENCH} = "y" ] ; then
        echo "\033[34mCopy lmbench .... to root filesystem\033[0m"
        sudo cp /tftpboot/yvo/bin/lmbench/* ${RAMDISK_DIR}/usr/bin
fi


echo "\033[31mGenerating ramdisk ...\033[0m"
mdir2rd.sh ${RAMDISK_DIR} ${OUTPUT_FILE} ${DES}
sleep 1

echo "\033[31mGenerating jffs2 ...\033[0m"
mdir2jffs2.sh ${RAMDISK_DIR} ${JFFS2_FILE} 1
sleep 1

if [ ${CP_IMAGE} = "y" ] ; then
	if [ -d ${IMAGE_DIR} ] ; then
		rm -rf ${IMAGE_DIR}
	fi
	mkdir -p ${IMAGE_DIR}
	echo "\033[31mCopy images to " ${IMAGE_DIR} "\033[0m"
	mv ${JFFS2_FILE} ${IMAGE_DIR}
	mv ${OUTPUT_FILE} ${IMAGE_DIR}
	cp ${LINUX_DIR}/arch/powerpc/boot/uImage ${IMAGE_DIR}
	cp ${LINUX_DIR}/arch/powerpc/boot/himawari.dtb ${IMAGE_DIR}
fi

sudo rm -rf ${RAMDISK_DIR}
