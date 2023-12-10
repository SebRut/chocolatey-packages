import-module au

$releases = 'https://git-fork.com/update/win/RELEASES'
$re  = "([A-Z,0-9]{0,128}) Fork-(\d\.\d{1,2}\.\d{1,2})(?:-full.nupkg \d.+)"

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
	$text = [System.Text.Encoding]::ASCII.GetString($download_page.Content)

	$values = (($text | select-string -pattern $re -AllMatches).Matches | select -Last 1)

    $version = $values.Groups[2].Value
    $url_32 = "https://cdn.fork.dev/win/Fork-" + $version + ".exe"

    $Latest = @{ URL32 = $url_32; Version = $version}
    return $Latest
}

update
