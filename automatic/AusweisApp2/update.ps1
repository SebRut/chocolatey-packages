import-module au

$releases = 'https://github.com/Governikus/AusweisApp2/releases'

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

    $re  = "AusweisApp2-\d+\.\d+\.\d+.msi"
    $url = $download_page.links | Where-Object href -match $re | Select-Object -First 1 -expand href

    $version = $url -split '-' | Select-Object -First 1 -Skip 1
    $version = $version -replace ".{4}$"

    $url = 'https://github.com' + $url

    $checksum = [System.Text.Encoding]::ASCII.GetString((Invoke-WebRequest -Uri ($url + ".sha256")).Content) -split " " | Select-Object -First 1

    $Latest = @{ URL32 = $url; Version = $version; Checksum32 = $checksum }
    return $Latest
}

update
