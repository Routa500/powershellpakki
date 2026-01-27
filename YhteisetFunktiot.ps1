function Luo-Kansio {
param ([string]$Nimi)

if (-not (Test-Path $Nimi)) {
New-Item -ItemType Directory -Path $Nimi | Out-Null 
Kirjoita-Loki -Viesti "Luotiin uusi kansio: $Nimi"	
	}
}

function Kirjoita-Loki {
	param(
	[string]$Viesti,
	[string]$Tiedosto = "loki.txt"
)
$Rivi = "$((Get-Date).ToString('yyyy-MM-dd')) - $Viesti"
	
Write-Host $Rivi -ForegroundColor Green

$Rivi | Out-File -FilePath $Tiedosto -Append -Force
}
