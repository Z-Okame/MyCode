from abc import ABC, abstractmethod

class MediaItem(ABC):
    def __init__(self, titolo, anno):
        self.titolo = titolo
        self.anno = anno
        self.disponibile = True

    @abstractmethod
    def prestito(self):
        pass

    @abstractmethod
    def restituzione(self):
        pass

    def descrivi(self):
        print(f"[{self.anno}] {self.titolo} -- Disponibile: {('SI') if self.disponibile else 'NO'}")

    def __str__(self):
        return f"MediaItem: {self.titolo} ({self.anno})"