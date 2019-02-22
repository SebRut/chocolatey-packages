$ErrorActionPreference = 'Stop'

$installationPath = Split-Path -Parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
    packageName    = 'shellz'
    url            = 'https://github.com/evilsocket/shellz/releases/download/v1.5.0/shellz_1.5.0_windows_386.zip'
    url64bit       = 'https://github.com/evilsocket/shellz/releases/download/v1.5.0/shellz_1.5.0_windows_amd64.zip'
    checksum       = '8da1c51621de0ff3ee6155a26d584f52f40e0bd9b59f476ff83b4735eb1e30f5'
    checksum64     = '8e3bf734c136b4423b27ae0afdf7e05fbba16fa09d7e024c68c7bd6af3c45068'
    checksumType   = 'sha256'
    checksumType64 = 'sha256'
    unzipLocation  = $installationPath
    validExitCodes = @(0)
}

Install-ChocolateyZipPackage @packageArgs