param(
    [string]$ComputerName
)

try {
    $kasaTuru = (Get-WmiObject -Class Win32_SystemEnclosure -ComputerName $ComputerName -ErrorAction Stop).ChassisTypes[0]
    $cihazTuru = switch ($kasaTuru) {
        8 { "Dizüstü" }
        9 { "Dizüstü" }
        10 { "Dizüstü" }
        11 { "Dizüstü" }
        12 { "Dizüstü" }
        default { "Masaüstü" }
    }
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output ("{0} bir {1} bilgisayardýr." -f $ComputerName, $cihazTuru)
}
catch {
    Write-Output ("Bilgisayar: {0} için bilgi alýnamadý. Hata: {1}" -f $ComputerName, $_)
}
