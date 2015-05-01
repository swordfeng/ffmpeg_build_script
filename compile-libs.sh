#!/bin/sh
jval=3

source ./compile-env.sh

echo "*** Building yasm ***"
cd $SOURCE_DIR/yasm*
./autogen.sh
./configure --prefix=$TARGET_DIR
make -j $jval
make install

echo "*** Building zlib ***"
cd $SOURCE_DIR/zlib*
./configure --prefix=$TARGET_DIR
make -j $jval
make install

echo "*** Building bzip2 ***"
cd $SOURCE_DIR/bzip2*
make -j $jval
make install PREFIX=$TARGET_DIR

echo "*** Building liblzma ***"
cd $SOURCE_DIR/xz*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building freetype2 ***"
cd $SOURCE_DIR/freetype*
./autogen
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building fontconfig ***"
cd $SOURCE_DIR/fontconfig*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install


echo "*** Building libpng ***"
cd $SOURCE_DIR/libpng*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

# Ogg before vorbis
echo "*** Building libogg ***"
cd $SOURCE_DIR/libogg*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

# Vorbis before theora
echo "*** Building libvorbis ***"
cd $SOURCE_DIR/libvorbis*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building libtheora ***"
cd $SOURCE_DIR/libtheora*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building livpx ***"
cd $SOURCE_DIR/libvpx*
./configure --prefix=$TARGET_DIR --disable-shared
make -j $jval
make install

echo "*** Building faac ***"
cd $SOURCE_DIR/faac*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared # --without-mp4v2
# FIXME: gcc incompatibility, does not work with log()

sed -i -e "s|^char \*strcasestr.*|//\0|" common/mp4v2/mpeg4ip.h
make -j $jval
make install

echo "*** Building x264 ***"
cd $SOURCE_DIR/x264*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared --disable-opencl
make -j $jval
make install

echo "*** Building xvidcore ***"
cd "$SOURCE_DIR/xvidcore/build/generic"
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install
rm $TARGET_DIR/lib/libxvidcore.so.*

echo "*** Building lame ***"
cd $SOURCE_DIR/lame*
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building opus ***"
cd $SOURCE_DIR/opus*
./autogen.sh
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building openh264 ***"
cd $SOURCE_DIR/openh264*
PREFIX=${TARGET_DIR} make -e -j $jval
PREFIX=${TARGET_DIR} make -e install

echo "*** Building x265 ***"
cd $SOURCE_DIR/x265
cmake -G "Unix Makefiles" -DCMAKE_INSTALL_PREFIX=$TARGET_DIR -DENABLE_SHARED=OFF -DYASM_EXECUTABLE=$TARGET_DIR/bin/yasm source
make -j $jval
make install

echo "*** Building fdkaac ***"
cd $SOURCE_DIR/fdk-aac*
./autogen.sh
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building ladspa ***"
cd $SOURCE_DIR/ladspa*/src
make -e -j $jval
INSTALL_PLUGINS_DIR=$TARGET_DIR/lib/ladspa/ \
INSTALL_INCLUDE_DIR=$TARGET_DIR/include/ \
INSTALL_BINARY_DIR=$TARGET_DIR/bin/ \
make -e install

echo "*** Building fribidi ***"
cd $SOURCE_DIR/fribidi*
autoreconf -fiv
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
# c2man cannot be disabled through configure?
sed -i -e "s/^all:.*$/all:/" doc/Makefile
make -j $jval
make install

echo "*** Building libass ***"
cd $SOURCE_DIR/libass*
./autogen.sh
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building libxml ***"
cd $SOURCE_DIR/libxml*
./autogen.sh
./configure --prefix=$TARGET_DIR --enable-static --disable-shared --without-python
make -j $jval
make install

echo "*** Building libudfread ***"
cd $SOURCE_DIR/libudfread*
autoreconf -fiv
./configure --prefix=$TARGET_DIR --enable-static --disable-shared
make -j $jval
make install

echo "*** Building libbluray ***"
cd $SOURCE_DIR/libbluray*
autoreconf -fiv
if [ -e $SOURCE_DIR/libudfread* ]; then
	rm -rf ./contrib/libudfread/src
	ln -s $SOURCE_DIR/libudfread*/src ./contrib/libudfread/
	./configure --prefix=$TARGET_DIR --enable-static --disable-shared --enable-udf
else
	./configure --prefix=$TARGET_DIR --enable-static --disable-shared
fi
make -j $jval
make install
# hotfix - libbluray has incomplete dependancy for fontconfig
sed -i -e "s/^Libs.private:.*$/\0 -lfontconfig -lexpat -lfreetype -lbz2 -lpng16 -lm -lz -lm -lz/" $TARGET_DIR/lib/pkgconfig/libbluray.pc


# FIXME: only OS-specific
rm -f "$TARGET_DIR/lib/*.dylib"
rm -f "$TARGET_DIR/lib/*.so"
rm -f "$TARGET_DIR/lib/*.so.*"
rm -f "$TARGET_DIR/lib/*.la"



