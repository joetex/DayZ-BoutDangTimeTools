@echo off

REM "==================================================="
REM "DayZ Mods to auto-load in Client, Server, and Workbench"
REM "==================================================="
SET "MODS=TestMod"


REM "==================================================="
REM "DayZ Development Environment Directories"
REM "==================================================="
SET "PathSteamApps=D:/Program Files (x86)/Steam/SteamApps"
SET "PathWorkbench=D:/Program Files (x86)/Steam/SteamApps/common/DayZ Tools/Bin/Workbench"
SET "PathDayZServer=D:/Program Files (x86)/Steam/SteamApps/common/DayZServer"
SET "PathDayZClient=D:/Program Files (x86)/Steam/SteamApps/common/DayZ"
SET "PathWorkDrive=P:"
SET "PathGame=P:/MultiplayerGame"


REM "==================================================="
REM "DayZ Executable files for development"
REM "==================================================="
SET "ExecutableWorkbench=workbenchApp.exe"
SET "ExecutableDayZServer=DayZDiag_x64-Server.exe"
SET "ExecutableDayZClient=DayZDiag_x64-Client.exe"


REM "==================================================="
REM "DayZ Default Launch Parameters for Client/Server"
REM "==================================================="
SET ServerArgs= -server -DoLogs -noPause -port=2302 -config=serverDZ.cfg -filePatching -profiles=!Server_Instance -mod=%MODS%
SET ClientArgs= -connect=127.0.0.1:2302 -profiles=!Client_Instance -window -name=%Author% -noPause -filePatching -dologs -password=ok -mod=%MODS%


REM "==================================================="
REM "Generate filepaths for each mod in -mod parameter.  Workbench requires absolute folder path"
REM "==================================================="
SET WorkBenchMODS=!PathGame!^/%MODS:;=;!PathGame!^/%
SET ProjectModsFilePath=mods.sproj
SET ProjectSolutionFilePath=%PathWorkDrive%/scripts/editor/projects/
SET ProjectGameFilePath=%PathWorkbench%
SET ProjectModsFile=mods.sproj
SET ProjectSolutionFile=dayz.ssln
SET ProjectGameFile=dayz.gproj

REM echo %WorkBenchMODS%
REM echo %ProjectModsFile%
REM echo %ServerArgs%
REM echo %ClientArgs%

endlocal