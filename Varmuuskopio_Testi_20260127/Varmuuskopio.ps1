param (
[string]$Lahde,
[string]$Kohde = "Varmuuskopio"
)

. .\YhteisetFunktiot.ps1

$paiva = Get-Date -Format "yyyyMMdd"
$Kohde = "${Kohde}_$paiva"

function Luo-Kansio {
param ([string]$Nimi)

if (-not (Test-Path $Nimi)) {
New-Item -ItemType Directory -Path $Nimi | Out-Null 
Kirjoita-Loki -Viesti "Luotiin uusi kansio: $Nimi"	
	}
}

function Kopioi-Tiedostot {
param ($Lahto, $Maali)

Copy-Item "$Lahto\*" $Maali -Recurse -Force -Exclude "$Maali"
Kirjoita-Loki -Viesti "Tiedostot kopsattu kohteeseen: $Maali"
}

if (Test-Path $Lahde) {

Kirjoita-Loki -Viesti "Varmuuskopiointi aloitettu lähteestä: $Lahde"
    
    Luo-Kansio -Nimi $Kohde
    Kopioi-Tiedostot -Lahto $Lahde -Maali $Kohde

    Write-Host "Varmuuskopio kansiosta '$Lahde' on valmis!" -ForegroundColor Green
    Kirjoita-Loki -Viesti "Varmuuskopiointi suoritettu onnistuneesti."
}
else {
    Write-Host "Lähdekansiota ei löydy." -ForegroundColor Red
    Kirjoita-Loki -Viesti "VIRHE: Lähdekansiota '$Lahde' ei löytynyt."
}