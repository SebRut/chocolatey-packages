$ErrorActionPreference = 'Stop'

$installationPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = 'portfolio'
    url            = 'https://bintray.com/buchen/downloads/download_file?file_path=0.31.2%2FPortfolioPerformance-distro-0.31.2-win32.win32.x86.zip'
    url64bit       = 'https://bintray.com/buchen/downloads/download_file?file_path=0.31.2%2FPortfolioPerformance-distro-0.31.2-win32.win32.x86_64.zip'
    checksum       = 'e6262c3b4f35e56eb6f89eba437e8a079dd426dae6cb59d93f2d8b3ddc0d38c6'
    checksum64     = '37ca701f286394cfc474c369d2b5405ad36279456001a721c771c271658e285c'
    checksumType   = 'sha256'
    checksumType64 = 'sha256'
    unzipLocation  = $installationPath
    validExitCodes = @(0)
}
Install-ChocolateyZipPackage @packageArgs

$files = get-childitem "$installationPath\portfolio\plugins" -include *.exe -recurse
foreach ($file in $files) {
    #generate an ignore file
    New-Item "$file.ignore" -type file -force | Out-Null
}

Install-ChocolateyShortcut `
    -ShortcutFilePath "$([Environment]::GetFolderPath('CommonStartMenu'))\Programs\PortfolioPerformance.lnk" `
    -TargetPath "$installationPath\portfolio\PortfolioPerformance.exe"