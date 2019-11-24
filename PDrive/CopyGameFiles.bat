@echo off

REM "==================================================="
REM "Load User Settings configuration"
REM "==================================================="
CALL P:/UserSettings_EDIT_ME.bat


echo "---------------------------------------------------"
echo BEGIN copying Client and Server Game Directories to:
echo %PathGame%
echo "---------------------------------------------------"


REM "==================================================="
REM "Copy From DayZ Client"
REM "Addons, dta, executables, dlls"
REM "==================================================="
xcopy "%PathDayZClient%\Addons" "%PathGame%\Addons" /D /Y /I /F
xcopy "%PathDayZClient%\dta" "%PathGame%\dta" /D /Y /I /F
xcopy "%PathDayZClient%\*.dll" "%PathGame%\" /D /Y /F
xcopy "%PathDayZClient%\steam_appid.txt" "%PathGame%\" /D /Y /F


REM "==================================================="
REM "Copy From DayZ Server"
REM "Dlls, Server Config, MPMission, Keys"
REM "==================================================="
xcopy "%PathDayZServer%\*.dll" "%PathGame%\" /D /Y /F
xcopy "%PathDayZServer%\dayzsetting.xml" "%PathGame%\" /D /Y /F
xcopy "%PathDayZServer%\serverDZ.cfg" "%PathGame%\" /D /Y  /F
xcopy "%PathDayZServer%\dayz.gproj" "%PathGame%\" /D /Y  /F
xcopy "%PathDayZServer%\mpmissions" "%PathGame%\mpmissions" /D /Y /I /F /E
xcopy "%PathDayZServer%\BattlEye" "%PathGame%\BattlEye" /D /Y /I /F /E
xcopy "%PathDayZServer%\Keys" "%PathGame%\Keys" /D /Y /I /F

REM "==================================================="
REM "Copy From DayZDiag_x64.exe from DayZ Client"
REM "2 copies for Client and Server executables"
REM "==================================================="
xcopy "%PathDayZClient%\DayZDiag_x64.exe" "%PathGame%\%ExecutableDayZClient%*" /D /Y /F
xcopy "%PathDayZClient%\DayZDiag_x64.exe" "%PathGame%\%ExecutableDayZServer%*" /D /Y /F


echo "---------------------------------------------------"
echo FINISHED copying to:
echo %PathGame%
echo "---------------------------------------------------"

TIMEOUT /T 100