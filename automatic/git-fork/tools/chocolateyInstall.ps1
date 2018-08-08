$ErrorActionPreference = 'Stop'


$packageArgs = @{
  packageName    = 'git-fork'
  url            = 'https://git-fork.com/update/win/ForkInstaller.exe'
  checksum       = '1287b648a5797fc15eebd25b67007c86368751f9821458f676409511d5a34167'
  checksumType   = 'sha256'
  installerType  = 'exe'
  silentArgs    = '/s'
  validExitCodes = @(0)
}
Install-ChocolateyPackage @packageArgs
