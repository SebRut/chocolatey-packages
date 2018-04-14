import-module au

$releases = 'https://git-fork.com/releasenoteswin'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*url\s*=\s*)('.*')"  = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "Fork \d\.\d+"
    $download_page -match $re

    $version = $matches[0] -split ' ' | select -First 1 -Skip 1
    $url_32 = "https://git-fork.com/update/win/ForkInstaller.exe"

    $Latest = @{ URL32 = $url_32; Version = $version }
    return $Latest
}

update
