# Esercizio: Calcolatrice di base
# Scrivi una funzione chiamata `calcolatrice` che prenda tre argomenti: 
# un numero, un altro numero e un'operazione (sotto forma di stringa: "addizione", "sottrazione", "moltiplicazione", "divisione").
# La funzione deve restituire il risultato dell'operazione tra i due numeri.
# Assicurati di gestire i casi in cui l'operazione non è valida e la divisione per zero.

def calcolatrice(num1, num2, operazione):
    if operazione.lower() == "addizione":
        return num1 + num2
    elif operazione.lower() == "sottrazione":
        return num1 - num2
    elif operazione.lower() == "moltiplicazione":
        return num1 * num2
    elif operazione.lower() == "divisione":
        if num2 != 0:
            return num1 / num2
        else:
            return "Errore: divisione per zero"
    else:
        return "Operazione non valida"

num1 = float(input("Inserisci primo numero: "))
num2 = float(input("Inserisci secondo numero: "))
operazione = input("Inserisci operazione sotto forma di stringa: ")

result = calcolatrice(num1, num2, operazione)

print("Risultato: ", result)

# Esercizio: Calcolatrice avanzata
# Scrivi una funzione chiamata `calcolatrice_avanzata` che prenda tre argomenti: 
# un numero, un altro numero e un'operazione (sotto forma di stringa: "potenza", "modulo").
# La funzione deve restituire il risultato dell'operazione tra i due numeri.
# Assicurati di gestire i casi in cui l'operazione non è valida.

def calcolatrice_avanzata(num1, num2, operazione):
    if operazione.lower() == "potenza":
        return num1 ** num2
    elif operazione.lower() == "modulo":
        return num1 % num2
    else:
        return "Operazione non valida"

operazione_avanzata = input("Inserisci operazione avanzata sotto forma di stringa: ")

result_avanzato = calcolatrice_avanzata(num1, num2, operazione_avanzata)

print("Risultato avanzato: ", result_avanzato)


