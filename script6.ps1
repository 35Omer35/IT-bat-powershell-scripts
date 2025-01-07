param(
    [string]$ComputerName
)

try {
    # WinSAT bilgilerini al
    $result = Get-WmiObject -Class Win32_WinSAT -ComputerName $ComputerName -ErrorAction Stop

    if ($result) {
        # Puanlar� kontrol et ve s�f�r olup olmad���n� kontrol et
        if ($result.CPUScore -eq 0 -and $result.D3DScore -eq 0 -and $result.DiskScore -eq 0 -and $result.GraphicsScore -eq 0 -and $result.MemoryScore -eq 0) {
            Write-Output ("Bilgisayar: {0}" -f $ComputerName)
            Write-Output "WinSAT puanlar� s�f�r. Test hen�z �al��t�r�lmam�� olabilir."
        } else {
            Write-Output ("Bilgisayar: {0}" -f $ComputerName)
            Write-Output ("CPU Puan�: {0}" -f $result.CPUScore)
            Write-Output ("D3D Puan�: {0}" -f $result.D3DScore)
            Write-Output ("Disk Puan�: {0}" -f $result.DiskScore)
            Write-Output ("Grafik Puan�: {0}" -f $result.GraphicsScore)
            Write-Output ("Bellek Puan�: {0}" -f $result.MemoryScore)
        }
    } else {
        Write-Output ("Bilgisayar: {0} - WinSAT skoru bulunamad�." -f $ComputerName)
    }
}
catch {
    Write-Output ("Bilgisayar: {0} i�in puanlar al�namad�. Hata: {1}" -f $ComputerName, $_)
}
