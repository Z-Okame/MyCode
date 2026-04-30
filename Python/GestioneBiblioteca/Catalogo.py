from Libro import Libro
from Rivista import Rivista
from DVD import DVD

class Catalogo():
    def __init__(self):
        self.articoli = []

    def aggiungi(self, item):
        self.articoli.append(item)

    def stampa_catalogo(self):
        for item in self.articoli:
            print(item)
    
    def disponibili(self):
        disponibili = []
        for item in self.articoli:
            if item.disponibile:
                disponibili.append(item)
        return disponibili
    
    def cerca_per_tipo(self, tipo):
        risultati = []
        for item in self.articoli:
            if isinstance(item, tipo):
                risultati.append(item)
        return risultati
    
    def report(self):
        print("Report Catalogo:")
        print(f"Numero totale di articoli: {len(self.articoli)}")
        print(f"Numero di articoli disponibili: {len(self.disponibili())}")
        print(f"Numero di articoli in prestito: {len(self.articoli) - len(self.disponibili())}")
        print(f"Numero di articoli Libri: {len(self.cerca_per_tipo(Libro))}")
        print(f"Numero di articoli Riviste: {len(self.cerca_per_tipo(Rivista))}")
        print(f"Numero di articoli DVD: {len(self.cerca_per_tipo(DVD))}")