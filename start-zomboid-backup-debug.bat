@echo off
rem -----------------------------------------------------------------------------
rem Change this variable to __your__ backup directory
rem -----------------------------------------------------------------------------
SET backup_dir=C:\ZomboidBackup
 
rem -----------------------------------------------------------------------------
rem -----------------------------------------------------------------------------
start /d "%backup_dir%\game\" ProjectZomboid64.bat "-cachedir=%backup_dir%\userprofile" -debug
