class Domanda:
    def __init__(self,testo,attributo,valore_atteso):
        self.testo = testo
        self.attributo = attributo
        self.valore_atteso = valore_atteso
        
    #metodo che controlla se l'attributo passato è uguale al valore atteso della domanda
    #ritorna True o False in base al controllo
    def controlla(self,valore_personaggio):
        return valore_personaggio == self.valore_atteso
    
    
    
    