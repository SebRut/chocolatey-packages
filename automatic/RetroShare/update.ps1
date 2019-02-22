import-module au

$releases = 'https://github.com/RetroShare/RetroShare/releases'

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
    $download_page = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $re = "RetroShare-\d+\.\d+\.\d+-\d{8}-\d*-.{8,10}-Qt-\d+\.\d+\.\d+-setup.exe"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = $url -split '-' | select -First 1 -Skip 1
    $url = 'https://github.com' + $url

    $Latest = @{ URL32 = $url; Version = $version }
    return $Latest
}

update
