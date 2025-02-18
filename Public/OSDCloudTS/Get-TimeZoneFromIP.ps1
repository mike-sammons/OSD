﻿Function Get-TimeZoneFromIP {
    $URIRequest = "https://timezoneapi.io/api/ip/?token=aZuNiKeSCzxosgrJGmCK"
    $TimeZoneAPI =  (Invoke-WebRequest -Uri $URIRequest -UseBasicParsing).Content
    $TimeZoneInfo = $TimeZoneAPI  | ConvertFrom-Json
    $TimeZoneOffSet = $TimeZoneInfo.data.datetime.offset_tzfull
    if ($TimeZoneOffSet -match "Daylight"){$TimeZoneOffSet = $TimeZoneOffSet.Replace("Daylight","Standard")}
    return $TimeZoneOffSet
}
