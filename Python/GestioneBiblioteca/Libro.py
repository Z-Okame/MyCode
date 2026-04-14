from MediaItem import MediaItem

class Libro(MediaItem):
    def __init__(self, titolo, anno, autore, pagine):
        super().__init__(titolo, anno)
        self.autore = autore
        self.pagine = pagine

    def prestito(self):
        if self.disponibile:
            self.disponibile = False
        else:
            print("AVVISO: Il libro non è disponibile per il prestito.")

    def restituzione(self):
        if not self.disponibile:
            self.disponibile = True
        else:
            print("AVVISO: Il libro non è stato prenotato.")

    def descrivi(self):
        super().descrivi()
        print(f"Autore: {self.autore} - Pagine: {self.pagine}")

    def __str__(self):
        return super().__str__() + f" - Autore: {self.autore}, Pagine: {self.pagine}"