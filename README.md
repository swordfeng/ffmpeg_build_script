# ffmpeg_build_script
FFmpeg static build script

**WARNING: The compiled FFmpeg is nonfree and unredistributable**

Build ffmpeg with several libraries statically.  
The only depending is gcc/glibc.  
Some of the libraries may be under conflicted licenses.

#### Requirements ####
*	gcc&g++ || clang&clang++
*	pkg-config
*	gettext
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
*	tar
*	xz, bzip, gz, unzip

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
-	formats
	*	libbluray
-	utils
	*	fontconfig
	*	libfreetype
	*	ladspa
	*	bzlib
	*	zlib
