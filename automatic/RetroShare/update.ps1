import-module au

$releases = 'https://github.com/RetroShare/RetroShare/releases'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*url\s*=\s*)('.*')"      = "`$1'$($Latest.URL32)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
        }
     }
}

function global:au_GetLatest {
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "RetroShare-\d+\.\d+\.\d+-\d{8}-.{8}-Qt-\d+\.\d+\.\d+-setup.exe"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $version = $url[0] -split '-' | select -First 1 -Skip 1
    $url_qt_5 = 'https://github.com' + $url[0]
    $url_qt_4 = 'https://github.com' + $url[1]

    $Latest = @{ URL32 = $url_qt_5; Version = $version }
    return $Latest
}

update
