from MediaItem import MediaItem

class DVD(MediaItem):
    def __init__(self, titolo, anno, regista, durata):
        super().__init__(titolo, anno)
        self.regista = regista
        self.durata = durata

    def prestito(self):
        if self.disponibile:
            self.disponibile = False
        else:
            print(f"AVVISO: Il DVD '{self.titolo}' di {self.regista} non è disponibile per il prestito.")

    def restituzione(self):
        if not self.disponibile:
            self.disponibile = True
        else:
            print("AVVISO: Il DVD non è stato prenotato.")

    def descrivi(self):
        super().descrivi()
        print(f"Regista: {self.regista} - Durata: {self.durata} minuti")

    def __str__(self):
        return super().__str__() + f" - Regista: {self.regista}, Durata: {self.durata} minuti"