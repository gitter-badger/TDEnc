@echo off

call "version.bat"

set VER_URL="http://tde.es.land.to/files/latest_version"
set VER_PATH=".\latest_version"

set LOG_URL="http://tde.es.land.to/files/ChangeLog"
set LOG_PATH=".\ChangeLog"

set AVS_URL="http://voxel.dl.sourceforge.net/project/avisynth2/AviSynth%%202.5/AviSynth%%202.5.8/Avisynth_258.exe"
set AVS_PATH="..\Archives\Avisynth_258.exe"
set AVS_SIZE=4182178

set DSS_URL="http://voxel.dl.sourceforge.net/project/avisynth2/AviSynth%%202.5/AviSynth%%202.5.8/DirectShowSource_2587.zip"
set DSS_PATH="..\Archives\DirectShowSource_2587.zip"
set DSS_SIZE=40150

set DIL_URL="http://voxel.dl.sourceforge.net/project/openil/DevIL%%20Win32/1.7.8/DevIL-EndUser-x86-1.7.8.zip"
set DIL_PATH="..\Archives\DevIL-EndUser-x86-1.7.8.zip"
set DIL_SIZE=676737

set FSS_URL="http://ffmpegsource.googlecode.com/files/FFmpegSource-2.00b10.rar"
set FSS_PATH="..\Archives\FFmpegSource-2.00b10.rar"
set FSS_SIZE=2005005

set MIF_URL="http://voxel.dl.sourceforge.net/project/mediainfo/binary/mediainfo/0.7.32/MediaInfo_CLI_0.7.32_Windows_i386.zip"
set MIF_PATH="..\Archives\MediaInfo_CLI_0.7.32_Windows_i386.zip"
set MIF_SIZE=1144205

set YDF_URL="http://avisynth.org.ru/yadif/yadif17.zip"
set YDF_PATH="..\Archives\yadif17.zip"
set YDF_SIZE=52095

set WVI_URL="http://voxel.dl.sourceforge.net/project/wavi-avi2wav/wavi/1.06/wavi106.zip"
set WVI_PATH="..\Archives\wavi106.zip"
set WVI_SIZE=24271

set NERO_URL="http://ftp6.nero.com/tools/NeroAACCodec-1.5.1.zip"
set NERO_PATH="..\Archives\NeroAACCodec-1.5.1.zip"
set NERO_SIZE=2050564

set X264_URL="http://mirror01.x264.nl/x264/32bit/8bit_depth/revision%X264_VERSION%/x264.exe"
set X264_PATH="..\Archives\x264.exe"
