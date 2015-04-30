#!/bin/sh
jval=3

source ./compile-env.sh

echo "*** Building yasm ***"
cd $BUILD_DIR/yasm*
./configure --prefix=$TARGET_DIR
make -j $jval
make install

echo "*** Building zlib ***"
cd $BUILD_DIR/zlib*
./configure --prefix=$TARGET_DIR
make -j $jval
make install

echo "*** Building bzip2 ***"
cd $BUILD_DIR/bzip2*
make -j $jval
make install PREFIX=$TARGET_DIR

echo "*** Building liblzma ***"
cd $BUILD_DIR/xz*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

#echo "*** Building libva ***"
#cd $BUILD_DIR/libva*
#./configure --prefix=$TARGET_DIR --enable-static --disable-shared
#make -j $jval
#make install

#echo "*** Building libvdpau ***"
#cd $BUILD_DIR/libvdpau*
#./autogen.sh
#./configure --prefix=$TARGET_DIR --enable-static --disable-shared
#make -j $jval
#make install

echo "*** Building freetype2 ***"
cd $BUILD_DIR/freetype*
./autogen
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building fontconfig ***"
cd $BUILD_DIR/fontconfig*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install


echo "*** Building libpng ***"
cd $BUILD_DIR/libpng*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

# Ogg before vorbis
echo "*** Building libogg ***"
cd $BUILD_DIR/libogg*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

# Vorbis before theora
echo "*** Building libvorbis ***"
cd $BUILD_DIR/libvorbis*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building libtheora ***"
cd $BUILD_DIR/libtheora*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building livpx ***"
cd $BUILD_DIR/libvpx*
./configure --prefix=$TARGET_DIR --disable-shared
make -j $jval
make install

echo "*** Building faac ***"
cd $BUILD_DIR/faac*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared # --without-mp4v2
# FIXME: gcc incompatibility, does not work with log()

sed -i -e "s|^char \*strcasestr.*|//\0|" common/mp4v2/mpeg4ip.h
make -j $jval
make install

echo "*** Building x264 ***"
cd $BUILD_DIR/x264*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared --disable-opencl
make -j $jval
make install

echo "*** Building xvidcore ***"
cd "$BUILD_DIR/xvidcore/build/generic"
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install
rm $TARGET_DIR/lib/libxvidcore.so.*

echo "*** Building lame ***"
cd $BUILD_DIR/lame*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building opus ***"
cd $BUILD_DIR/opus*
./autogen.sh
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building openh264 ***"
cd $BUILD_DIR/openh264*
sed -i -e "s/PREFIX=.*\b/PREFIX=${TARGET_DIR}/" Makefile
make -j $jval
make install

echo "*** Building x265 ***"
cd $BUILD_DIR/x265
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$TARGET_DIR -DENABLE_SHARED=OFF source
make -j $jval
make install

echo "*** Building fdkaac ***"
cd $BUILD_DIR/fdk-aac*
./autogen.sh
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

# FIXME: only OS-specific
rm -f "$TARGET_DIR/lib/*.dylib"
rm -f "$TARGET_DIR/lib/*.so"
rm -f "$TARGET_DIR/lib/*.so.*"
rm -f "$TARGET_DIR/lib/*.la"



