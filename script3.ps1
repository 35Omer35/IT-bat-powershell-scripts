
param(
    [string]$ComputerName
)

try {
    $bitLockerStatus = Get-WmiObject -Class Win32_EncryptableVolume -Namespace "Root\CIMv2\Security\MicrosoftVolumeEncryption" -ComputerName $ComputerName -ErrorAction Stop
    if ($bitLockerStatus.ProtectionStatus -eq 1) {
        Write-Output "Bilgisayar: $ComputerName"
        Write-Output "BitLocker Durumu: Etkin"
    } else {
        Write-Output "Bilgisayar: $ComputerName"
        Write-Output "BitLocker Durumu: Devre Dışı"
    }
}
catch {
    Write-Output "Bilgisayar: $ComputerName için bilgi alınamadı. Hata: $_"
}
