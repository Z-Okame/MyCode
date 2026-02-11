#Conteggio con dizionari
parola = input("Inserisci una parola: ")
caratteri = {}

for c in parola:
    if c in caratteri:
        caratteri[c]=caratteri[c]+1
    else:
        caratteri[c]=1

print(caratteri)

