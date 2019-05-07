# DayZ-BoutDangTimeTools
Scripting Environment for DayZ using Workbench and Script be Editor

### Reasons to Use:
 1. Single directory for Client, Server, and Mods at P:/MultiplayerGame/
    1. Copy or update server and client game files in a single click. (.bat)
 2. Define -mod in one line for Client, Server, and Workbench to be setup automatically. 
 3. Auto-generate dayz.gproj, dayz.ssln, and mods.sproj when starting workbench (.bat file). 
 4. No symlinks!
 5. Script Editor features:
    1. New mods folder to easily modify your code in one spot.
    2. Add breakpoints directly from new mods directory files (red dots are bugged, but it works!). 
    3. Fixed Keyboard Shortcuts:
      4. Restart Client and Server (Ctrl+1)
      5. Kill Client and Server (Ctrl+2)
      6. Restart Client Only (Ctrl+3)
      7. Restart Server Only (Ctrl+4) 
      8. Restart Workbench (Ctrl+0)

## Setup Environment

### Install Essentials
 1. Install DayZ Game from Steam
 2. Install DayZ Server from Steam Tools
 3. Install DayZ Tools from Steam Tools
 4. Download this repository as a .zip (will be extracted to P:/)

### Setup P:/ Drive 
 1. Open DayZ Tools
 2. Click "Settings" in DayZ Tools application
    1. In explorer create a folder anywhere on your computer.
    2. In "Path to the Project Drive", uncheck "Default", and choose the folder path you selected.
    3. Choose Drive Letter P:\
    4. Choose "Startup of the Tools"
    5. Click Apply
 3. Click "Tools -> Mount Drive P"
 4. Click Extract Game Data
    1. Note: Unpacks all the game files of about 14 GB.

### Setup BoutDangTime Tools

 1. Extract PDrive folder from *.zip file of this repository to P:/
 2. Edit 'UserSettings_EDIT_ME.bat'
	 1. Right-click file and choose "Edit".
```
  REM "==================================================="
  REM "DayZ Mods to auto-load in Client, Server, and Workbench"
  REM "Use REM to comment and save different setups"
  REM "==================================================="
  REM SET "MODS=@CF;@VanillaPPMap;TestMod"
  SET "MODS=TestMod"

  REM "==================================================="
  REM "DayZ Development Environment Directories"
  REM "==================================================="
  SET "PathWorkbench=D:/Program Files (x86)/Steam/SteamApps/common/DayZ Tools/Bin/Workbench"
  SET "PathDayZServer=D:/Program Files (x86)/Steam/SteamApps/common/DayZServer"
  SET "PathDayZClient=D:/Program Files (x86)/Steam/SteamApps/common/DayZ"
```
 3. Edit the "MODS" value.  It is identical to the -mod format.  
    1. Separate each mod with semi-colon.
    2. Note: Only packed / built mods should be named with @ in front.
 4. Edit the paths for Workbench, DayZ Server, and DayZ Client folders.
    1. Workbench folder is in DayZ Tools installation directory, in Bin folder
    
### Understanding BoutDangTime Tools
  #### StartWorkbench.bat
  This tool performs several actions:
 1. Kill any open Workbench application.
 2. Generate mods.sproj with all the *.c files from our P:/MultiplayerGame
 3. Generate dayz.ssln which references mods.sproj.  Built using dayz.ssln.template file.
 4. Generate dayz.gproj which references unpacked mod files and our game directory. Built using dayz.gproj.template file.
    1. This file is copied to Workbench (PathWorkbench) folder and Game folder (P:/MultiplayerGame)
 5. Opens Workbench with -mod pointing to each mod's full path.
 
  #### CopyGameFiles.bat
  Warning: Duplicates DayZ game files (approx 14 GB)
  It's important to sandbox your DayZ game directory, so your normal play is not affected.  This will move all the required files to the P:/MultiplayerGame directory.  If there is an update to DayZ Client or Server, run this tool to copy only the modified files.
 
  #### StartDebugAll.bat, StopDebugAll.bat, StartDebugClient.bat, StartDebugServer.bat
  These files will start and stop the DayZ game and server.  Running the Start scripts again will kill the existing game or server and start them again.  These are used in the Script Editor as keyboard shortcuts.
  
#### scripts/editor/plugins/dayztools.c
Defines the keyboard shortcuts for Script Editor to quickly manage starting and stopping the DayZ game and server.  As well restarting workbench.


