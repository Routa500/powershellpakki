import shutil 
from datetime import datetime

polku = "/"

total, used, free = shutil.disk_usage(polku)

total_gb = total / (1024**3)
used_gb = used / (1024**3)
free_gb = free / (1024**3)

aika = datetime.now()

with open("levyraportti.txt", "a") as tiedosto:
    tiedosto.write("====================================\n")
    tiedosto.write(f"Päivämäärä ja aika: {aika}\n")
    tiedosto.write(f"Kokonaislevytila: {total_gb:.2f} GB\n")
    tiedosto.write(f"Käytetty tila: {used_gb:.2f} GB\n")
    tiedosto.write(f"Vapaa tila: {free_gb:.2f} GB\n")
    tiedosto.write("====================================\n\n")

    print("Levytilaraportti tallennettu tiedostoon levyraportti.txt")