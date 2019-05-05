@echo off

REM "==================================================="
REM "Load User Settings configuration"
REM "==================================================="
CALL UserSettings_EDIT_ME.bat

cd /D %PathGame%

REM "==================================================="
REM "Relaunch SERVER (kill existing, then start new)"
REM "==================================================="
tasklist | find /i "%ExecutableDayZServer%">nul && Taskkill /F /IM  "%ExecutableDayZServer%"
echo "==================================================="
echo Starting DayZ SERVER: %ExecutableDayZServer%
echo Args:
echo %ServerArgs%
start "DayZ SERVER" "%ExecutableDayZServer%" %ServerArgs%
echo "==================================================="