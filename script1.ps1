param(
    [string]$ComputerName
)

try {
    $adComputer = Get-ADComputer -Identity $ComputerName -ErrorAction SilentlyContinue
    if ($adComputer) {
        $ouPath = ($adComputer.DistinguishedName -split ",", 2)[1]
        Write-Output ("Bilgisayar: {0}" -f $ComputerName)
        Write-Output ("Bulunduğu OU: {0}" -f $ouPath)
    } else {
        Write-Output ("Bilgisayar: {0} Active Directory'de bulunamadı." -f $ComputerName)
    }
}
catch {
    Write-Output ("Hata: {0}" -f $_)
}
