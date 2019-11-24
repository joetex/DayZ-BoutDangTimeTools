@echo off
setlocal enabledelayedexpansion

REM "==================================================="
REM "Load User Settings configuration"
REM "==================================================="
CALL P:/UserSettings_EDIT_ME.bat


REM "==================================================="
REM "Kill workbench, if exists"
REM "==================================================="
tasklist | find /i "%ExecutableWorkbench%">nul && Taskkill /F /IM  "%ExecutableWorkbench%"


REM "==================================================="
REM "Generate mods.sproj from game folder's *.c files"
REM "==================================================="
echo Generating mods.sproj file from %PathGame% directory *.c files
cd /D %PathGame%
SET modsProjPath=%PathGame%/%ProjectModsFile%
echo ^<^?xml version^="1.0" encoding^="UTF-8" ^?^>>!modsProjPath!
echo ^<project^>>>%modsProjPath%
for %%i in (!PathGame!^/%MODS:;=,!PathGame!^/%) do (
	cd /D %%i

	for /r %%i in (*.c) do (
		SET curPath=%%i


		SET curPath=!curPath:^\=^/!
		SET curPath=!curPath:%PathGame%/=!
    	echo 	^<file path^=^"!curPath!^" ^/^>>>%modsProjPath%
	)
)
echo ^</project^>>>%modsProjPath%

REM "==================================================="
REM "Generate dayz.ssln to add mods.sproj to the Workbench Solution File"
REM "Uses dayz.ssln.template to replace $MODSPROJECT"
REM "==================================================="
echo Adding mods.sproj to workbench solution
SET destination=%ProjectSolutionFilePath%/%ProjectSolutionFile%
break>%destination%
for /F "delims=" %%a in (%PathWorkDrive%/%ProjectSolutionFile%.template) do (
	set line=%%a
    if !line!==!line:$MODSPROJECT=! (
    	echo !line!>>!destination!
    ) else (
		echo     ^<project path="!modsProjPath:~3!" ^/^>>>!destination!
    )
)

REM "==================================================="
REM "Generate dayz.gproj for Workbench with Mods Added"
REM "Uses dayz.gproj.template to replace: "
REM "$GAMEDIR, $SCRIPTS_1CORE, $SCRIPTS_2GAMELIB, $SCRIPTS_3GAME, $SCRIPTS_4WORLD, $SCRIPTS_5MISSION"
REM "Loops through each WorkBenchMODS and finds matching directories to add to dayz.gproj in ScriptModulePathClass sections"
REM "==================================================="
echo Generating dayz.gproj for workbench to:

SET destination=%PathGame%/%ProjectGameFile%

break>%destination%
echo !destination!

set mymods="!WorkBenchMODS:;=/" "!/"

