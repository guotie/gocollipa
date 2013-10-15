@echo off

setlocal

if exist restart.bat goto ok
echo restart.bat must be run from its folder
goto end

:ok

:: stop
taskkill /im gocollipa.exe /f
del /q /f /a pid

:: start
start /b bin\gocollipa >> log\panic.log 2>&1 &

echo restart successfully

:end