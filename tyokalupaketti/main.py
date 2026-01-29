import levytila
import varmuuskopio
import yhteinen

def main():
    yhteinen.kirjoita_loki("Ylläpitotyökalu käynnistyi")

    levytila.tarkista_levytila()
    varmuuskopio.varmuuskopioi("raportit")

    yhteinen.kirjoita_loki("Ylläpitotyökalu valmis")

if __name__ == "__main__":
    main()
