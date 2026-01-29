from pathlib import Path
import shutil

kansiopaikka = Path("testidata")

for tiedosto in kansiopaikka.iterdir():
    if tiedosto.is_file():
        kohde = kansiopaikka/tiedosto.suffix[1:]
        kohde.mkdir(exist_ok=True)
        shutil.move(str(tiedosto), str(kohde/tiedosto.name))
        with open("loki.txt", "a") as loki:
            loki.write("Tiedosto " + tiedosto.name + " siirrettiin kansioon " + str(kohde) + "!\n")    