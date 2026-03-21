from data import dati_personaggi, dati_domande
from Personaggio import Personaggio
from Domanda import Domanda
from Game import Game


personaggi_list = [Personaggio(i["nome"], i["professione"], i["nazionalita"], i["epoca"], i["genere"]) for i in dati_personaggi]
dati_domande = [Domanda(i["testo"], i["attributo"], i["valore_atteso"]) for i in dati_domande]
game = Game(personaggi_list, dati_domande, 0)
game.play()
print("Hai indovinato!")

