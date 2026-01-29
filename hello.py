nimi = input("Anna nimi:")
print("Hei " + nimi)

with open("tervehdys.txt", "a") as tiedosto:
    tiedosto.write("Hei " + nimi + "!\n")