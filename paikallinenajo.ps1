$koneet = ("PC1", "PC2", "PC3")

Invoke-Command -ComputerName $koneet -ScriptBlock {
	hostname
	Get-Date
	..\levytilan-tarkastus.ps1
}