import random
from Domanda import Domanda

class Game:
    def __init__(self,lista_personaggi,lista_domande,numero_domanda):
        self.lista_personaggi = lista_personaggi
        self.lista_domande = lista_domande
        self.numero_domanda = numero_domanda
        
    #Metodo per scegliere un personaggio randomicamente
    def scegli_personaggio(self):
        self.personaggio_segreto = random.choice(self.lista_personaggi)
        
    #Il metodo controlla se la domanda scelta coincide con l'attributo del personaggio segreto
    #Stampa Sì o No in base al controllo
    def check_answer(self, question):
        valore_personaggio = getattr(self.personaggio_segreto, question.attributo)
        if question.controlla(valore_personaggio):
            print("Risposta: Sì")
        else:
            print("Risposta: No")

    # getattr è un metodo che cerca il nome dell'attributo sull'oggetto e restituisce il valore corrispondente
    # concettualmente fa questo:
    #
    # if question.attributo == "professione":
    #    valore_personaggio = self.personaggio_segreto.professione
    # elif question.attributo == "nazionalita":
    #    valore_personaggio = self.personaggio_segreto.nazionalita
    # elif question.attributo == "epoca":
    #    valore_personaggio = self.personaggio_segreto.epoca
    # elif question.attributo == "genere":
    #    valore_personaggio = self.personaggio_segreto.genere
    #
    # if question.controlla(valore_personaggio):
    #    print("Risposta: Sì")
    # else:
    #    print("Risposta: No") 

    #Il metodo controlla se la stringa del nome in input è uguale al nome del personaggio segreto.
    #ritorna True o False in base al controllo
    def guess_personaggio(self):
        print("Chi pensi che sia?")
        nome = input("> ")
        return nome.lower().strip() == self.personaggio_segreto.nome.lower().strip()

    #Metodo che stampa a schermo 3 domande e gestisce l'input della scelta da parte dell'utente
    #Ritorna False in caso l'input non è valido
    #Ritorna 1 se l'utente vuole indovinare
    #Ritorna la domanda scelta
    def next_question(self):
        domande = [] #lista di domande per evitare ripetizioni
        attributi = [] #lista di attributi per evitare ripetizioni
        self.numero_domanda = 0 #numero domanda

        print("\nScegli una domanda (0 per indovinare)")
        while self.numero_domanda < 3:
            r = random.choice(self.lista_domande)
            if (r.attributo not in attributi):
                domande.append(r)
                attributi.append(r.attributo)
                self.numero_domanda += 1
                print(f"{self.numero_domanda}. {r.testo}")
                
        ans = int(input("> "))
        #Se la risposta non è richiede  l'input
        while (ans < 0 or ans > 3): 
            print("Scelta non valida!")
            ans = int(input("> "))

        #Se l'utente sceglie 0, prova ad indovinare il personaggio
        #Se l'utente sceglie 1,2 o 3 ritorna la domanda scelta
        if (ans == 0):
            return 1
        else:
            return domande[ans-1]




    #Metodo che si occupa del flusso di gioco
    #var Fa andare avanti il gioco finchè il personaggio non viene indovinato
    #viene chiamata scegli_personaggio() per scegliere randomicamente il personaggio segreto
    #temp è una variabile temporanea che può avere 2 valori diversi:
    #Se è una domanda chiama check_answer(temp)
    #Altrimenti l'utente vuole indovinare e chiama guess_personaggio()
    #Se il controllo ritorna True, il gioco finisce.
    def play(self):
        var = True
        self.scegli_personaggio()
        while(var):
            temp = self.next_question()
            if isinstance(temp, Domanda):  # ha scelto una domanda
                self.check_answer(temp)
            else:                            # ha scelto 0 → indovina
                if self.guess_personaggio():
                    var = False

        

        
            