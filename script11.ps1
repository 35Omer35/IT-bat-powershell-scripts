param(
    [string]$ComputerName
)

try {
    $ccmCachePath = "\\$ComputerName\C$\Windows\ccmcache"
    if (Test-Path $ccmCachePath) {
        Get-ChildItem -Path $ccmCachePath -Recurse -Force | Remove-Item -Force -Recurse
        Write-Output ("Bilgisayar: {0}" -f $ComputerName)
        Write-Output "C:\Windows\ccmcache dizini başarıyla temizlendi."
    } else {
        Write-Output ("Bilgisayar: {0}" -f $ComputerName)
        Write-Output "C:\Windows\ccmcache dizini bulunamadı."
    }
}
catch {
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output ("C:\Windows\ccmcache dizini temizlenirken bir hata oluştu. Hata: {0}" -f $_)
}
