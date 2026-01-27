function Kirjoita-Loki {
	param(
	[string]$Viesti,
	[string]$Tiedosto = "loki.txt"
)
$Rivi = "$((Get-Date).ToString('yyyy-MM-dd')) - $Viesti"
	
Write-Host $Rivi -ForegroundColor Green

$Rivi | Out-File -FilePath $Tiedosto -Append -Force
}