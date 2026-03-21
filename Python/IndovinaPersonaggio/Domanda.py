class Domanda:
    def __init__(self,testo,attributo,valore_atteso):
        self.testo = testo
        self.attributo = attributo
        self.valore_atteso = valore_atteso
        
    #metodo controlla
    def controlla(self,personaggio):
        return personaggio == self.valore_atteso
    
    
    
    