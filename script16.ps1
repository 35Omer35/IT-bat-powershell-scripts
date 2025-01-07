param(
    [string]$ComputerName,
    [string]$ProgramName
)

try {
    Write-Output ("Bilgisayar: {0}, Program: {1}" -f $ComputerName, $ProgramName)
    Write-Output "Program kapatma işlemi başlatılıyor..."

    # Hedef bilgisayarda programı bul ve kapat
    $processes = Get-WmiObject Win32_Process -ComputerName $ComputerName -ErrorAction Stop
    $targetProcesses = $processes | Where-Object { $_.Name -eq $ProgramName }

    if ($targetProcesses) {
        $targetProcesses | ForEach-Object {
            $_.Terminate() | Out-Null
            Write-Output ("Kapatıldı: {0}" -f $_.Name)
        }
    } else {
        Write-Output ("Program: {0} çalışmıyor veya bulunamadı." -f $ProgramName)
    }
}
catch {
    Write-Output ("Bilgisayar: {0}, Program: {1}" -f $ComputerName, $ProgramName)
    Write-Output ("Program kapatma işlemi başarısız oldu. Hata: {0}" -f $_.Exception.Message)
}
