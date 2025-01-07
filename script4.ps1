param(
    [string]$ComputerName
)

try {
    # LAPS �ifre bilgilerini al
    $passwordInfo = Get-AdmPwdPassword -ComputerName $ComputerName -ErrorAction Stop

    # �ifre ve son kullan�m tarihi bilgilerini yazd�r
    Write-Output ("Bilgisayar: {0}" -f $ComputerName)
    Write-Output ("�ifre: {0}" -f $passwordInfo.Password)
    Write-Output ("Son Kullan�m Tarihi: {0}" -f $passwordInfo.ExpirationTimestamp)
}
catch {
    # Hata mesaj�n� yazd�r
    Write-Output ("Bilgisayar: {0} i�in LAPS �ifresi al�namad�. Hata: {1}" -f $ComputerName, $_)
}
