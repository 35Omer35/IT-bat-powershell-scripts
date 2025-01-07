param(
    [string]$ComputerName
)

try {
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output "Yeniden başlatma işlemi başlatılıyor..."

    # Bilgisayara yeniden başlatma komutu gönder
    Restart-Computer -ComputerName $ComputerName -Force -ErrorAction Stop

    Write-Output "Bilgisayar: {0} başarıyla yeniden başlatıldı." -f $ComputerName
}
catch {
    Write-Output ("Bilgisayar: {0} yeniden başlatılamadı. Hata: {1}" -f $ComputerName, $_.Exception.Message)
}
