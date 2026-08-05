classiIp = [
    {"mask" : 0x80, "leading" : 0x00, "netmask" : 0xff000000},
    {"mask" : 0xc0, "leading" : 0x80, "netmask" : 0xffff0000},
    {"mask" : 0xe0, "leading" : 0xc0, "netmask" : 0xffffff00}
]

if __name__ == "__main__":

    i = 0

    Ip = [
    {"a": 10,  "b": 1,   "c": 0,   "d": 3,  "ip": 0, "netid": 0},
    {"a": 192, "b": 168, "c": 0,   "d": 1,  "ip": 0, "netid": 0},
    {"a": 137, "b": 168, "c": 0,   "d": 1,  "ip": 0, "netid": 0},
    {"a": 137, "b": 168, "c": 249, "d": 17, "ip": 0, "netid": 0}
    ]

    for i in Ip:
        for j in range(3):
            i["ip"] = i["a"]*0x1000000 + i["b"]*0x10000 + i["c"]*0x100 + i["d"]
            if (i["a"] & classiIp[j]["mask"]) == classiIp[j]["leading"]:
                i["netid"] = i["ip"] & classiIp[j]["netmask"]
                print(f"\n{i['a']:3d}.{i['b']:3d}.{i['c']:3d}.{i['d']:3d}")
                print(f"classe {chr(ord('A')+j)} (mask: {hex(classiIp[j]["netmask"])}, {hex(i["netid"])})")


    for i in range (3):
        for j in range(i+1,4):
            if Ip[i]["netid"] == Ip[j]["netid"]:
                print(f"\n{Ip[i]["a"]}.{Ip[i]["b"]}.{Ip[i]["c"]}.{Ip[i]["d"]}. e {Ip[j]["a"]},{Ip[j]["b"]},{Ip[j]["c"]},{Ip[j]["d"]} stessa rete")
