#!/bin/sh

export TARGET_DIR=`pwd`/build_dir
export SOURCE_DIR=`pwd`/src_dir

if [ ! -e $TARGET_DIR ];then
	mkdir $TARGET_DIR
fi

if [ ! -e $SOURCE_DIR ];then
	mkdir $SOURCE_DIR
fi

export PKG_CONFIG_PATH="${TARGET_DIR}/lib/pkgconfig"
export  PKG_CONFIG_LIBDIR="${TARGET_DIR}/lib/pkgconfig"

export PATH="${TARGET_DIR}/bin:$PATH"
