from pathlib import Path
import shutil
import yhteinen

def varmuuskopioi(kansio_nimi):
    lahto = Path(kansio_nimi)
    kohde = Path("backup") / kansio_nimi

    if not lahto.exists():
        yhteinen.kirjoita_loki(f"Lähdekansiota ei löydy: {kansio_nimi}")
        return

    kohde.mkdir(parents=True, exist_ok=True)

    for tiedosto in lahto.iterdir():
        if tiedosto.is_file():
            shutil.copy2(tiedosto, kohde / tiedosto.name)

    yhteinen.kirjoita_loki(f"Varmuuskopio valmis: {kansio_nimi}")
