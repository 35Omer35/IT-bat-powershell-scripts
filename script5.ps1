
param(
    [string]$ComputerName
)

try {
    $diskModeli = Get-WmiObject -ComputerName $ComputerName Win32_DiskDrive -ErrorAction Stop | Select-Object -ExpandProperty Model
    Write-Output "Bilgisayar: $ComputerName"
    Write-Output "Disk Modeli: $diskModeli"
}
catch {
    Write-Output "Bilgisayar: $ComputerName için disk modeli alınamadı. Hata: $_"
}
