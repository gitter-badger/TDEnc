rem ################�ϐ��ݒ�################
set INFO_AVS=%TEMP_DIR%\information.avs
set X264_TC_FILE=%TEMP_DIR%\x264.tc


rem ################������擾################
echo;
echo ^>^>%ANALYZE_ANNOUNCE%
echo;

rem ����̃t�H�[�}�b�g�����o��
.\MediaInfo.exe --Inform=Video;%%CodecID%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do echo Video Codec  : %%i
.\MediaInfo.exe --Inform=Video;%%BitRate_Mode%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set VBITRATE_MODE=%%i
if not "%VBITRATE_MODE%"== "" echo AudioBR Mode : %VBITRATE_MODE%
.\MediaInfo.exe --Inform=Audio;%%Format%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do echo Audio Format : %%i
.\MediaInfo.exe --Inform=Audio;%%CodecID%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do echo Audio Codec  : %%i
.\MediaInfo.exe --Inform=Audio;%%BitRate_Mode%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set ABITRATE_MODE=%%i
if not "%ABITRATE_MODE%"== "" echo AudioBR Mode : %ABITRATE_MODE%

rem ����̗e�ʏ����o��
.\MediaInfo.exe --Inform=General;%%FileSize%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set INPUT_FILE_SIZE=%%i
echo FileSize     : %INPUT_FILE_SIZE%byte

rem �Đ����Ԃ̏����o��
.\MediaInfo.exe --Inform=General;%%PlayTime%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul

rem �Đ����Ԃ̐ݒ�
for /f "delims=" %%i in (%TEMP_INFO%) do set TOTAL_TIME=%%i
echo PlayTime     : %TOTAL_TIME%ms

