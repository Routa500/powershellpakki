param
(
	[string]$Kansio
)


. .\YhteisetFunktiot.ps1

try {
Kirjoita-Loki "Valvonta alkoi"

if (-not (Test-Path -Path $Kansio)) {
	throw "Kansiota ei löydy: $Kansio"
}


$maara = (Get-ChildItem $Kansio -File).Count
Kirjoita-Loki "Tiedostoja on ${Kansio}: $maara"
}

catch {
	Kirjoita-Loki "Virhe: Kansiota '$Kansio' ei ole olemassa"
	Write-Output "Virhe: $($_.ExceptionMessage)"
exit 1
}