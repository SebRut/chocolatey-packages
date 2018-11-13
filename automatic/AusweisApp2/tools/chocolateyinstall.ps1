$ErrorActionPreference = 'Stop'

$packageArgs = @{
  packageName    = 'ausweisapp2'
  url            = ''
  checksum       = ''
  checksumType   = 'sha256'
  installerType  = 'msi'
  silentArgs    = '/quiet'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
