#Al posto della struct utilizzo un dizionario
linkrouter = [
    {"ra": "R1", "rb": "R2", "p": 2},
    {"ra": "R2", "rb": "R1", "p": 4},
    {"ra": "R2", "rb": "R3", "p": 2},
    {"ra": "R3", "rb": "R2", "p": 5},
    {"ra": "R3", "rb": "R4", "p": 3},
    {"ra": "R4", "rb": "R3", "p": 1}
]

if __name__ == "__main__":
    szHops = ""

    chS = input("Digitare router sorgente (1..4): ")
    chD = input("\nDigitare router destinazione (1..4)")

    rm = int(chS)
    rd = int(chD)
    r = -1
    szHops += f"R{rm} "  

    while((rm != rd) and (len(szHops)<70)):
        ok = -1
        for i in range(len(linkrouter)):
            if (linkrouter[i]["ra"][1] == str(rm)):
                ok = i
                if linkrouter[i]["rb"][1] != str(r) :
                    ok = -2
                    r = rm
                    rm = int(linkrouter[i]["rb"][1])
                    break
        if (ok >= 0):
            r = rm
            rm = int(linkrouter[ok]["rb"][1])
        if (ok == -1):
            print("\nImpossibile Instradare")
            exit()
            
        szHops += f"R{rm} "
        print(f"\nTratta: {szHops}")

    if (rm == rd):
        print("ok")
    else:
        print("\nErrore TTL!")
    