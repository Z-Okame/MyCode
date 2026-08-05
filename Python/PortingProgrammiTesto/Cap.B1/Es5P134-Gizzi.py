Ipp = [
    {"id1" : 10, "id2" : 0, "netmasklen" : 8},
    {"id1" : 172, "id2" : 16, "netmasklen" : 16},
    {"id1" : 192, "id2" : 168, "netmasklen" : 24}   
]

if __name__ == "__main__":
    a = 192
    b = 168
    c = 0
    d = 0
    subnetmask = 26

    idx = -1

    for i, ip in enumerate(Ipp):
        if a == ip["id1"]: idx = i
    if idx == -1: exit(1)

    subnetlen = subnetmask - Ipp[idx]["netmasklen"]
    if subnetmask < Ipp[idx]["netmasklen"]: exit(2)

    hostlen = 32 - subnetmask
    subnetid = 1 << subnetlen
    szBin = f"{subnetid-1:0{subnetlen}b}"

    print(f"Rete privata del gruppo {Ipp[idx]["id1"]}.{Ipp[idx]["id2"]}.0.0 (netmask /{Ipp[idx]["netmasklen"]})\n")
    print(f"Subnet Mask /{subnetmask}, {szBin}")
    print(f"Subnet disponibili:\n")

    for i in range(subnetid):
        u = i << hostlen

        if idx == 0:
            print(f"{Ipp[idx]["id1"]}.{(u & 0x00ff0000)>>16}.{(u & 0x0000ff00)>>8}.{u & 0x000000ff}")
        elif idx == 1:
            print(f"{Ipp[idx]["id1"]}.{Ipp[idx]["id2"]}.{(u & 0x0000ff00)>>8}.{u & 0x000000ff}")
        elif idx == 2:
            print(f"{Ipp[idx]["id1"]}.{Ipp[idx]["id2"]}.{Ipp[idx]["id2"]}.{u & 0x000000ff}")

    exit(0)