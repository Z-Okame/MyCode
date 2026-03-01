from nazioni import countries
import random
 

def prendiDizionario():
    usato = []

    diz = random.choice(countries)
    while (diz in usato):
        diz = random.choice(countries)
        
    return diz
    
def domandaNazione():
    diz = prendiDizionario()
    print(f"di che Nazione è la capitale: {diz['capital']}.")
    
    risposte = []
    risposte.append(diz["name"])
    while len(risposte) < 4:
        ans = (random.choice(countries)["name"])
        if ans not in risposte:
            risposte.append(ans)
    
    random.shuffle(risposte)
    print(f"\n1. {risposte[0]}\n")
    print(f"\n2. {risposte[1]}\n")
    print(f"\n3. {risposte[2]}\n")
    print(f"\n4. {risposte[3]}\n")    
    
    choice = int(input("Inserisci il numero della risposta: "))
    while (choice > 4 or choice < 0):
        choice = int(input("Inserisci un numero valido"))
    
    if risposte[choice-1] == diz["name"]:
        return True
    
    return False
        
            
def domandaContinente():
    diz = prendiDizionario()
    print(f"di che Continente fa parte la seguente nazione: {diz['name']}.")
    
    risposte = []
    risposte.append(diz["continent"])
    
    while len(risposte) < 4:
        ans = (random.choice(countries)["continent"])
        if ans not in risposte:
            risposte.append(ans)
        
    random.shuffle(risposte)
    print(f"\n1. {risposte[0]}\n")
    print(f"\n2. {risposte[1]}\n")
    print(f"\n3. {risposte[2]}\n")
    print(f"\n4. {risposte[3]}\n")    
    
    choice = int(input("Inserisci il numero della risposta: "))
    while (choice > 4 or choice < 0):
        choice = int(input("Inserisci un numero valido"))
    
    if risposte[choice-1] == diz["continent"]:
        return True
    
    return False
    
def domandaCapitale():
    diz = prendiDizionario()
    print(f"Qual'è la capitale della nazione: {diz['name']}.")
    
    risposte = []
    risposte.append(diz["capital"])
    
    while len(risposte) < 4:
        ans = (random.choice(countries)["capital"])
        if ans not in risposte:
            risposte.append(ans)
    
    random.shuffle(risposte)
    print(f"\n1. {risposte[0]}\n")
    print(f"\n2. {risposte[1]}\n")
    print(f"\n3. {risposte[2]}\n")
    print(f"\n4. {risposte[3]}\n")    
    
    choice = int(input("Inserisci il numero della risposta: "))
    while (choice > 4 or choice < 0):
        choice = int(input("Inserisci un numero valido"))
    
    if risposte[choice-1] == diz["capital"]:
        return True
    
    return False

def game():
    punti = 0
    play = True
   
    print("\n===========================================")
    print("\n=====BENVENUTO NEL GIOCO DELLE NAZIONI=====")
    print("\n===========================================")
    print("\n   Ad ogni risposta corretta fai 1 punto!  ")
    print("\n       Se sbagli finisce il gioco!         ")
    print("================DIVERTITI.===================")
        
    while(play): 
        
        num = random.randint(1, 3)
        
        if num == 1:
            if domandaNazione():
                punti += 1
            else:
                play = False
        elif num == 2:
            if domandaCapitale():
                punti += 1
            else:
                play = False
        else:
            if domandaContinente():
                punti += 1
            else:
                play = False
                
     
    print(f"\nNOO HAI PERSO!! Score:{punti}")
    return
    


game()


        
        
        
    
    
