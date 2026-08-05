#Al posto della struct utilizzo un dizionario
linkrouter = [
    {"ra": "R1", "rb": "R2", "p": 2},
    {"ra": "R2", "rb": "R1", "p": 4},
    {"ra": "R2", "rb": "R3", "p": 2},
    {"ra": "R3", "rb": "R2", "p": 5},
    {"ra": "R3", "rb": "R4", "p": 3},
    {"ra": "R4", "rb": "R3", "p": 1}
]

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
    h = -1
    r = 1
    szHops = ""
    szHops += f"{chS} "

    while(h):
        p = -1
        h = -1
        szHops += f"R{r} "

        if r == 1:
            tdi = tdiR1
        elif r == 2:
            tdi = tdiR2
        elif r == 3:
            tdi = tdiR3

        for i in tdi:
            if chD == i["add"]:
                h = i["h"]
                p = i["p"]
                break
        if h>0:
            for j in range(len(linkrouter)):
                if (linkrouter[j]["ra"][1] == str(r)) and (linkrouter[j]["p"] == p):
                    r = int(linkrouter[j]["rb"][1])
                    break
        else:
            if h==0: szHops += f"{chD}"
            else:
                print("\nImpossibile instradare")
                exit()

    print(f"\nPercorso: {szHops}")




    