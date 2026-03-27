class Libreria:
    def __init__(self):
        self.libri = []
        
    def addLibro(self,libro):
        if libro not in  self.libri:
            self.libri.append(libro)
        
    def rimuoviLibro(self,libro):
        if libro in self.libri:
            index = self.libri.index(libro)
            self.libri.pop(index)
        else: return "caco nel puzzo"
        
    def mostraTitolo(self):
        str = ""
        for libro in self.libri:
            str += libro.descrizione()
        
        return str
    
    def libriDisponibili(self):
        for libro in self.libri:
            if libro.disponibile:
                print(libro.descrizione())
    
    