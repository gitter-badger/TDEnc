@echo off
cd /d "%~d0" 1>nul 2>&1
cd "%~p0..\tool\" 1>nul 2>&1

set TEMP_FILE=temp.txt
set HTML_FILE=player.html
set MOVIE_FILE=%~dp1%~nx1
set SIZE_JS=size.js

echo;
echo ^>^>HTML %PROCESS_ANNOUNCE%
echo;

.\MediaInfo.exe --Inform=Video;%%Width%% --LogFile=%TEMP_FILE% "%MOVIE_FILE%">nul
for /f %%i in (%TEMP_FILE%) do set IN_WIDTH=%%i
.\MediaInfo.exe --Inform=Video;%%Height%% --LogFile=%TEMP_FILE% "%MOVIE_FILE%">nul
for /f %%i in (%TEMP_FILE%) do set IN_HEIGHT=%%i
.\MediaInfo.exe --Inform=Video;%%DisplayAspectRatio/String%% --LogFile=%TEMP_FILE% "%MOVIE_FILE%">nul
for /f %%i in (%TEMP_FILE%) do set ASPECT=%%i
.\MediaInfo.exe --Inform=Video;%%Duration/String3%% --LogFile=%TEMP_FILE% "%MOVIE_FILE%">nul
for /f %%i in (%TEMP_FILE%) do set DURATION=%%i
.\MediaInfo.exe --Inform=Video;%%FrameRate/String%% --LogFile=%TEMP_FILE% "%MOVIE_FILE%">nul
for /f %%i in (%TEMP_FILE%) do set FPS=%%i
.\MediaInfo.exe --Inform=General;%%OverallBitRate%% --LogFile=%TEMP_FILE% "%MOVIE_FILE%">nul
for /f %%i in (%TEMP_FILE%) do set /a T_BITRATE=(%%i+500)/1000
.\MediaInfo.exe --Inform=Video;%%BitRate%% --LogFile=%TEMP_FILE% "%MOVIE_FILE%">nul
for /f %%i in (%TEMP_FILE%) do set /a V_BITRATE=(%%i+500)/1000
.\MediaInfo.exe --Inform=Audio;%%BitRate%% --LogFile=%TEMP_FILE% "%MOVIE_FILE%">nul
for /f %%i in (%TEMP_FILE%) do set /a A_BITRATE=(%%i+500)/1000
.\MediaInfo.exe --Inform=General;%%FileSize%% --LogFile=%TEMP_FILE% "%MOVIE_FILE%">nul
for /f %%i in (%TEMP_FILE%) do set SIZE=%%i

set /a PLAYER_HEIGHT=384+24
set /a PLAYER_WIDTH=640

(
  echo var n = %SIZE%/1024.0/1024.0;
  echo n = n * 100;
  echo n = Math.floor^(n^);
  echo n = n / 100;
  echo document.write^(n^);
 )> %SIZE_JS%


(
  echo ^<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"^>
  echo ^<html lang="ja"^>
  echo ^<head^>
  echo ^<meta http-equiv="Content-type" content="text/html; charset=Shift_JIS"^>
  echo ^<meta http-equiv="Pragma" content="no-cache"^>
  echo ^<meta http-equiv="Cache-Control" content="no-cache"^>
  echo ^<meta http-equiv="Expires" content="0"^>
  echo ^<title^>%~xn1^</title^>
  echo ^<meta http-equiv="Content-Style-Type" content="text/css"^>
  echo ^</head^>
  echo;
  echo ^<body bgcolor="#ffeaea" text="#000000" link="#0000ff" vlink="#800080" alink="#ff0000"^>
  echo ^<center^>
  echo ^<h3^>%~nx1^</h3^>
  echo ^<p^>����̃`�F�b�N�͑��̃v���C���[����Ȃ����̃v���C���[�Ń`�F�b�N���Ă�ˁI^<br^>
  echo ���̃v���C���[�͎኱�J�N�J�N���邯�ǃj�R�j�R�Ɓu�قځv������������I^<br^>
  echo �i��Ԃ����m�F���@�͂���ς�j�R�j�R�ւ̉��A�b�v���[�h�Ȃ񂾂��ǂˁj^<br^>
  echo �� �㉺���E�ɍ����̈悪����ꍇ�����邯�ǃv���C���[�̎d�l������C�ɂ��Ȃ��ł�^</p^>
  echo ^<script type='text/javascript' src='swfobject.js'^>^</script^>
  echo ^<div id='mediaspace'^>�v���C���[���\������Ȃ��ꍇ�͏��o�[���N���b�N���ăv���O�����������Ă�^</div^>
  echo;
  echo ^<script type='text/javascript'^>
  echo   var so = new SWFObject^('player-viral.swf','mpl','%PLAYER_WIDTH%','%PLAYER_HEIGHT%','9'^);
  echo   so.addParam^('allowfullscreen','true'^);
  echo   so.addParam^('allowscriptaccess','always'^);
  echo   so.addParam^('wmode','opaque'^);
  echo   so.addVariable^('file',"file:///%MOVIE_FILE:\=/%"^);
  echo   so.addVariable^('volume','50'^);
  echo   so.addVariable^('stretching','uniform'^);
  echo   so.write^('mediaspace'^);
  echo ^</script^>
  echo;
  echo ^<h6^>Powered by ^<a href="http://www.longtailvideo.com/players/jw-flv-player/" target="_blank"^>JW Player^</a^>^</h6^>
  echo;
  echo ^<hr^>
  echo;
  echo ^<div class="table"^>
  echo ^<table border=2 summary="������"^>
  echo   ^<caption^>^<h3^>������^</h3^>^</caption^>
  echo   ^<tr align=center^>
  echo  ^<td^>�t�@�C����
  echo  ^<td^>%~nx1
  echo   ^</tr^>
  echo   ^<tr align=center^>
  echo   ^<td^>�t�H���_
  echo   ^<td^>%~dp1
  echo   ^</tr^>
  echo   ^<tr align=center^>
  echo  ^<td^>�𑜓x
  echo   ^<td^>%IN_WIDTH%x%IN_HEIGHT%
  echo   ^</tr^>
  echo   ^<tr align=center^>
  echo  ^<td^>�A�X�y�N�g��
  echo  ^<td^>%ASPECT%
  echo   ^</tr^>
  echo   ^<tr align=center^>
  echo  ^<td^>�Đ�����
  echo  ^<td^>%DURATION%
  echo   ^</tr^>
  echo   ^<tr align=center^>
  echo  ^<td^>�t���[�����[�g
  echo  ^<td^>%FPS%fps
  echo   ^</tr^>
  echo   ^<tr align=center^>
  echo  ^<td^>�r�b�g���[�g
  echo  ^<td^>%T_BITRATE%kbps ^(�f��%V_BITRATE%kbps�A����%A_BITRATE%kbps^)
  echo   ^</tr^>
  echo   ^<tr align=center^>
  echo  ^<td^>�t�@�C���e��
  echo  ^<td^>^<script type="text/javascript" src="%SIZE_JS%"^>^</script^>MB
  echo   ^</tr^>
  echo ^</table^>
  echo ^</div^>
  echo;
  echo ^<hr^>
  echo;
  echo ^<p^>^<a href="http://www.smilevideo.jp/upload" target="_blank"^>SMILEVIDEO^</a^>^</p^>
  echo;
  echo ^</center^>
  echo;
  echo ^</body^>
  echo ^</html^>
)> %HTML_FILE%
echo;

start rundll32 url.dll,FileProtocolHandler "%HTML_FILE%"
