# -----------------------------------------------------------------------------
# Change these two variables to __your__ Steam installation path
# and the desired backup directory
# -----------------------------------------------------------------------------
$steamDir  = "G:\SteamLibrary\steamapps\"
$backupDir = "E:\ZomboidBackup\"

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
$workshopMods     = Get-ChildItem $workshopModsDir -Name
foreach ($modDir in $workshopMods) {
	$sourcePath = $workshopModsDir + $modDir + "\mods\*"
	$targetPath = $backupUserProfileDir + "mods\"
	
	Copy-Item -Path $sourcePath -Destination $targetPath -Recurse -Force
}
