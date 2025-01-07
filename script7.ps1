param(
    [string]$ComputerName
)

try {
    # explorer.exe s�re�lerini al
    $explorerProcesses = @(Get-WmiObject -Query "Select * FROM Win32_Process WHERE Name='explorer.exe'" -ComputerName $ComputerName -ErrorAction SilentlyContinue)

    if ($explorerProcesses.Count -eq 0) {
        Write-Output ("Bilgisayar: {0}" -f $ComputerName)
        Write-Output "Hi� kimse oturum a�mam��."
    } else {
        foreach ($process in $explorerProcesses) {
            $Username = $process.GetOwner().User
            $Domain = $process.GetOwner().Domain
            $LoggedOnSince = $process.ConvertToDateTime($process.CreationDate)
            Write-Output ("Bilgisayar: {0}" -f $ComputerName)
            Write-Output ("Kullan�c�: {0}\\{1} - Giri� Zaman�: {2}" -f $Domain, $Username, $LoggedOnSince)
        }
    }
}
catch {
    Write-Output ("Bilgisayar: {0} i�in oturum bilgileri al�namad�. Hata: {1}" -f $ComputerName, $_)
}
