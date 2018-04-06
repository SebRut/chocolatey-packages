$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = 'retroshare'
  url            = 'https://github.com/RetroShare/RetroShare/releases/download/v0.6.4/RetroShare-0.6.4-20180312-91634ba6-Qt-5.9.1-setup.exe'
  checksum       = 'a339a29cef2c5f88b222e524fe655fa97b27842a67d00ba197ae04d111ab3331'
  checksumType   = 'sha256'
  installerType  = 'exe'
  silentArgs    = '/S'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
