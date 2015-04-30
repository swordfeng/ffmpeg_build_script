#!/bin/sh

export TARGET_DIR=`pwd`/build_dir
export BUILD_DIR=`pwd`

if [ ! -e $TARGET_DIR ];then
	mkdir $TARGET_DIR
fi

export PKG_CONFIG_PATH="${TARGET_DIR}/lib/pkgconfig"
export  PKG_CONFIG_LIBDIR="${TARGET_DIR}/lib/pkgconfig"

export PATH="${TARGET_DIR}/bin:$PATH"