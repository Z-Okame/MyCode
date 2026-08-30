#Gizzi Manuel
#Programma che: dati i seguenti indirizzi IP verifica l'appartenenza alla stessa rete

#Utilizzo un dizionario per simulare la struct
classiIp = [
    {"mask" : 0x80, "leading" : 0x00, "netmask" : 0xff000000},
    {"mask" : 0xc0, "leading" : 0x80, "netmask" : 0xffff0000},
    {"mask" : 0xe0, "leading" : 0xc0, "netmask" : 0xffffff00}
]

if __name__ == "__main__":

    i = 0

    #4 indirizzi da analizzare
    Ip = [
    {"a": 10,  "b": 1,   "c": 0,   "d": 3,  "ip": 0, "netid": 0},
    {"a": 192, "b": 168, "c": 0,   "d": 1,  "ip": 0, "netid": 0},
    {"a": 137, "b": 168, "c": 0,   "d": 1,  "ip": 0, "netid": 0},
    {"a": 137, "b": 168, "c": 249, "d": 17, "ip": 0, "netid": 0}
    ]

    #Per ogni IP determino la classe e calcolo il NetID
    for i in Ip:
        for j in range(3):
            #converto l'indirizzo ad intero
            i["ip"] = i["a"]*0x1000000 + i["b"]*0x10000 + i["c"]*0x100 + i["d"]
            #faccio il mascheramento del primo ottetto e determino a che classe appartiene
            if (i["a"] & classiIp[j]["mask"]) == classiIp[j]["leading"]:
                #determino il netid facendo il mascheramento con la netmask
                i["netid"] = i["ip"] & classiIp[j]["netmask"]
                #stampa dell'IP, maschera e netid
                print(f"\n{i['a']:3d}.{i['b']:3d}.{i['c']:3d}.{i['d']:3d}")
                print(f"classe {chr(ord('A')+j)} (mask: {hex(classiIp[j]["netmask"])}, netId:{hex(i["netid"])})")


    #Confronto le coppie di indirizzi per verificare quali hanno stesso netid, quindi sono nella stessa rete
    for i in range (3):
        #parte da i+1 per evitare confronti doppi
        for j in range(i+1,4):
            if Ip[i]["netid"] == Ip[j]["netid"]:
                print(f"\n{Ip[i]["a"]}.{Ip[i]["b"]}.{Ip[i]["c"]}.{Ip[i]["d"]}. e {Ip[j]["a"]},{Ip[j]["b"]},{Ip[j]["c"]},{Ip[j]["d"]} stessa rete")
