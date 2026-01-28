param (
    [Parameter(Mandatory=$false)]
    [string]$Kone = "localhost"
)

# Tuodaan funktiot käyttöön
if (Test-Path ".\YhteisetFunktiot.ps1") {
    . .\YhteisetFunktiot.ps1
} else {
    Write-Warning "YhteisetFunktiot.ps1 ei löytynyt."
}

# Määritetään lokitiedoston nimi
$Lokitiedosto = "valvonta_logi.txt"

try {
    Write-Host "Otetaan yhteyttä koneeseen: $Kone..." -ForegroundColor Cyan

    # Ajetaan etäkomento

    $tulos = Invoke-Command -ComputerName $Kone -ScriptBlock {
        $aika = Get-Date -Format "dd.MM.yyyy"
        $nimi = $env:COMPUTERNAME

        return [PSCustomObject]@{
            Aika = $aika
            Kone = $nimi
        }
    } -ErrorAction Stop

    # Kirjoitetaan onnistuminen

    $viesti = "Koneen nimi: $($tulos.Kone) - Tila: OK"
    Kirjoita-Loki -Viesti $viesti -Tiedosto $Lokitiedosto
}
catch {
    # Kirjoitetaan virhe

    $virhe = "VIRHE koneella $Kone : $($_.Exception.Message)"
    Kirjoita-Loki -Viesti $virhe -Tiedosto $Lokitiedosto
    Write-Error $virhe
}