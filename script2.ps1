param(
    [string]$ComputerName
)

try {
    $kasaTuru = (Get-WmiObject -Class Win32_SystemEnclosure -ComputerName $ComputerName -ErrorAction Stop).ChassisTypes[0]
    $cihazTuru = switch ($kasaTuru) {
        8 { "Diz�st�" }
        9 { "Diz�st�" }
        10 { "Diz�st�" }
        11 { "Diz�st�" }
        12 { "Diz�st�" }
        default { "Masa�st�" }
    }
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output ("{0} bir {1} bilgisayard�r." -f $ComputerName, $cihazTuru)
}
catch {
    Write-Output ("Bilgisayar: {0} i�in bilgi al�namad�. Hata: {1}" -f $ComputerName, $_)
}
