# -----------------------------------------------------------------------------
# Change these two variables to __your__ Steam installation path
# and the desired backup directory
# -----------------------------------------------------------------------------
$steamDir  = "C:\Program Files (x86)\Steam\steamapps\"
$backupDir = "C:\ZomboidBackup\"

# -----------------------------------------------------------------------------
# -----------------------------------------------------------------------------
$backupUserProfileDir	= $backupDir + "userprofile\"
$backupGameDir			= $backupDir + "game\"
$gameDir				= $steamDir + "common\ProjectZomboid\"
$workshopModsDir		= $steamDir + "workshop\content\108600\"
$userProfileDir			= [System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::UserProfile) + "\Zomboid\*"


Write-Host "backing up game files"
if (!(Test-Path -Path $backupGameDir)) {
	[void](New-Item -Path $backupGameDir -ItemType Directory)
}
$gameDir += "*"
Copy-Item -Path $gameDir -Destination $backupGameDir -Recurse -Force


Write-Host "backing up userprofile directory"
if (!(Test-Path -Path $backupUserProfileDir)) {
	[void](New-Item -Path $backupUserProfileDir -ItemType Directory)
}
Copy-Item -Path $userProfileDir -Destination $backupUserProfileDir -Recurse -Force


Write-Host "copying mods to backed-up userprofile directory"
$workshopMods = Get-ChildItem $workshopModsDir

foreach ($modDir in $workshopMods) {
	$subModDirs = Get-ChildItem -Path "$modDir\mods\*" -Name
	
	foreach ($currSubModDir in $subModDirs) {
		If (Test-Path -Path $backupModsDir$currSubModDir) {
			$itr = 0;
			
			do {
				++$itr;
			} while (Test-Path -Path $backupModsDir$currSubModDir$itr)
			
			Copy-Item -Path "$modDir\mods\$currSubModDir" -Destination $backupModsDir$currSubModDir$itr -Recurse
			
		} else {
			Copy-Item -Path "$modDir\mods\$currSubModDir" -Destination $backupModsDir -Recurse
		}
	}
}
