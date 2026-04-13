from MediaItem import MediaItem
from Prestabile import Prestabile

class EBook(MediaItem, Prestabile):
    def __init__(self, titolo, anno,formato, dimensione_mb):
        super().__init__(titolo, anno)
        self.formato = formato
        self.dimensione_mb = dimensione_mb
        self.num = 0

    def prestito(self):
        if self.disponibile:
            self.disponibile = False
            self.num += 1
        else:
            print("AVVISO: EBook non disponibile per il prestito.")

    def restituzione(self):
        if not self.disponibile:
            self.disponibile = True
        else:
            print("AVVISO: EBook non attualmente in prestito.")

    def descrivi(self):
        super().descrivi()
        print(f"Formato: {self.formato} - Dimensione: {self.dimensione_mb} MB")

    def statistiche(self):
        print(f"EBook: {self.titolo} prestato {self.num} volte")

    def __str__(self):
        return super().__str__() + f" - Formato: {self.formato}, Dimensione: {self.dimensione_mb} MB"