$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = 'git-fork'
  url            = 'https://git-fork.com/update/win/ForkInstaller.exe'
  checksum       = '6ffda3f17d47770869c6bc94de3e27ce906873808538c0e437283a2d6ed9ea7f'
  checksumType   = 'sha512'
  installerType  = 'exe'
  silentArgs    = '/s'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
