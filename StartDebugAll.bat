@echo off

REM "==================================================="
REM "Load User Settings configuration"
REM "==================================================="
CALL UserSettings_EDIT_ME.bat


REM "==================================================="
REM "Launch SERVER in Debug Mode"
REM "==================================================="
cd /D %PathWorkDrive%/
CALL StartDebugServer.bat

REM "==================================================="
REM "Launch CLIENT in Debug Mode"
REM "==================================================="
cd /D %PathWorkDrive%/
CALL StartDebugClient.bat

cd /D %PathWorkDrive%/