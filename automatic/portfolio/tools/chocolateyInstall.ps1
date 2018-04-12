$ErrorActionPreference = 'Stop'

$packageVersion = $Env:ChocolateyPackageVersion
$packageParameters = Get-PackageParameters

$installationPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'portfolio'
  url         = 'https://s3.amazonaws.com/name.abuchen.portfolio/0.29.0/PortfolioPerformance-0.29.0-win32.win32.x86.zip'
  url64bit          = 'https://s3.amazonaws.com/name.abuchen.portfolio/0.29.0/PortfolioPerformance-0.29.0-win32.win32.x86_64.zip'
  checksum     = '8080764851571883e8eba7c149ce0b9238adefa9cf17a0bd4d9caaa1e9fbd121'
  checksum64bit     = '4d5d2e13873638e5feb0d181ccdfaf63b7f3633f2a3bc6493e01b477993954a9'
  checksumType = 'sha256'
  checksumType64bit = 'sha256'
  unzipLocation  = $installationPath
  validExitCodes = @(0)
}
Install-ChocolateyZipPackage @packageArgs

Install-ChocolateyShortcut `
  -ShortcutFilePath "$([Environment]::GetFolderPath('CommonStartMenu'))\Programs\PortfolioPerformance.lnk" `
  -TargetPath "$installationPath\portfolio\PortfolioPerformance.exe"