for /F "delims=" %%a in (%PathWorkDrive%/%ProjectGameFile%.template) do (
	set line=%%a
    if not x"!line:$GAME_DIR=!"==x"!line!" (

		echo 		FileSystemPathClass ^{>>!destination!
		echo 			Name "Custom Game Folder">>!destination!
		echo 			Directory "%PathGame%/">>!destination!
	 	echo 		^}>>!destination!

    ) else if not x"!line:$SCRIPTS_1_CORE=!"==x"!line!" (
    	echo "Processing 1_CORE..."
    	for  %%i in (%mymods%) do (
			set mymod=%%i
			cd /D !mymod!
			FOR /D /r  %%G in (1_core) do (
				@if exist "%%G/"  (
					set mymod=%%G
					set mymod=!mymod:\=/!
					set mymod=!mymod:%PathGame%/=!
					@echo 				"!mymod!">>!destination!
				)
			)
		)
    ) else if not x"!line:$IMAGE_SET=!"==x"!line!" (
    	echo "Processing IMAGE_SET..."
    	for  %%i in (%mymods%) do (
			set mymod=%%i
			cd /D !mymod!
			FOR /r %%G in (*.imageset) do (
				@if exist "%%G"  (
					set mymod=%%G
					set mymod=!mymod:\=/!
					set mymod=!mymod:%PathGame%/=!
					@echo 				"!mymod!">>!destination!
				)
			)
		)
    ) else if not x"!line:$WIDGET_STYLE=!"==x"!line!" (
    	echo "Processing WIDGET_STYLE..."
    	for  %%i in (%mymods%) do (
			set mymod=%%i
			cd /D !mymod!
			FOR /r %%G in (*.styles) do (
				@if exist "%%G"  (
					set mymod=%%G
					set mymod=!mymod:\=/!
					set mymod=!mymod:%PathGame%/=!
					@echo 				"!mymod!">>!destination!
				)
			)
		)
    ) else if not x"!line:$SCRIPTS_2_GAMELIB=!"==x"!line!" (
    	echo "Processing 2_GAMELIB..."
    	for  %%i in (%mymods%) do (
			set mymod=%%i
			set mymod=!mymod:\=/!
			cd /D !mymod!
			FOR /D /r  %%G in (2_gamelib) do (
				@if exist "%%G/"  (
					set mymod=%%G
					set mymod=!mymod:\=/!
					set mymod=!mymod:%PathGame%/=!
					@echo 				"!mymod!">>!destination!
				)
			)
		)
    ) else if not x"!line:$SCRIPTS_3_GAME=!"==x"!line!" (
    	echo "Processing 3_GAME..."
    	for  %%i in (%mymods%) do (
			set mymod=%%i
			set mymod=!mymod:\=/!
			cd /D !mymod!
			FOR /D /r  %%G in (3_game) do (
				@if exist "%%G/"  (
					set mymod=%%G
					set mymod=!mymod:\=/!
					set mymod=!mymod:%PathGame%/=!
					@echo 				"!mymod!">>!destination!
				)
			)
		)
    ) else if not x"!line:$SCRIPTS_4_WORLD=!"==x"!line!" (
    	echo "Processing 4_WORLD..."
    	for  %%i in (%mymods%) do (
			set mymod=%%i
			set mymod=!mymod:\=/!
			cd /D !mymod!
			FOR /D /r  %%G in (4_world) do (
				@if exist "%%G/"  (
					set mymod=%%G
					set mymod=!mymod:\=/!
					set mymod=!mymod:%PathGame%/=!
					@echo 				"!mymod!">>!destination!
				)
			)
		)
    ) else if not x"!line:$SCRIPTS_5_MISSION=!"==x"!line!" (
    	echo "Processing 5_MISSION..."
    	for  %%i in (%mymods%) do (
			set mymod=%%i
			set mymod=!mymod:^\=/!
			cd /D !mymod!
			FOR /D /r  %%G in (5_mission) do (
				@if exist "%%G/"  (
					set mymod=%%G
					set mymod=!mymod:\=/!
					set mymod=!mymod:%PathGame%/=!
					@echo 				"!mymod!">>!destination!
				)
			)
		)
    ) else (
    	echo !line!>>!destination!
    )
)

xcopy "%destination%" "%ProjectGameFilePath%/%ProjectGameFile%*" /D /Y /F
xcopy "%destination%" "%PathGame%/%ProjectGameFile%*" /D /Y /F
REM del "%destination%" /s /f /q



TIMEOUT /T 1

REM "==================================================="
REM "Start workbench with our mods"
REM "==================================================="
cd /D %PathWorkbench%
echo Launching DayZ Workbench
echo Path:
echo %PathWorkbench%\
echo Executing:
echo %ExecutableWorkbench% -dologs -mod=!WorkBenchMODS:^/=^\! -adminlog -freezecheck -scriptDebug=true
start "DayZ Workbench" %ExecutableWorkbench% -dologs -mod=!WorkBenchMODS! -adminlog -freezecheck -scriptDebug=true


endlocal

TIMEOUT /T 10