from pathlib import Path
from datetime import datetime

def luo_kansio(nimi):
    Path(nimi).mkdir(parents=True, exist_ok=True)

def kirjoita_loki(viesti):
    luo_kansio("lokit")
    with open("lokit/loki.txt", "a", encoding="utf-8") as loki:
        loki.write(f"{datetime.now()} : {viesti}\n")

def kirjoita_raportti(teksti):
    luo_kansio("raportit")
    with open("raportit/levyraportti.txt", "a", encoding="utf-8") as tiedosto:
        tiedosto.write(f"{datetime.now()} : {teksti}\n")
