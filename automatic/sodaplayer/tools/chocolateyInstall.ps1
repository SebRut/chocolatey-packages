$ErrorActionPreference = 'Stop'

$installationPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  packageName    = 'sodaplayer'
  url         = 'https://www.sodaplayer.com/win/download'
  checksum     = ''
  checksumType = 'sha256'
  installerType = 'exe'
  silentArgs  = ''
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs

