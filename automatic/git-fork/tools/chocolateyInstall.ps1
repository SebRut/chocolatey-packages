$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = 'git-fork'
  url            = 'https://git-fork.com/update/win/ForkInstaller.exe'
  checksum       = 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855'
  checksumType   = 'sha256'
  installerType  = 'exe'
  silentArgs    = '/s'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
