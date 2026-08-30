#Gizzi Manuel
#programma che: digitati due numeri indicanti il router di partenza e il router di arrivo,
#stampa il percorso dell'ipotetico pacchetto

#Utilizzo un dizionario per simulare la struct
# "ra" = router A, "rb" = router B, "p" = porta
linkrouter = [
    {"ra": "R1", "rb": "R2", "p": 2},
    {"ra": "R2", "rb": "R1", "p": 4},
    {"ra": "R2", "rb": "R3", "p": 2},
    {"ra": "R3", "rb": "R2", "p": 5},
    {"ra": "R3", "rb": "R4", "p": 3},
    {"ra": "R4", "rb": "R3", "p": 1}
]

if __name__ == "__main__":
    szHops = "" #stringa che tiene traccia del percorso

    chS = input("Digitare router sorgente (1..4): ")
    chD = input("\nDigitare router destinazione (1..4)")
    rm = int(chS) #router sorgente
    rd = int(chD) #router destinazione
    r = -1 #router precedente


    szHops += f"R{rm} "  

    #continua finchè non arriva a destinazione
    #szHops simula il TTL
    while((rm != rd) and (len(szHops)<70)):
        ok = -1
        #ricerca un link valido
        for i in range(len(linkrouter)):
            if (linkrouter[i]["ra"][1] == str(rm)):
                ok = i #link trovato

                #Se non torna dal router di partenza
                if linkrouter[i]["rb"][1] != str(r) :
                    #link valido e salva il router attuale come precendente
                    ok = -2
                    r = rm
                    #vado al router successivo
                    rm = int(linkrouter[i]["rb"][1])
                    break
        #prendo il link che mi fa tornare indietro        
        if (ok >= 0):
            r = rm
            rm = int(linkrouter[ok]["rb"][1])
        #nessun link trovato
        if (ok == -1):
            print("\nImpossibile Instradare")
            exit()
        
        szHops += f"R{rm} " #aggiungo il nuovo router al percorso
        print(f"\nTratta: {szHops}") #stampa del percorso

    #verifico se sono arrivato a destinazione, o se è scaduto il TTL
    if (rm == rd):
        print("ok")
    else:
        print("\nErrore TTL!")
    