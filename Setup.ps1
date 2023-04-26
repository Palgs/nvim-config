# Install Modules
Install-Module -Name Terminal-Icons -Repository PSGallery

# Setup symlinks
$mappings = @(
#    @{
#	    source = "$Env:USERPROFILE\.ideavimrc"
#	    dest = "$PWD\IdeaVim\.ideavimrc"
#   },
    @{
	    source = "$Env:LOCALAPPDATA\nvim"
	    dest = "$PWD\nvim"
    }
    #@{
     #   source = "$Env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\"
     #   dest = "$PWD\WindowsTerminal"
    #},
    @{
        source ="$Env:LOCALAPPDATA\Programs\oh-my-posh\themes\palgs_theme.yaml"
        dest = "$PWD\OhMyPosh\palgs_theme.yaml"
    }
)

foreach ($mapping in $mappings) {
	Write-Output "Creating symlink for $($mapping.source) -> $($mapping.dest)"

	if (Test-Path -Path $mapping.source) {
		$(Get-Item $mapping.source).Delete()
	}

	New-Item `
        -ItemType SymbolicLink `
        -Path $mapping.source -Target $mapping.dest
}

echo ". `"$PWD\Powershell\profile.ps1`"" > $Env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1
echo ". `"$PWD\Powershell\profile.ps1`"" > $Env:USERPROFILE\Documents\WindowsPowerShell\profile.ps1
