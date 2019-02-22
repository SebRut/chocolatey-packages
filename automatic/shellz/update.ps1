import-module au

$releases = 'https://github.com/evilsocket/shellz/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_GetLatest {
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = "shellz_\d\.\d\.\d_windows_(386|amd64)\.zip"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $version = $url[0] -split '_' | select -First 1 -Skip 1
    $url_32_bit = 'https://github.com' + $url[0]
    $url_64_bit = 'https://github.com' + $url[1]

    $Latest = @{ URL32 = $url_32_bit; URL64 = $url_64_bit; Version = $version }
    return $Latest
}

update
