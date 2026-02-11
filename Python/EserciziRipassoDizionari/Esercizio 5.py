#Lista di dizionari
books = [
    {"title": "1984", "author": "Orwell", "year": 1949},
    {"title": "Dune", "author": "Herbert", "year": 1965},
    {"title": "Foundation", "author": "Asimov", "year": 1951}   
]

for diz in books:
    print(diz["title"])
    
for diz in books:
    if diz["year"] < 1960:
        print(diz["title"])

titolo = input("Inserisci un titolo: ")

for diz in books:
    if diz["title"].lower() == titolo.lower():
        print("Trovato! Autore: " + diz["author"])

        
