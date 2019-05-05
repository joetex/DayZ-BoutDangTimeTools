@echo off

REM "==================================================="
REM "Load User Settings configuration"
REM "==================================================="
CALL UserSettings_EDIT_ME.bat


REM "==================================================="
REM "Kill both CLIENT and SERVER processes if active"
REM "==================================================="
tasklist | find /i "%ExecutableDayZServer%">nul && Taskkill /F /IM  "%ExecutableDayZServer%"
tasklist | find /i "%ExecutableDayZClient%">nul && Taskkill /F /IM  "%ExecutableDayZClient%"

echo "==================================================="
echo Client and Server stopped.
echo "==================================================="

cd /D %PathWorkDrive%/