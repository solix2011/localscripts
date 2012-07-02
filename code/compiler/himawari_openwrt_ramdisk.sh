#!/bin/sh

E_CODE=65

ROOT_DIR=${PWD}

NOTE_FILE=.test
echo "Himawari IG4 - OpenWRT." > ${NOTE_FILE}
echo "-------------------------" >> ${NOTE_FILE}
echo "- Disable Netfiler, skb=64." >> ${NOTE_FILE}
echo "- atha9k version: 2010-07-06." >> ${NOTE_FILE}
echo "- U10 atheros driver. Support 2x2 and 3x3 cards." >> ${NOTE_FILE}
echo "- Oprofile. - With USB enable" >> ${NOTE_FILE}
echo "- Compile and check code release to Sony US on wifi issue" >> ${NOTE_FILE}

#LINUX_DIR=${ROOT_DIR}/buildroot/bin/himawari_nofilter_op
LINUX_DIR=${ROOT_DIR}/buildroot/bin/himawari
RAMDISK_FILE=${LINUX_DIR}/openwrt-himawari-uRamdisk
RAMDISK_DIR=ramdisk_rootfs
IMAGE_DIR=20-03-2012
SCRIPT_DIR=${ROOT_DIR}/scripts

OUTPUT_FILE=openwrt-himawari-uRamdisk
JFFS2_FILE=openwrt-himawari-rootfs.jffs2
DES="uRamdisk ath9k"

#Application
CONFIG_ATH9K=y
CONFIG_VMSTAT=y
CONFIG_SAR=y
CONFIG_OPROFILE=y
CONFIG_U10=y
CONFIG_LMBENCH=y

ATH9K_MODE=STA
CP_IMAGE=y


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
	COMPACT_WIRELESS=${ROOT_DIR}/buildroot/build_dir/linux-himawari/compat-wireless-2010-07-06
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
        sudo cp /tftpboot/yvo/bin/iperf ${RAMDISK_DIR}/bin
	sudo cp ${SCRIPT_DIR}/iperf_up.sh ${RAMDISK_DIR}/sta

	if [ ${ATH9K_MODE} = "AP" ] ; then
		echo "\033[33mAP mode\033[0m"
		sudo cp ${SCRIPT_DIR}/hostapd-minimal.conf ${RAMDISK_DIR}/sta
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

if [ ${CONFIG_SAR} = "y" ] ; then
        echo "\033[34mCopy sar .... to root filesystem\033[0m"
        sudo cp /tftpboot/yvo/bin/sar.tar.gz ${RAMDISK_DIR}/sta
fi

if [ ${CONFIG_OPROFILE} = "y" ] ; then
        echo "\033[34mCopy oprofile .... to root filesystem\033[0m"
        sudo cp /tftpboot/yvo/bin/oprofile-minimal.tar.gz ${RAMDISK_DIR}/sta
        sudo cp /tftpboot/yvo/bin/get_oprofile.sh ${RAMDISK_DIR}/sta
fi

if [ ${CONFIG_U10} = "y" ] ; then
        echo "\033[34mCopy u10 atheros .... to root filesystem\033[0m"
	sudo cp /tftpboot/yvo/bin/u10_atheros_3x3and2x2.tar.gz ${RAMDISK_DIR}/sta
	#sudo cp /tftpboot/yvo/bin/u10_atheros_3x3and2x2_1.tar.gz ${RAMDISK_DIR}/sta
	sudo cp ${SCRIPT_DIR}/sta_u10.sh ${RAMDISK_DIR}/sta
	sudo cp ${SCRIPT_DIR}/ap_u10.sh ${RAMDISK_DIR}/sta
	sudo cp ${SCRIPT_DIR}/load_u10.sh ${RAMDISK_DIR}/sta

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
	cp ${LINUX_DIR}/openwrt-himawari-uImage ${IMAGE_DIR}
	cp ${ROOT_DIR}/buildroot/build_dir/linux-himawari/openwrt-himawari.dtb ${IMAGE_DIR}
	mv  ${NOTE_FILE} ${IMAGE_DIR}/README
else
	rm -rf ${NOTE_FILE}
fi

sudo rm -rf ${RAMDISK_DIR}
