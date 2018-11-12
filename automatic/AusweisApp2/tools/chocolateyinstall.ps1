$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'ausweisapp2'
  url            = ''
  checksum       = ''
  checksumType   = 'sha256'
  installerType  = 'msi'
  silentArgs    = '/S'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
