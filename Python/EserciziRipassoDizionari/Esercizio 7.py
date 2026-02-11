#Dizionari annidati

school = {
    "Luca": {"math": 8, "english": 7},
    "Anna": {"math": 9, "english": 8},
    "Marco": {"math": 6, "english": 7}
}

print("\nVoti di Anna:")
for i in school["Anna"]:
    print(school["Anna"][i])
    
print("\nVoto matematica di Marco: ")
print(school["Marco"]["math"])

high = 0

print("\nMedia degli studenti: ")
for studente in school:
    media = 0
    for i in school[studente]:
        media += school[studente][i]
    media = media/2
    
    if high < media:
        high = media
        sMax = studente

    print(f"Media di {studente} : {media}")
    
print(f"Studente dalla media più alta: {sMax} con media: {high}")