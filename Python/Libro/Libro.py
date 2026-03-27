class Libro:
    def __init__(self,titolo,autore,pagine):
        self.titolo = titolo
        self.autore = autore
        self.pagine = pagine
        self.disponibile = True
        
    def descrizione(self):
        return "Libro - titolo: " + self.titolo + " autore: " + self.autore + " pagine: " + str(self.pagine) + " disponibile: " + str(self.disponibile) + "."
         
    def presta(self):
        self.disponibile = False
        
    def restituisci(self):
        self.disponibile = True
        