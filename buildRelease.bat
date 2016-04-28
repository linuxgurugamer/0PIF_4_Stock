@echo off
set DEFHOMEDRIVE=d:
set DEFHOMEDIR=%DEFHOMEDRIVE%%HOMEPATH%
set HOMEDIR=
set HOMEDRIVE=%CD:~0,2%

set RELEASEDIR=d:\Users\jbb\release
set ZIP="c:\Program Files\7-zip\7z.exe"
echo Default homedir: %DEFHOMEDIR%

set /p HOMEDIR= "Enter Home directory, or <CR> for default: "

if "%HOMEDIR%" == "" (
set HOMEDIR=%DEFHOMEDIR%
)
echo %HOMEDIR%

SET _test=%HOMEDIR:~1,1%
if "%_test%" == ":" (
set HOMEDRIVE=%HOMEDIR:~0,2%
)

cd Source
type 0PIF_4_Stock.version
set /p VERSION= "Enter version: "


mkdir %HOMEDIR%\install\GameData\0PIF_4_Stock
copy 0PIF_4_Stock.cfg %HOMEDIR%\install\GameData\0PIF_4_Stock
copy 0PIF_4_Stock.version %HOMEDIR%\install\GameData\0PIF_4_Stock
copy MiniAVC.dll %HOMEDIR%\install\GameData\0PIF_4_Stock

%HOMEDRIVE%
cd %HOMEDIR%\install

set FILE="%RELEASEDIR%\0PIF_4_Stock-%VERSION%.zip"
IF EXIST %FILE% del /F %FILE%
%ZIP% a -tzip %FILE% Gamedata\0PIF_4_Stock
