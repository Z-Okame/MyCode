import random

class Game:
    def __init__(self,lista_personaggi,lista_domande,numero_domanda):
        self.lista_personaggi = lista_personaggi
        self.lista_domande = lista_domande
        self.numero_domanda = numero_domanda
        
        
    #metodi
    def scegli_personaggio(self):
        self.personaggio_segreto = random.choice(self.lista_personaggi)
        
    def check_answer(self, question):
        valore_personaggio = getattr(self.personaggio_segreto, question.attributo)
        if question.controlla(valore_personaggio):
            print("Risposta: Sì")
        else:
            print("Risposta: No")

    def guess_personaggio(self):
        print("Chi pensi che sia?")
        risposta = input("> ")
        return risposta.lower() == self.personaggio_segreto.nome.lower()


    def next_question(self):
        #debug
        print(f"Personaggio segreto: {self.personaggio_segreto.nome}")
        verifica = False
        attributi = []
        domande = []
        self.numero_domanda = 0
        print("Scegli una domanda (0 per indovinare)")
        while self.numero_domanda < 3:
            r = random.choice(self.lista_domande)
            if (r.attributo not in attributi):
                domande.append(r)
                attributi.append(r.attributo)
                self.numero_domanda += 1
                print(f"{self.numero_domanda}. {r.testo}")
                
        ans = int(input("> "))
        if (ans < 0 or ans > 3):
            print("Scelta non valida!")
            return False

        if (ans == 0):
            verifica = self.guess_personaggio()
        else:
            self.check_answer(domande[ans-1])

        return verifica
    


    def play(self):
        var = True
        self.scegli_personaggio()
        while(var):
            if self.next_question():
                var = False

        

        
            