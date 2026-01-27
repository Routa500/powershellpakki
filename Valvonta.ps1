param
(
	[string]$Kansio
)

#Ladataan YhteisFunktiot.ps1 käyttöön, josta voi kutsua funktioita
. .\YhteisetFunktiot.ps1

try {
Kirjoita-Loki "Valvonta alkoi"

if (-not (Test-Path -Path $Kansio)) {
	throw "Kansiota ei löydy: $Kansio"
}

#Lasketaan tiedostojen määrä
$maara = (Get-ChildItem $Kansio -File).Count
Kirjoita-Loki "Tiedostoja on ${Kansio}: $maara"
}

catch {
	Kirjoita-Loki "Virhe: Kansiota '$Kansio' ei ole olemassa"
	Write-Output "Virhe: $($_.ExceptionMessage)"
exit 1
}