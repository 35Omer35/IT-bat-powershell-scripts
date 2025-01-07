param(
    [string]$ComputerName
)

try {
    # WinSAT bilgilerini al
    $result = Get-WmiObject -Class Win32_WinSAT -ComputerName $ComputerName -ErrorAction Stop

    if ($result) {
        # Puanlarý kontrol et ve sýfýr olup olmadýðýný kontrol et
        if ($result.CPUScore -eq 0 -and $result.D3DScore -eq 0 -and $result.DiskScore -eq 0 -and $result.GraphicsScore -eq 0 -and $result.MemoryScore -eq 0) {
            Write-Output ("Bilgisayar: {0}" -f $ComputerName)
            Write-Output "WinSAT puanlarý sýfýr. Test henüz çalýþtýrýlmamýþ olabilir."
        } else {
            Write-Output ("Bilgisayar: {0}" -f $ComputerName)
            Write-Output ("CPU Puaný: {0}" -f $result.CPUScore)
            Write-Output ("D3D Puaný: {0}" -f $result.D3DScore)
            Write-Output ("Disk Puaný: {0}" -f $result.DiskScore)
            Write-Output ("Grafik Puaný: {0}" -f $result.GraphicsScore)
            Write-Output ("Bellek Puaný: {0}" -f $result.MemoryScore)
        }
    } else {
        Write-Output ("Bilgisayar: {0} - WinSAT skoru bulunamadý." -f $ComputerName)
    }
}
catch {
    Write-Output ("Bilgisayar: {0} için puanlar alýnamadý. Hata: {1}" -f $ComputerName, $_)
}
