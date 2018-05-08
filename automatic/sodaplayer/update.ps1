import-module au

$releases = 'https://headwayapp.co/soda-player-changelog'

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

    $re  = '<h2 itemprop="headline" class="title">(\d+\.\d\.\d)</h2>'

    $download_page.Content -match $re
    $version = $matches[1]
    $url_32 = "https://www.sodaplayer.com/win/download"

    $Latest = @{ URL32 = $url_32; Version = $version }
    return $Latest
}

update
