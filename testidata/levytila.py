import yhteinen
import shutil 

polku = "C:\\"

total, used, free = shutil.disk_usage(polku)


yhteinen.kirjoita_loki(f"Kokotila: {total // (1024**3)} GiB, Kaytossa: {used // (1024**3)} GiB, Vapaana: {free // (1024**3)} GiB", "levytilalogi.txt")
if free < total * 0.1:
    yhteinen.kirjoita_loki("Varoitus: Levytila on alle 10% vapaana.", "varoitukset.txt")