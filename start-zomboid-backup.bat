@echo off
rem -----------------------------------------------------------------------------
rem Change this variable to __your__ backup directory
rem -----------------------------------------------------------------------------
SET backup_dir=E:\ZomboidBackup
 
rem -----------------------------------------------------------------------------
rem -----------------------------------------------------------------------------
if exist "%USERPROFILE%\Zomboid" rmdir /s /q "%USERPROFILE%\Zomboid"
mklink /j "%USERPROFILE%\Zomboid" "%backup_dir%\userprofile" 
 
start /d "%backup_dir%\game\" ProjectZomboid64.bat