rem CFR�i�Œ�t���[�����[�g�j��VFR�i�σt���[�����[�g�j�̔��f
.\MediaInfo.exe --Inform=Video;%%FrameRate_Mode%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set FPS_MODE=%%i
if "%FPS_MODE%"=="VFR" goto vfr_info

rem CFR�̐ݒ�
set VFR=false
.\MediaInfo.exe --Inform=Video;%%FrameRate%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set INPUT_FPS=%%i
echo FPS          : %INPUT_FPS%fps^(CFR^)
goto fps_main

rem VFR�̐ݒ�
:vfr_info
set VFR=true
.\MediaInfo.exe --Inform=Video;%%FrameRate%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set INPUT_FPS=%%i
echo FPS          : %INPUT_FPS%fps^(VFR^)
.\MediaInfo.exe --Inform=Video;%%FrameRate_Minimum%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do echo Minimum FPS  : %%i
.\MediaInfo.exe --Inform=Video;%%FrameRate_Maximum%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do echo Maximum FPS  : %%i

:fps_main
if "%DEFAULT_FPS%"=="" (
    set CHANGE_FPS=false
    set FPS=%INPUT_FPS%
) else (
    set CHANGE_FPS=true
    set FPS=%DEFAULT_FPS%
)

rem �𑜓x�̐ݒ�
.\MediaInfo.exe --Inform=Video;%%Width%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set IN_WIDTH=%%i
echo Width        : %IN_WIDTH%pixels
.\MediaInfo.exe --Inform=Video;%%Height%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set IN_HEIGHT=%%i
echo Height       : %IN_HEIGHT%pixels

rem �A�X�y�N�g��
.\MediaInfo.exe --Inform=Video;%%DisplayAspectRatio%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set D_ASPECT=%%i
echo AspectRatio  : %D_ASPECT%
.\MediaInfo.exe --Inform=Video;%%PixelAspectRatio%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set P_ASPECT=%%i

rem �C���^�[���[�X�֘A�̐ݒ�
:interlace
.\MediaInfo.exe --Inform=Video;%%ScanType%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set SCAN_TYPE=%%i
if not "%SCAN_TYPE%"=="" echo Scan type    : %SCAN_TYPE%
.\MediaInfo.exe --Inform=Video;%%ScanOrder%% --LogFile=%TEMP_INFO% %INPUT_FILE_PATH%>nul
for /f "delims=" %%i in (%TEMP_INFO%) do set SCAN_ORDER=%%i
if not "%SCAN_ORDER%"=="" echo Scan order   : %SCAN_ORDER%

rem IDR�t���[���Ԃ̍ő�Ԋu�E�e�ʏ���̐ݒ�
if /i "%DECODER%"=="avi" goto avisource_info
if /i "%DECODER%"=="ffmpeg" goto ffmpegsource_info
if /i "%DECODER%"=="directshow" goto directshowsource_info

:directshowsource_info
(
    echo LoadPlugin^("DirectShowSource.dll"^)
    echo;
    echo DirectShowSource^(%INPUT_FILE_PATH%, audio = false^) 
)> %INFO_AVS%
goto infoavs

:avisource_info
echo AVISource^(%INPUT_FILE_PATH%, audio = false^)> %INFO_AVS%
goto infoavs

:ffmpegsource_info
if "%VFR%"=="true" (
    echo;
    echo exporting timecode...
    if exist %X264_TC_FILE% del %X264_TC_FILE%
    .\x264 --preset ultrafast -q 51 -o nul --no-progress --quiet --tcfile-out %X264_TC_FILE% %INPUT_FILE_PATH% 2>nul
    if exist %X264_TC_FILE% (
        echo done.
        set X264_VFR_ENC=true
        set TEMP_264=%TEMP_DIR%\video.mp4
    ) else (
        echo failed.
        echo ^(encode as cfr^)
    )
)
(
    echo LoadPlugin^("ffms2.dll"^)
    echo FFVideoSource^("input%INPUT_FILE_TYPE%",cache=false^)
)> %INFO_AVS%

:infoavs
(
    echo;
    echo _isyv12 = IsYV12^(^)
    echo _isrgb = IsRGB^(^)
    echo _keyint = String^(Round^(%FPS%^)^)
    echo _premium_bitrate = String^(Floor^(Float^(%DEFAULT_SIZE_PREMIUM%^) * 1024 * 1024 * 8 / %TOTAL_TIME%^)^)
    echo _normal_bitrate = String^(Floor^(Float^(%DEFAULT_SIZE_NORMAL%^) * 1024 * 1024 * 8 / %TOTAL_TIME%^)^)
    echo _in_width = String^(Floor^(Float^(%IN_WIDTH%^) * %P_ASPECT%^)^)
    echo;
    echo WriteFileStart^("yv12.txt","_isyv12",append = false^)
    echo WriteFileStart^("rgb.txt","_isrgb",append = false^)
    echo WriteFileStart^("keyint.txt","_keyint",append = false^)
    echo WriteFileStart^("premium_bitrate.txt","_premium_bitrate",append = false^)
    echo WriteFileStart^("normal_bitrate.txt","_normal_bitrate",append = false^)
    echo WriteFileStart^("in_width.txt","_in_width",append = false^)
    echo;
    echo Trim^(0,-1^)
    echo;
    echo return last
)>> %INFO_AVS%

.\wavi.exe %INFO_AVS% 1>nul 2>&1

for /f "delims=" %%i in (%TEMP_DIR%\yv12.txt) do set YV12=%%i>nul
for /f "delims=" %%i in (%TEMP_DIR%\rgb.txt) do set RGB=%%i>nul
for /f "delims=" %%i in (%TEMP_DIR%\keyint.txt) do set /a KEYINT=%%i*10>nul
for /f "delims=" %%i in (%TEMP_DIR%\premium_bitrate.txt) do set /a P_TEMP_BITRATE=%%i>nul
for /f "delims=" %%i in (%TEMP_DIR%\normal_bitrate.txt) do set /a I_TEMP_BITRATE=%%i>nul
for /f "delims=" %%i in (%TEMP_DIR%\in_width.txt) do set IN_WIDTH=%%i>nul

rem �o�͉𑜓x�̐ݒ�
set /a OUT_WIDTH_ODD=%IN_WIDTH% %% 2
set /a OUT_WIDTH=%IN_WIDTH%
if not "%DEFAULT_HEIGHT%"=="" (
    set /a OUT_HEIGHT=%DEFAULT_HEIGHT%
    goto info_check
)
set /a OUT_HEIGHT_TEMP=%DEFAULT_WIDTH% * %IN_HEIGHT% / %IN_WIDTH%
set /a OUT_HEIGHT_ODD=%OUT_HEIGHT_TEMP% %% 2
set /a OUT_HEIGHT=%OUT_HEIGHT_TEMP% - %OUT_HEIGHT_ODD%

:info_check
if "%TOTAL_TIME%"=="" (
    echo ^>^>%ANALYZE_ERROR%
    call quit.bat
    echo;
)
if "%KEYINT%"=="" (
    echo;
    echo ^>^>%DECODE_ERROR3%
    echo ^>^>%DECODE_ERROR4%
    echo ^>^>%DECODE_ERROR5%
    echo ^>^>%DECODE_ERROR6%
    call quit.bat
)
goto movie_mode_question


rem ################�ݒ�̎���################
:movie_mode_question
echo;
echo ^>^>%ANALYZE_END%
echo;
echo;
call setting_question.bat


rem ################�G���R��ƊJ�n################
echo;
echo %HORIZON%
echo;
echo;
echo ^>^>%VIDEO_ENC_ANNOUNCE%
echo;

rem ################�f���G���R�[�h################
rem AVS�t�@�C���쐬
if /i "%RGB%"=="true" (
    if /i "%FULL_RANGE%"=="on" (
        if /i "%COLORMATRIX%"=="BT.709" (
            set AVS_SCALE=matrix^=^"PC.709^"^,
        ) else (
            set AVS_SCALE=matrix^=^"PC.601^"^,
        )
    ) else (
        if /i "%COLORMATRIX%"=="BT.709" (
            set AVS_SCALE=matrix^=^"Rec709^"^,
        ) else (
            set AVS_SCALE=matrix^=^"Rec601^"^,
        )
    )
) else (
    set AVS_SCALE= 
)


if /i "%DECODER%"=="avi" goto avisource_video
if /i "%DECODER%"=="ffmpeg" goto ffmpegsource_video
if /i "%DECODER%"=="directshow" goto directshowsource_video

:directshowsource_video
(
    echo LoadPlugin^("DirectShowSource.dll"^)
    echo;
    if "%VFR%"=="true" (
        echo DirectShowSource^(%INPUT_FILE_PATH%, audio = false, fps=%INPUT_FPS%, convertfps=true^)
    ) else (
        echo DirectShowSource^(%INPUT_FILE_PATH%, audio = false, fps=%INPUT_FPS%, convertfps=false^)
    )
)> %VIDEO_AVS%
goto vbr_avs

:avisource_video
echo AVISource^(%INPUT_FILE_PATH%, audio = false^)> %VIDEO_AVS%
goto vbr_avs

:ffmpegsource_video
(
    echo LoadPlugin^("ffms2.dll"^)
    echo;
    echo fps_num = Int^(%FPS% * 1000^)
    if "%VFR%"=="true" (
        echo FFVideoSource^("input%INPUT_FILE_TYPE%",cache=false^)
    ) else (
        echo FFVideoSource^("input%INPUT_FILE_TYPE%",cache=false , fpsnum=fps_num, fpsden=1000^)
    )
)> %VIDEO_AVS%

:vbr_avs
echo;>> %VIDEO_AVS%
if "%ABITRATE_MODE%"=="VBR" (
    echo EnsureVBRMP3Sync^(^)>> %VIDEO_AVS%
)
echo;>> %VIDEO_AVS%
if "%SCAN_TYPE%"=="Interlaced" goto interlace
if "%SCAN_TYPE%"=="MBAFF" goto interlace

rem �v���O���b�V�u
if /i "%YV12%"=="true" goto fps_avs

if "%OUT_WIDTH_ODD%"=="1" echo Crop^(0,0,-1,0^)>> %VIDEO_AVS%
if "%OUT_HEIGHT_ODD%"=="1" echo Crop^(0,0,0,-1^)>> %VIDEO_AVS%

echo ConvertToYV12^(%AVS_SCALE%interlaced=false^)>> %VIDEO_AVS%
echo;>> %VIDEO_AVS%
goto fps_avs

rem �C���^�[���[�X
:interlace
echo Load_Stdcall_Plugin^("yadif.dll"^)>> %VIDEO_AVS%
if /i "%YV12%"=="true" goto yadif
echo ConvertToYV12^(%AVS_SCALE%interlaced=true^)>> %VIDEO_AVS%
echo;>> %VIDEO_AVS%
:yadif
if "%SCAN_TYPE%"=="MBAFF" (
    echo Yadif^(order=1^)>> %VIDEO_AVS%
    goto fps_avs
)
if "%SCAN_ORDER%"=="Top" (
    echo Yadif^(order=1^)>> %VIDEO_AVS%
    goto fps_avs
)
if "%SCAN_ORDER%"=="Bottom" (
    echo Yadif^(order=0^)>> %VIDEO_AVS%
    goto fps_avs
)
echo Yadif^(order=-1^)>> %VIDEO_AVS%

:fps_avs
(
    echo;
    if "%CHANGE_FPS%"=="true" echo ChangeFPS^(%FPS%^)
    echo;

    if not "%IN_WIDTH%"=="%WIDTH%" echo BlackmanResize^(%WIDTH%,last.height^(^)^)
    if not "%IN_HEIGHT%"=="%HEIGHT%" echo BlackmanResize^(last.width^(^),%HEIGHT%^)
    echo;
    echo return last
)>> %VIDEO_AVS%

echo ^>^>%AVS_END%
echo;

call x264_enc.bat

rem ################�����G���R�[�h################
echo ^>^>%VIDEO_ENC_END%
echo;

if "%A_BITRATE%"=="0" (
    echo ^>^>%SILENCE_ANNOUNCE%
    echo;
    .\silence.exe %FINAL_WAV% -l 0.1 -c 2 -s 44100 -b 16
    .\neroAacEnc.exe -lc -br 0 -if %FINAL_WAV% -of %TEMP_M4A%
    goto :eof
)

echo ^>^>%AUDIO_ENC_ANNOUNCE%
echo;

if /i "%DECODER%"=="avi" goto avisource_audio
if /i "%DECODER%"=="ffmpeg" goto ffmpegsource_audio
if /i "%DECODER%"=="directshow" goto directshowsource_audio

:directshowsource_audio
(
    echo LoadPlugin^("DirectShowSource.dll"^)
    echo;
    echo DirectShowSource^(%INPUT_FILE_PATH%, video = false^)
    echo;
    echo return last
)> %AUDIO_AVS%
goto temp_wav

:avisource_audio
(
    echo AVISource^(%INPUT_FILE_PATH%, audio = true^)
    echo;
    echo return last
)> %AUDIO_AVS%
goto temp_wav

:ffmpegsource_audio
ffmsindex.exe -f %TEMP_DIR%\input%INPUT_FILE_TYPE% %TEMP_DIR%\input%INPUT_FILE_TYPE%.ffindex
echo;
(
    echo LoadPlugin^("ffms2.dll"^)
rem echo LoadPlugin^("DirectShowSource.dll"^)
    echo;
    echo FFAudioSource^("input%INPUT_FILE_TYPE%", cachefile="input%INPUT_FILE_TYPE%.ffindex"^)
rem echo DirectShowSource^("input%INPUT_FILE_TYPE%", video = false^)
    echo;
    echo return last
)> %AUDIO_AVS%

:temp_wav
echo ^>^>%WAV_ANNOUNCE%
set PROMPT=$S$H
start process.bat 2>nul
.\wavi.exe %AUDIO_AVS% %TEMP_WAV% 1>nul 2>&1
echo;
del %PROCESS_S_FILE% 2>nul
:wav_start
ping localhost -n 1 >nul
if not exist %PROCESS_E_FILE% goto wav_start 1>nul 2>&1
del %PROCESS_E_FILE%
prompt

call m4a_enc.bat
