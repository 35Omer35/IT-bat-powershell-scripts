param(
    [string]$ComputerName
)

try {
    $prefetchPath = "\\$ComputerName\C$\Windows\Prefetch"
    if (Test-Path $prefetchPath) {
        # Tüm dosyaları sil
        Get-ChildItem -Path $prefetchPath -Recurse -Force | Remove-Item -Force
        Write-Output ("Bilgisayar: {0}" -f $ComputerName)
        Write-Output "C:\Windows\Prefetch dizini başarıyla temizlendi."
    } else {
        Write-Output ("Bilgisayar: {0}" -f $ComputerName)
        Write-Output "C:\Windows\Prefetch dizini bulunamadı."
    }
}
catch {
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output ("C:\Windows\Prefetch dizini temizlenirken bir hata oluştu. Hata: {0}" -f $_)
}
