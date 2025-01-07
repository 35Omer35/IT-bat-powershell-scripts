param(
    [string]$ComputerName
)

try {
    # LAPS þifre bilgilerini al
    $passwordInfo = Get-AdmPwdPassword -ComputerName $ComputerName -ErrorAction Stop

    # Þifre ve son kullaným tarihi bilgilerini yazdýr
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output ("Þifre: {0}" -f $passwordInfo.Password)
    Write-Output ("Son Kullaným Tarihi: {0}" -f $passwordInfo.ExpirationTimestamp)
}
catch {
    # Hata mesajýný yazdýr
    Write-Output ("Bilgisayar: {0} için LAPS þifresi alýnamadý. Hata: {1}" -f $ComputerName, $_)
}
