
# DayZ-BoutDangTimeTools
Scripting Environment for DayZ using Workbench and Script Editor

## Table of Contents
 - [Reasons to Use](#reasons)
 - [Install Essentials](#install)
 - [Setup P:/ Drive](#pdrive)
 - [Setup BoutDangTime Tools](#setupbdt)
 - [Understanding BoutDangTime Tools](#bdttools)
   - [UserSettings_EDIT_ME.bat](#usersettings)
   - [StartWorkbench.bat](#startworkbench)
   - [CopyGameFiles.bat](#copygamefiles)
   - [Start/Stop for Game and Server (.bat files)](#startstop)
 - [How to Use](#howtouse)
 - [Gotchas](#gotchas)
 
___

<a name="reasons">
 
### Reasons to Use:
 1. Single directory for Client, Server, and Mods at P:/MultiplayerGame/
   1. Copy or update server and client game files in a single click. (.bat)
 2. Define -mod in one line for Client, Server, and Workbench to be setup automatically. 
 3. Auto-generate dayz.gproj, dayz.ssln, and mods.sproj when starting workbench (.bat file). 
 4. No symlinks!
 5. Made for unpacked mod scripting.
 6. Script Editor features:
    1. New mods folder to easily modify your code in one spot.
    2. Add breakpoints directly from new mods directory files (red dots are bugged, but it works!). 
 7. Fixed Keyboard Shortcuts for Workbench and Script Editor windows:
      4. Restart Client and Server (Ctrl+1)
      5. Kill Client and Server (Ctrl+2)
      6. Restart Client Only (Ctrl+3)
      7. Restart Server Only (Ctrl+4) 
      8. Copy Game Files (Ctrl+9)
      9. Restart Workbench (Ctrl+0)
      

<a name="setup"/>

___

<a name="install"/>

### Install Essentials
 1. Install DayZ Game from Steam
 2. Install DayZ Server from Steam Tools
 3. Install DayZ Tools from Steam Tools
 4. Download this repository as a .zip (will be extracted to P:/)

___

<a name="pdrive"/>

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

___

<a name="setupbdt"/>

### Setup BoutDangTime Tools

 1. Extract PDrive folder from &ast;.zip file of this repository to P:/
   1. The .bat files must be in P:/ for Script Editor to call.
 2. Edit 'UserSettings_EDIT_ME.bat'
   1. Right-click file and choose "Edit".  View below for example
 3. Edit the "MODS" value.  It is identical to the -mod format.  
   1. Separate each mod with semi-colon.
   2. Note: Only packed / built mods should be named with @ in front.
 4. Edit the paths for Workbench, DayZ Server, and DayZ Client folders.
   1. Workbench folder is in DayZ Tools installation directory, in Bin folder

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

___

<a name="bdttools"/>

### Understanding BoutDangTime Tools

Simply double click any of these files to run them.  A shortcut for StartWorkbench.bat is also available to use.  These tools are also runnable from the Workbench or Script Editor. 

<a name="usersettings"/>

#### UserSettings_EDIT_ME.bat
> Define the mods to load and the DayZ Game, Server, and Tools (Workbench) directories.
> To comment, use REM at the start of the line.

<a name="startworkbench"/>

#### StartWorkbench.bat
> This tool performs several actions:
>  1. Kill any open Workbench application.
>  2. Generate mods.sproj with all the &ast;.c files from our P:/MultiplayerGame
>  3. Generate dayz.ssln which references mods.sproj.  Built using dayz.ssln.template file.
>  4. Generate dayz.gproj which references unpacked mod files and our game directory. Built using dayz.gproj.template file.
>    1. This file is copied to Workbench (PathWorkbench) folder and Game folder (P:/MultiplayerGame)
>  5. Opens Workbench with -mod pointing to each mod's full path.
 
 <a name="copygamefiles"/>
 
#### CopyGameFiles.bat
> Warning: Duplicates DayZ game files for sandbox environment (approx 14 GB)
> Note: Only copies missing or modified files, so subsequent runs will be much faster.
> It's important to sandbox your DayZ game directory, so your normal play is not affected.  This will move all the required files to the P:/MultiplayerGame directory.  If there is an update to DayZ Client or Server, run this tool to copy only the modified files.
  
 <a name="startstop"/>
 
#### StartDebugAll.bat, StopDebugAll.bat, StartDebugClient.bat, StartDebugServer.bat
> These files will start and stop the DayZ game and server.  Running the Start scripts again will kill the existing game or server and start them again.  These are used in the Script Editor as keyboard shortcuts.
  
  <a name="dayztools"/>
  
#### scripts/editor/plugins/dayztools.c
> Defines the keyboard shortcuts for Script Editor to quickly manage starting and stopping the DayZ game and server.  As well restarting workbench.

___

<a name="howtouse">
 
## How to Use
 1. Copy all your mod folders, packed and unpacked, to P:/MultiplayerGame/
 2. Edit UserSettings_EDIT_ME.bat in text editor.
   1. Modify MODS variable to add your mod name, for example: `SET "MODS=TestMod"`
   2. Note: Do not use @ for your unpacked mod folder name.  Only use @ in name for packed mods.
 3. Open Workbench using StartWorkbench.bat that should be at P:/StartWorkbench.bat
   1. This will automatically load &ast;.c, &ast;.layout, &ast;.styles files, and filesystem properly for game, server and workbench.
 4. Open Script Editor from top menu Editors -> Script Editor.
 5. In Projects panel, scroll down to "mods" top level folder.
   1. All *.c files in your P:/MultiplayerGame/ directory will be listed here.
 6. Open file of your choice.
 7. Add a breakpoint to a line in your code.
   1. Red dot will not appear (editor bug), please view Breakpoints panel to ensure breakpoint exists.
 8. Start the DayZ server and client by pressing Ctrl+1 from Workbench or Script Editor windows.
   1. Script Editor will automatically connect to the Server or Client once they are started.  You can change which in "Debug" in top menu.
 9. Make code changes and Recompile File on Host (Ctrl+F7).
 10 Or, restart client or server using Run shortcuts under "Plugins" in top menu.
 
 --- 
 
<a name="gotchas">
 
## Gotchas
 1. If Workbench is already open, adding new files/folders will require restarting workbench (Ctrl+0).
 2. Adding breakpoints in opened files under "mods" folder will not show the red dot next to line number.  However, Breakpoints panel will show that the breakpoint exists.  Opening the file through the traditional modules, i.e. Core, Gamelib, Game, World, and Mission will show the red dot properly.
 
 
