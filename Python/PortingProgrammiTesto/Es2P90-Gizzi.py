#Gizzi Manuel
#Programma che date le tdi di tre router (R1,R2,R3)
#acquiscisce in input gli indirizzi mittente e destinatario di un pacchetto
#e mostra in output il percorso del pacchetto

#Utilizzo un dizionario per simulare le struct
linkrouter = [
    {"ra": "R1", "rb": "R2", "p": 2},
    {"ra": "R2", "rb": "R1", "p": 4},
    {"ra": "R2", "rb": "R3", "p": 2},
    {"ra": "R3", "rb": "R2", "p": 5},
    {"ra": "R3", "rb": "R4", "p": 3},
    {"ra": "R4", "rb": "R3", "p": 1}
]

#TDI per ogni router
tdiR1 = [
    {"add": "a", "p": 1, "h": 0, "c": 0},
    {"add": "b", "p": 2, "h": 1, "c": 5},
    {"add": "c", "p": 2, "h": 2, "c": 2}
]
tdiR2 = [
    {"add": "a", "p": 3, "h": 1, "c": 0},
    {"add": "b", "p": 7, "h": 0, "c": 5},
    {"add": "c", "p": 2, "h": 4, "c": 2}
]
tdiR3 = [
    {"add": "a", "p": 9, "h": 2, "c": 0},
    {"add": "b", "p": 8, "h": 1, "c": 5},
    {"add": "c", "p": 9, "h": 0, "c": 0}
]

if __name__ == "__main__":

    chS = input("Digitare indirizzo sorgente (a,b,c): ")
    chD = input("\nDigitare indirizzo destinazione (a,b,c): ")
    h = -1 #hop rimanenti
    r = 1  #parte sempre da R1
    szHops = "" #stringa che tiene traccia del percorso
    szHops += f"{chS} " #aggiungo l'indirizzo sorgente al percorso

    #continuo finchè hop == 0
    while(h):
        #reset porta di uscita e hop
        p = -1
        h = -1
        szHops += f"R{r} " #aggiungo il router corrente al percorso

        #seleziona la TDI
        if r == 1:
            tdi = tdiR1
        elif r == 2:
            tdi = tdiR2
        elif r == 3:
            tdi = tdiR3

        #cerco nella TDI gli hop e le porte di uscita
        for i in tdi:
            if chD == i["add"]:
                h = i["h"]
                p = i["p"]
                break
        #Se mancano ancora hop, mi sposto sul prossimo router 
        if h>0:
            for j in range(len(linkrouter)):
                if (linkrouter[j]["ra"][1] == str(r)) and (linkrouter[j]["p"] == p):
                    r = int(linkrouter[j]["rb"][1])
                    break
        #Altrimenti:
        #Mancano 0 hop quindi sono arrivato a destinazione e aggiungo l'indirizzo finale
        #Non è strada trovata la destinazione nella TDI
        else:
            if h==0: szHops += f"{chD}"
            else:
                print("\nImpossibile instradare")
                exit()

    #stampa finale del percorso
    print(f"\nPercorso: {szHops}")




    