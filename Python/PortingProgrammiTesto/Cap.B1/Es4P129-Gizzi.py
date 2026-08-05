def DottedToDecimal(a, b, c, d):
    return a*0x1000000 + b*0x10000 + c*0x100 + d

tdiHost = [
    {
        "Ia": 0, "Ib": 0, "Ic": 0, "Id": 0,
        "Ma": 0, "Mb": 0, "Mc": 0, "Md": 0,
        "Ga": 196, "Gb": 13, "Gc": 1, "Gd": 254,
        "Ua": 196, "Ub": 13, "Uc": 1, "Ud": 1
    },
    {
        "Ia": 196, "Ib": 13, "Ic": 1, "Id": 0,
        "Ma": 255, "Mb": 255, "Mc": 255, "Md": 0,
        "Ga": 196, "Gb": 13, "Gc": 1, "Gd": 1,
        "Ua": 196, "Ub": 13, "Uc": 1, "Ud": 1
    },
]

if __name__ == "__main__":
    print("Indirizzo\tMask\t\tGateway\t\tUse\n")
    for i in tdiHost:
        print(f"{i["Ia"],i["Ib"],i["Ic"],i["Id"]}\t{i["Ma"],i["Mb"],i["Mc"],i["Md"]}\t{i["Ga"],i["Gb"],i["Gc"],i["Gd"]}\t{i["Ua"],i["Ub"],i["Uc"],i["Ud"]}")

    a=196 
    b=13 
    c=2 
    d=5

    for i in range(len(tdiHost)):
        print(f"Regola n.{i+1} per {a,b,c,d}")
        u = DottedToDecimal(tdiHost[i]["Ma"], tdiHost[i]["Mb"], tdiHost[i]["Mc"], tdiHost[i]["Md"])
        u = u & DottedToDecimal(a,b,c,d)

        if u == DottedToDecimal(tdiHost[i]["Ia"],tdiHost[i]["Ib"],tdiHost[i]["Ic"],tdiHost[i]["Id"]):
            print(" vera.\n")
        else:
            print(" falsa.\n")