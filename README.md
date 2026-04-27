# **\[How to\]** Backup your current Project Zomboid version incl. mods and archive it to play it forever*

Since there was some discussion in the [Project Zomboid subreddit](https://www.reddit.com/r/projectzomboid/) on how this could be done in the last few days after one of the most recent updates, I thought I'd write a guide on how you can do this.

There are four steps that need to be done:
1. Back up your copy of the game
2. Back up your settings, saves etc.
3. Back up your mods
4. Play the backed-up copy
5. Afterthoughts (optional)

Afterwards, you should be able to play this version (hopefully) forever.

## Prerequisites
This guide will assume the following:
- The copy of the game was purchased on Steam, and the game is installed in the same library directory where the workshop mods are. 
  - If you only have one Steam library directory or don't have any clue what I'm talking about, I'm certain you're fine.
- The Steam library directory is located at `C:\Program Files (x86)\Steam`.
- The game's settings are stored in your user profile directory (`%userprofile%`) as per default.
- The backup directory is located at `C:\ZomboidBackup`.


## TL;DR
I wrote a backup script to make the process easier. ;)
Instructions after _soapbox_

> I do **NOT** advocate downloading any script from anywhere made by anyone and running it on your computer without having a basic understanding of what it does.
> 
> Please look at the source, confirm that both scripts use just a handful of different function calls, and rudimentarily check what they do. You don't need to fully understand all of it (although the scripts are really basic) but--I repeat--do NOT (like, never!) just download a script and plainly TRUST it does what the author says.
> 
> Honestly, don't just blindly trust me either.
> 
> Most importantly, though, please make sure you have a backup of everything involved.
> 
> Thank you for your patience! 💜 **/soapbox**



Follow these instructions
- Download the scripts and copy them to the root of your backup directory.
- If all of the above listed prerequisites are true, skip this step, otherwise, modify the directory paths in the scripts to match yours.
- Run "backup-current-zomboid-version.ps1" in PowerShell (this _may_ take a **long** time):
  - Press `WIN + R`, type `PowerShell` and hit enter
  - type/paste: `cd c:\ZomboidBackup`
  - type/paste: `.\backup-current-zomboid-version.ps1`
    - You'll apparently only get a progress indicator in PowerShell 7. :/
    - If you get an error that says you're not allowed to run scripts, look up ["PowerShell Set-ExecutionPolicy"](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.security/set-executionpolicy?view=powershell-7.5).
- Run "start-zomboid-backup.bat"
  - Run "start-zomboid-backup-debug.bat" to run the game in debug mode. 


## The manual process (or the explanation, depending on perspective)
  
### 1. Back up your copy of the game
Go to your backup directory and create a directory called "game". Copy everything from `C:\Program Files (x86)\Steam\steamapps\common\ProjectZomboid` into this directory.

### 2. Back up your settings
Go to your backup directory and create a directory called "userprofile". Copy everything from `"%userprofile%\Zomboid"` (just paste exactly that into your Windows Explorer path) into this directory.

### 3. Back up your mods
Go to `C:\Program Files (x86)\Steam\steamapps\workshop\content\108600`. The directories in here are all mods currently installed via Steam Workshop. You have to open every directory and copy the contents of its "mods" directory to `C:\ZomboidBackup\userprofile\mods\`.

Let's take the _"Vanilla Vehicles Animated"_ mod as an example:

The Workshop-ID is **3281755175,** and inside its "mods" directory you'll see five other directories called "VanillaVehiclesAnimated", "VanillaVehiclesAnimated_SVUpatch", etc. These are the directories you need to copy directly into `C:\ZomboidBackup\userprofile\mods\`. If you've done all this, congrats, it's time to play the archived copy.

### 4. Play the backed-up copy
Go into your backup directory and launch `start-zomboid-backup.bat` to play the backed-up copy.

Alternatively, if you don't want to use the provided batch file. Go to `C:\ZomboidBackup\game` and create a shortcut to `ProjectZomboid64.bat`. Right-click it, choose `Properties` and add `-cachedir="C:\ZomboidBackup\userprofile"` at the end of the target section.


### 5. Afterthoughts
Pretty straightforward except for the change in directory structure when copying the mods to your local directory. It makes sense after you think about it because workshop items can bundle more than one mod in a single package. The directory junction I used in the previous versions of this guide wasn't needed after all because the game actually provides a startup parameter to set the cache directory.

You can adapt these scripts pretty easily to bundle any version of Project Zomboid you'd like. It also should be easy to run any of the current versions (it's 2026-04 as I'm updating this, jic) side by side with adapted startup scripts for each one. The fact that you won't get mod updates except for the current version running through Steam goes both ways here.

Thank **you** for reading. Thanks, **TIS,** for making a game me and other players care about as much to even warrant a guide like this.
Cheers! 💜

\* You know exactly what I mean. 😜
