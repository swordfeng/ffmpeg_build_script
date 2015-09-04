# ffmpeg_build_script
FFmpeg static build script

**WARNING: The compiled FFmpeg is nonfree and unredistributable**

Build ffmpeg with several libraries statically.  
The only depending is gcc/glibc.  
Some of the libraries may be under conflicted licenses.

#### Usage ####
./fetch-libs
./compile-libs
./compile-ffmpeg

#### Requirements ####
*	gcc&g++ || clang&clang++
*	pkg-config
*	gettext with autopoint
*	libtool
*	patch
*	automake
*	autoconf
*	make
*	cmake
*	imake
*	ant
*	git
*	hg > 2.7
*	tar with xz, bzip, gz
*	unzip

####Libraries included now###
-	codecs
	*	libfaac
	*	libfdk-aac
	*	libmp3lame
	*	libopus
	*	libtheora
	*	libvorbis
	*	libx264
	*	libx265
	*	libxvid
	*	libvpx
	*	libopenh264
	*	libpng
	*	libgme
	*	libgsm
	*	libilbc
	*	libass
	*	opencore-amr
	*	openjpeg
	*	libschroedinger
	*	libshine
	*	libspeex
	*	libtwolame
	*	libutvideo
	*	libwavpack
-	formats
	*	libbluray
	*	libudfread
	*	libcdio
	*	libnut
	*	librtmp
-	others
	*	fontconfig
	*	freetype2
	*	bzlib
	*	zlib
	*	numa
	*	fribidi
	*	libbs2b
	*	libcaca
	*	libmodplug
	*	libsoxr
