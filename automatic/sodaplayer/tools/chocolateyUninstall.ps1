$ErrorActionPreference = 'Stop'

$install_dir = (Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall\sodaplayer -Name InstallLocation).InstallLocation


$uninstall_command = (Get-ItemProperty -Path Registry::HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Uninstall\sodaplayer -Name QuietUninstallString).QuietUninstallString
$uninstall_file = $uninstall_command -split ' ' | select -First 1
$uninstall_args = ($uninstall_command -split ' ' | select -Skip 1) -join ' '

Uninstall-ChocolateyPackage -PackageName 'sodaplayer' `
                                -FileType 'exe' `
                                -SilentArgs $uninstall_args `
                                -ValidExitCodes @(0) `
                                -File $uninstall_file

Remove-Item $install_dir -Recurse