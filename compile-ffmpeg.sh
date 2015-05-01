#!/bin/sh

source ./compile-env.sh

cd $BUILD_DIR/ffmpeg*
./configure \
--prefix="${TARGET_DIR}" \
--pkg-config-flags="--static" \
--extra-cflags="-static -I${TARGET_DIR}/include" \
--extra-cxxflags="-static -I${TARGET_DIR}/include" \
--extra-ldflags="-L${TARGET_DIR}/lib" \
--disable-debug \
--enable-static \
--disable-ffplay \
--disable-ffserver \
--disable-doc \
--disable-devices \
--disable-sdl \
--disable-xlib \
--enable-gpl --enable-version3 --enable-nonfree \
--enable-gray --enable-runtime-cpudetect \
--enable-fontconfig \
--enable-libfaac \
--enable-libfdk-aac \
--enable-libmp3lame \
--enable-libopus \
--enable-libtheora \
--enable-libvorbis \
--enable-libx264 \
--enable-libx265 \
--enable-libxvid \
--enable-libvpx \
--enable-bzlib \
--enable-zlib \
--enable-libopenh264 \
--disable-libxcb \
--disable-libxcb-shm \
--disable-libxcb-xfixes \
--disable-libxcb-shape
make -j 3 && make install
#CFLAGS="--static -I$TARGET_DIR/include" LDFLAGS="-static -L${TARGET_DIR}/lib -lm -lstdc++" \
#--extra-cflags="--static -I${TARGET_DIR}/include" --extra-ldflags="-L${TARGET_DIR}/lib -lm -lstdc++" 
# \
