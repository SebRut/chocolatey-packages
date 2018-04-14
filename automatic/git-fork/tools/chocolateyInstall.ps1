$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = 'git-fork'
  url            = 'https://git-fork.com/update/win/ForkInstaller.exe'
  checksum       = 'c27bf7a4e1e3fef52ed8548dbc3b142a19446e0d882c0761a24aec84cf527b02'
  checksumType   = 'sha256'
  installerType  = 'exe'
  silentArgs    = '/s'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
