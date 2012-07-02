#!/bin/sh
KERNEL_DIR=${PWD}/../../linux

make KLIB=${KERNEL_DIR} KLIB_BUILD=${KERNEL_DIR}

