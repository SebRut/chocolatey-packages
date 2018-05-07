import-module au

$releases = 'http://www.portfolio-performance.info/portfolio/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*url\s*=\s*)('.*')"  = "`$1'$($Latest.URL32)'"
            "(?i)(^\s*url64bit\s*=\s*)('.*')"  = "`$1'$($Latest.URL64)'"
            "(^\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
            "(^\s*checksum64bit\s*=\s*)('.*')" = "`$1'$($Latest.Checksum64)'"
        }
     }
}

function global:au_GetLatest {
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
    $download_page = Invoke-WebRequest -Uri $releases

    $re  = "PortfolioPerformance-distro-\d+\.\d+\.\d+-win32\.win32\.x86(_64)?\.zip"
    $url = $download_page.links | ? href -match $re | select -First 2 -expand href

    $version = $url[0] -split '-' | select -First 1 -Skip 2
    $url_32 = $url[0]
    $url_64 = $url[1]

    $Latest = @{ URL32 = $url_32; URL64 = $url_64; Version = $version }
    return $Latest
}

update
