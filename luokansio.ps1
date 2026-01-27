#Annetaan luotavan kansion nimi parametrinä
param(
	[Parameter(Mandatory = $true)]	
	[string]$kansio
)

#Ladataan YhteisFunktiot.ps1 käyttöön, josta voi kutsua funktioita
. .\YhteisetFunktiot.ps1

try{

Kirjoita-Loki "Uuden kansion luonti käynnistetty"
#Luodaan kansio Luo-Kansio -funktiolla
Luo-Kansio -nimi $kansio
Kirjoita-Loki "Uusi $kansio luotu"
} 

catch{

Kirjoita-Loki "Virhe: Kansiota '$Kansio' ei ole olemassa"
	Write-Output "Virhe: $($_.ExceptionMessage)"
exit 1

}