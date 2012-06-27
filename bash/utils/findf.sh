#!/bin/bash
umask 022

if [ $1 ] ; then
	if [ $2 ] ; then
        	dir=$1	
		file=$2
	else
        	dir=.
		file=$1
	fi	
	find $dir -name $file
else   
	echo 'Ex: 	findf [file name]'
	echo '	findf [dir] [file name]'
fi

