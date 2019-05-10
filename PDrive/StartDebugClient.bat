@echo off

REM "==================================================="
REM "Load User Settings configuration"
REM "==================================================="
CALL P:/UserSettings_EDIT_ME.bat

cd /D %PathGame%

REM "==================================================="
REM "Relaunch CLIENT (kill existing, then start new)"
REM "==================================================="
tasklist | find /i "%ExecutableDayZClient%">nul && Taskkill /F /IM  "%ExecutableDayZClient%"
echo "==================================================="
echo Starting DayZ CLIENT: %ExecutableDayZClient%
echo Args:
echo %ClientArgs%
start "DayZ CLIENT" "%ExecutableDayZClient%" %ClientArgs%
echo "==================================================="