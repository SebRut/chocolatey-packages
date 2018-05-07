$ErrorActionPreference = 'Stop'

$installationPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'portfolio'
  url         = 'https://bintray.com/buchen/downloads/download_file?file_path=0.31.0%2FPortfolioPerformance-distro-0.31.0-win32.win32.x86_64.zip'
  url64bit          = 'https://bintray.com/buchen/downloads/download_file?file_path=0.31.0%2FPortfolioPerformance-distro-0.31.0-win32.win32.x86_64.zip'
  checksum     = 'cae61c27b9961aaedb7ebb5213809fce72cde9d86b10d7a2dc44b7d291d05381'
  checksum64bit     = 'cae61c27b9961aaedb7ebb5213809fce72cde9d86b10d7a2dc44b7d291d05381'
  checksumType = 'sha256'
  checksumType64bit = 'sha256'
  unzipLocation  = $installationPath
  validExitCodes = @(0)
}
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut `
  -ShortcutFilePath "$([Environment]::GetFolderPath('CommonStartMenu'))\Programs\PortfolioPerformance.lnk" `
  -TargetPath "$installationPath\portfolio\PortfolioPerformance.exe"
