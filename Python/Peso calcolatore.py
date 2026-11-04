# YEY PESO CALCOLATOREEEE

program_on = True
 
#Importo il tempo 
import time 


while program_on:

    peso = float(input('Ciao! Insersci il tuo peso nel superconvertitore kg into lb o viceversa!!!\nInserisci: '))
    u_misura = str(input('Kilogrammi o Libbre? (K o L): ')).upper()

    if u_misura == "K":
        peso = peso * 2.205
        u_misura = "Lb."
        print(f'Il tuo peso è: {round(peso, 1)} {u_misura}')
        time.sleep(1)
        end = str(input("Seleziona [Y/N] per continuare o uscire: ")).upper()
        if end == "N":
            program_on = False
    elif u_misura == "L":
        peso = peso / 2.205
        u_misura = "Kg."
        print(f'Il tuo peso è: {round(peso, 1)} {u_misura}')
        time.sleep(1)
        end = str(input("Seleziona [Y/N] per continuare o uscire: ")).upper()
        if end == "N":
            program_on = False
    else:
        print(f'{u_misura} non è compatibile, sparati')
        time.sleep(1)
        print('Rimuovendo ./system32/...')
        time.sleep(2)
        program_on = False