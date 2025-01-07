param(
    [string]$ComputerNumber
)

try {
    Write-Output ("Bilgisayar Numarası: {0}" -f $ComputerNumber)
    Write-Output "SNP Çakışması kontrolü başlatılıyor..."

    # AD'de verilen bilgisayar numarasına göre Service Principal Name (SPN) kontrolü yap
    $results = Get-ADComputer -Filter {serviceprincipalname -like "*$ComputerNumber*"} -Properties serviceprincipalname |
               Select-Object -ExpandProperty serviceprincipalname

    if ($results) {
        Write-Output "Çakışan SPN Listesi:"
        $results | ForEach-Object { Write-Output $_ }
    } else {
        Write-Output ("Bilgisayar Numarası: {0} için herhangi bir SNP çakışması bulunamadı." -f $ComputerNumber)
    }
}
catch {
    Write-Output ("SNP Çakışması kontrolü başarısız oldu. Hata: {0}" -f $_.Exception.Message)
}
