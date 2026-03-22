from data import dati_personaggi, dati_domande
from Personaggio import Personaggio
from Domanda import Domanda
from Game import Game

#List comprehension per fare le liste di oggetti Personaggio e Domanda
personaggi_list = [Personaggio(i["nome"], i["professione"], i["nazionalita"], i["epoca"], i["genere"]) for i in dati_personaggi]
dati_domande = [Domanda(i["testo"], i["attributo"], i["valore_atteso"]) for i in dati_domande]
#inizializzo game
game = Game(personaggi_list, dati_domande, 0)
#chiamo la funzione di gioco
game.play()
#Stampa di conferma della vittoria
print("Hai indovinato!")

