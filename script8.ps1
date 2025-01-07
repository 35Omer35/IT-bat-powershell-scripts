param(
    [string]$ComputerName
)

try {
    # Bilgisayara ping at
    $pingResult = Test-Connection -ComputerName $ComputerName -Count 1 -ErrorAction Stop

    # Ping başarılıysa mesajı yazdır
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output "Ping Durumu: Başarılı"
    Write-Output ("Ping Süresi: {0} ms" -f $pingResult.ResponseTime)
}
catch {
    # Ping başarısızsa hata mesajı yazdır
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output "Ping Durumu: Başarısız"
    Write-Output ("Hata: {0}" -f $_.Exception.Message)
}
