param(
    [string]$ComputerName
)

try {
    $tempPath = "\\$ComputerName\C$\Windows\Temp"

    if (Test-Path $tempPath) {
        Write-Output ("Bilgisayar: {0}" -f $ComputerName)
        Write-Output "C:\Windows\Temp dizini temizleniyor..."
        
        # Tüm dosya ve klasörleri silmeye çalış
        Get-ChildItem -Path $tempPath -Recurse -Force | ForEach-Object {
            try {
                Remove-Item -Path $_.FullName -Force -Recurse
                Write-Output ("Silindi: {0}" -f $_.FullName)
            }
            catch {
                Write-Output ("Silinemedi: {0} - Hata: {1}" -f $_.FullName, $_.Exception.Message)
            }
        }

        Write-Output "C:\Windows\Temp dizini temizleme işlemi tamamlandı."
    } else {
        Write-Output ("Bilgisayar: {0}" -f $ComputerName)
        Write-Output "C:\Windows\Temp dizini bulunamadı."
    }
}
catch {
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output ("C:\Windows\Temp dizini temizlenirken bir hata oluştu. Hata: {0}" -f $_)
}
