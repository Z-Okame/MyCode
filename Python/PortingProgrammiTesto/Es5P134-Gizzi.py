#Gizzi Manuel
#Programma che: dato un indirizzo IP privato e una subnet mask in formato
#CIDR calcola e stampa tutte le subnet disponibili

#Uso un dizionario per simulare la struct
Ipp = [
    {"id1" : 10, "id2" : 0, "netmasklen" : 8}, #Classe A
    {"id1" : 172, "id2" : 16, "netmasklen" : 16}, #Classe B
    {"id1" : 192, "id2" : 168, "netmasklen" : 24}   #Classe C
]

if __name__ == "__main__":
    #Indirizzo IP da subnettare
    a = 192
    b = 168
    c = 0
    d = 0
    subnetmask = 26 #subnet mask da applicare

    idx = -1

    #cerco la classe a cui appartiene l'indirizzo confrontando il primo ottetto con id1 di ogni classe
    for i, ip in enumerate(Ipp):
        if a == ip["id1"]: idx = i
    if idx == -1: exit(1)


    #calcolo quanti bit sono dedicati alla subnet
    subnetlen = subnetmask - Ipp[idx]["netmasklen"]
    if subnetmask < Ipp[idx]["netmasklen"]: exit(2)

    #calcolo i bit rimanenti per gli host
    hostlen = 32 - subnetmask
    #numero di subnet disponibili
    subnetid = 1 << subnetlen
    #rappresentazione in binario del numero di subnet disponibili
    szBin = f"{subnetid-1:0{subnetlen}b}"


    print(f"Rete privata del gruppo {Ipp[idx]["id1"]}.{Ipp[idx]["id2"]}.0.0 (netmask /{Ipp[idx]["netmasklen"]})\n")
    print(f"Subnet Mask /{subnetmask}, {szBin}")
    print(f"Subnet disponibili:\n")

    #per ogni subnet calcolo   estamp l'indirizzo di rete
    for i in range(subnetid):
        #shifto i di hostlen volte a sinistra per ottenere l'indirizzo della subnet
        u = i << hostlen

        #In base alla classe ottengo gli ottetti corretti tramite and e shift
        if idx == 0:
            print(f"{Ipp[idx]["id1"]}.{(u & 0x00ff0000)>>16}.{(u & 0x0000ff00)>>8}.{u & 0x000000ff}")
        elif idx == 1:
            print(f"{Ipp[idx]["id1"]}.{Ipp[idx]["id2"]}.{(u & 0x0000ff00)>>8}.{u & 0x000000ff}")
        elif idx == 2:
            print(f"{Ipp[idx]["id1"]}.{Ipp[idx]["id2"]}.{Ipp[idx]["id2"]}.{u & 0x000000ff}")

    exit(0)