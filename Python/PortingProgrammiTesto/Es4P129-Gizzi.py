#Gizzi Manuel
#Programma che: data una TDI di un host realizza l'instradamento 
#di un pacchetto ad un determinato indirizzo

#funzione per convertire un indirizzo IP da dotted a decimale
def DottedToDecimal(a, b, c, d):
    return a*0x1000000 + b*0x10000 + c*0x100 + d

#uso un dizionario per simulare le struct
tdiHost = [
    {
        "Ia": 0, "Ib": 0, "Ic": 0, "Id": 0, #Indirizzo
        "Ma": 0, "Mb": 0, "Mc": 0, "Md": 0, #Mask
        "Ga": 196, "Gb": 13, "Gc": 1, "Gd": 254, #Gateway
        "Ua": 196, "Ub": 13, "Uc": 1, "Ud": 1    #Use
    },
    {
        "Ia": 196, "Ib": 13, "Ic": 1, "Id": 0,
        "Ma": 255, "Mb": 255, "Mc": 255, "Md": 0,
        "Ga": 196, "Gb": 13, "Gc": 1, "Gd": 1,
        "Ua": 196, "Ub": 13, "Uc": 1, "Ud": 1
    },
]


if __name__ == "__main__":

    #stampa della TDI
    print("Indirizzo\tMask\t\tGateway\t\tUse\n")
    for i in tdiHost:
        print(f"{i["Ia"],i["Ib"],i["Ic"],i["Id"]}\t{i["Ma"],i["Mb"],i["Mc"],i["Md"]}\t{i["Ga"],i["Gb"],i["Gc"],i["Gd"]}\t{i["Ua"],i["Ub"],i["Uc"],i["Ud"]}")

    #indirizzo IP da instradare
    a=196 
    b=13 
    c=2 
    d=5

    #
    for i in range(len(tdiHost)):
        print(f"Regola n.{i+1} per {a,b,c,d}")
        #Applico la maschera all'indirizzo da instradare
        u = DottedToDecimal(tdiHost[i]["Ma"], tdiHost[i]["Mb"], tdiHost[i]["Mc"], tdiHost[i]["Md"])
        u = u & DottedToDecimal(a,b,c,d)

        #Se il risultato coincide con l'indirizzo di rete, la regola è vera
        if u == DottedToDecimal(tdiHost[i]["Ia"],tdiHost[i]["Ib"],tdiHost[i]["Ic"],tdiHost[i]["Id"]):
            print(" vera.\n")
        else:
            print(" falsa.\n")