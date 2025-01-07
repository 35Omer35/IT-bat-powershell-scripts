param(
    [string]$ComputerName
)

# Girdinin boş olup olmadığını doğru bir şekilde kontrol et
if ([string]::IsNullOrWhiteSpace($ComputerName)) {
    Write-Output "Bilgisayar adı boş. Lütfen geçerli bir bilgisayar adı veya IP adresi girin."
    exit
}

try {
    Write-Output ("Bilgisayar Adı: {0}" -f $ComputerName)

    # İşletim sistemi bilgilerini WMI üzerinden al
    $osInfo = Get-WmiObject -Class Win32_OperatingSystem -ComputerName $ComputerName -ErrorAction Stop

    if ($osInfo) {
        Write-Output ("Bilgisayar Adı: {0}" -f $ComputerName)
        Write-Output ("İşletim Sistemi: {0}" -f $osInfo.Caption)
        Write-Output ("Sürüm: {0}" -f $osInfo.Version)
        Write-Output ("Mimari: {0}" -f $osInfo.OSArchitecture)
        Write-Output ("Son Açılma Zamanı: {0}" -f $osInfo.LastBootUpTime)
    } else {
        Write-Output ("Bilgisayar Adı: {0} için işletim sistemi bilgisi bulunamadı." -f $ComputerName)
    }
}
catch {
    Write-Output ("Hata oluştu. Bilgisayar Adı: {0}. Hata: {1}" -f $ComputerName, $_.Exception.Message)
}
