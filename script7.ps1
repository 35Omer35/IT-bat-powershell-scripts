param(
    [string]$ComputerName
)

try {
    # explorer.exe süreçlerini al
    $explorerProcesses = @(Get-WmiObject -Query "Select * FROM Win32_Process WHERE Name='explorer.exe'" -ComputerName $ComputerName -ErrorAction SilentlyContinue)

    if ($explorerProcesses.Count -eq 0) {
        Write-Output ("Bilgisayar: {0}" -f $ComputerName)
        Write-Output "Hiç kimse oturum açmamýþ."
    } else {
        foreach ($process in $explorerProcesses) {
            $Username = $process.GetOwner().User
            $Domain = $process.GetOwner().Domain
            $LoggedOnSince = $process.ConvertToDateTime($process.CreationDate)
            Write-Output ("Bilgisayar: {0}" -f $ComputerName)
            Write-Output ("Kullanýcý: {0}\\{1} - Giriþ Zamaný: {2}" -f $Domain, $Username, $LoggedOnSince)
        }
    }
}
catch {
    Write-Output ("Bilgisayar: {0} için oturum bilgileri alýnamadý. Hata: {1}" -f $ComputerName, $_)
}
