param(
    [string]$ComputerName
)

try {
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output "MAC adresi alınıyor..."

    # MAC adresini al
    $macAddresses = Get-WmiObject -Class Win32_NetworkAdapterConfiguration -ComputerName $ComputerName -ErrorAction Stop |
                    Where-Object { $_.IPEnabled -eq $true } |
                    Select-Object -ExpandProperty MACAddress

    if ($macAddresses) {
        Write-Output "MAC Adresleri:"
        $macAddresses | ForEach-Object { Write-Output $_ }
    } else {
        Write-Output "Bilgisayar: {0} için MAC adresi bulunamadı." -f $ComputerName
    }
}
catch {
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output ("MAC adresi alınamadı. Hata: {0}" -f $_.Exception.Message)
}
