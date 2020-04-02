import-module au

$releases = 'http://www.portfolio-performance.info/'

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1' = @{
            "(?i)(^\s*url64bit\s*=\s*)('.*')" = "`$1'$($Latest.URL64)'"
            "(^\s*checksum64\s*=\s*)('.*')"   = "`$1'$($Latest.Checksum64)'"
        }
    }
}

function global:au_BeforeUpdate() {
    $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_GetLatest {
    [Net.ServicePointManager]::SecurityProtocol = "tls12, tls11, tls"
    $download_page = Invoke-WebRequest -Uri $releases

    $re = "PortfolioPerformance-distro-\d+\.\d+\.\d+-win32\.win32\.x86(_64)?\.zip"
    $url = $download_page.links | ? href -match $re | select -First 1 -expand href

    $version = $url -split '-' | select -First 1 -Skip 2

    $Latest = @{ URL64 = $url; ChecksumType64 = 'sha256'; Version = $version }
    return $Latest
}

update -ChecksumFor none
