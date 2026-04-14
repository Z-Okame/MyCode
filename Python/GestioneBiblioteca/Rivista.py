from MediaItem import MediaItem

class Rivista(MediaItem):
    def __init__(self, titolo, anno, mese, numero):
        super().__init__(titolo, anno)
        self.mese = mese
        self.numero = numero

    def prestito(self):
        if self.disponibile:
            self.disponibile = False
        else:
            print(f"AVVISO: La rivista n: {self.numero} del mese {self.mese} non è disponibile per il prestito.")

    def restituzione(self):
        if not self.disponibile:
            self.disponibile = True
        else:
            print("AVVISO: La rivista non è stata prenotata.")

    def descrivi(self):
        super().descrivi()
        print(f"Mese: {self.mese} - Numero: {self.numero}")

    def __str__(self):
        return super().__str__() + f" - Mese: {self.mese}, Numero: {self.numero}"