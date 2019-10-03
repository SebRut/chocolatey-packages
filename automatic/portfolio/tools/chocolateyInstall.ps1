$ErrorActionPreference = 'Stop'

$installationPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = 'portfolio'
    url64bit       = 'https://bintray.com/buchen/downloads/download_file?file_path=0.31.2%2FPortfolioPerformance-distro-0.31.2-win32.win32.x86_64.zip'
    checksum64     = '37ca701f286394cfc474c369d2b5405ad36279456001a721c771c271658e285c'
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