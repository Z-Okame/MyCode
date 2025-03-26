import datetime
import os

# Funzione per aggiungere una spesa
def aggiungi_spesa():
    utente = input("Inserisci il nome dell'utente: ")
    data = input("Inserisci la data (YYYY-MM-DD): ")
    categoria = input("Inserisci la categoria (es. Alimentari, Trasporti): ")
    importo = input("Inserisci l'importo speso: ")
    descrizione = input("Inserisci una descrizione: ")

    with open("expenses.txt", "a") as file:
        file.write(f"{utente}, {data}, {categoria}, {importo}, \"{descrizione}\"\n")

    print("\n✅ Spesa aggiunta con successo!\n")

# Funzione per visualizzare tutte le spese
def mostra_spese():
    try:
        with open("expenses.txt", "r") as file:
            spese = file.readlines()
        if not spese:
            print("\n📭 Nessuna spesa registrata.\n")
        else:
            for spesa in spese:
                print(spesa.strip())
    except FileNotFoundError:
        print("\n📂 Nessun file di spese trovato.\n")

# Funzione per calcolare il totale delle spese
def calcola_totale():
    try:
        with open("expenses.txt", "r") as file:
            totale = sum(float(line.split(",")[3]) for line in file)
        print(f"\n💰 Totale spese: {totale:.2f} €\n")
    except (FileNotFoundError, IndexError, ValueError):
        print("\n❌ Errore nel calcolo delle spese.\n")

# Funzione per eliminare una spesa tramite la data
def elimina_spesa():
    data = input("Inserisci la data della spesa da eliminare (YYYY-MM-DD): ")
    try:
        with open("expenses.txt", "r") as file:
            spese = file.readlines()
        with open("expenses.txt", "w") as file:
            spese_eliminate = 0
            for spesa in spese:
                if spesa.split(",")[1] != data:
                    file.write(spesa)
                else:
                    spese_eliminate += 1
        if spese_eliminate > 0:
            print(f"\n✅ {spese_eliminate} spesa/e eliminata/e con successo!\n")
        else:
            print("\n📭 Nessuna spesa trovata per la data specificata.\n")
    except FileNotFoundError:
        print("\n📂 Nessun file di spese trovato.\n")

# Funzione per filtrare le spese per nome o data
def filtra_spese():
    criterio = input("Vuoi filtrare per nome o per data? (nome/data): ").strip().lower()
    valore = input(f"Inserisci il {criterio} da filtrare: ").strip()
    try:
        with open("expenses.txt", "r") as file:
            spese = file.readlines()
        spese_filtrate = [spesa for spesa in spese if valore in spesa.split(",")[0 if criterio == "nome" else 1]]
        if spese_filtrate:
            for spesa in spese_filtrate:
                print(spesa.strip())
        else:
            print(f"\n📭 Nessuna spesa trovata per il {criterio} specificato.\n")
    except FileNotFoundError:
        print("\n📂 Nessun file di spese trovato.\n")

# Menu principale
def menu():
    while True:
        print("\n💵 GESTORE SPESE\n")
        print("1. Aggiungi spesa")
        print("2. Mostra spese")
        print("3. Calcola totale")
        print("4. Elimina spesa")
        print("5. Filtra spese")
        print("6. Esci\n")

        scelta = input("Scegli un'opzione: ")
        if scelta == "1":
            aggiungi_spesa()
        elif scelta == "2":
            mostra_spese()
        elif scelta == "3":
            calcola_totale()
        elif scelta == "4":
            elimina_spesa()
        elif scelta == "5":
            filtra_spese()
        elif scelta == "6":
            print("\n👋 Uscita...\n")
            break
        else:
            print("\n❌ Scelta non valida. Riprova.\n")

# Avvio del programma
menu()
