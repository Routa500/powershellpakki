import shutil
import yhteinen

def tarkista_levytila():
    polku = "C:\\"

    total, used, free = shutil.disk_usage(polku)

    viesti = (
        f"Kokotila: {total // (1024**3)} GB, "
        f"Käytössä: {used // (1024**3)} GB, "
        f"Vapaana: {free // (1024**3)} GB"
    )

    yhteinen.kirjoita_loki("Levytila tarkistettu.")
    yhteinen.kirjoita_raportti(viesti)
