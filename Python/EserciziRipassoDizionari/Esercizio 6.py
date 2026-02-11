#Dizionario come archivio

Rubrica = {}
play = True

while(play):
    scelta=int(input("Piccola Rubrica : seleziona un opzione\n 1. Aggiungi contatto\n 2. Cerca un numero\n 3. Visualizza tutti i contatti\n 0. Esci\n > "))
    if scelta == 0:
        print("\nBye byee :(\n")
        play = False
    elif scelta == 1:
        nome=input("Nome del contatto: ")
        numero=input("Numero del contatto: ")
        Rubrica[nome]=numero
    elif scelta == 2:
        ricerca=input("Scrivi il nome del contatto: ")
        for i in Rubrica:
            if i == ricerca:
                print(f"Contatto trovato, numero: {Rubrica[i]}")
    elif scelta == 3:
        for i in Rubrica:
            print(f"\n{i} : ", Rubrica[i])
    
        