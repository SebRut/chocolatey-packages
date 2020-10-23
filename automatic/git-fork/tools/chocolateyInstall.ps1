$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = 'git-fork'
  url            = 'https://git-fork.com/update/win/ForkInstaller.exe'
  checksum       = '144AF9662DA9F1A02A62582CCBCE6EE0755DFF88ACFD64A655DFC78A12BD116E'
  checksumType   = 'sha256'
  installerType  = 'exe'
  silentArgs    = '/s'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
