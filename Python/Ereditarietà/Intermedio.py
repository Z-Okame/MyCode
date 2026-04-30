from abc import ABC, abstractmethod
#-------------------------------------------
class ContoBancario(ABC):
    def __init__(self,saldo):
        self.saldo = saldo
        
    @abstractmethod
    def deposita(self): pass

    @abstractmethod
    def preleva(self): pass

    @abstractmethod
    def saldo(self): pass

#-------------------------------------------
class ContoCorrente(ContoBancario):
    def __init__(self, saldo):
        super().__init__(saldo)
    
    def deposita(self, quantità):
        return self.saldo + quantità

    def preleva(self,quantità):
        return self.saldo - quantità

    def saldo(self):
        return self.saldo

#-------------------------------------------
class ContoRisparmio(ContoBancario):
    def __init__(self, saldo,prelievi_max):
        super().__init__(saldo)
        self.prelievi_max = prelievi_max
    
    def deposita(self,quantità):
        return self.saldo + quantità

    def preleva(self,quantità):
        if self.prelievi_max > 0:
            self.prelievi_max -= 1
            return self.saldo - quantità
        else:
            return "Impossibile prelevare"

    def saldo(self):
        return self.saldo


quantità = 20
conto_corrente = ContoCorrente(100)
conto_risparmio = ContoRisparmio(100, 3)

print(f"Deposita 50: {conto_corrente.deposita(50)}") 
print(f"Preleva 20: {conto_corrente.preleva(20)}") 
print(f"Saldo: {conto_corrente.saldo()}")

print(f"Deposita 50: {conto_risparmio.deposita(50)}") 
print(f"Preleva 20 (1/3): {conto_risparmio.preleva(20)}") 
print(f"Preleva 20 (2/3): {conto_risparmio.preleva(20)}") 
print(f"Preleva 20 (3/3): {conto_risparmio.preleva(20)}")  
print(f"Preleva 20 (4/3 - blocked): {conto_risparmio.preleva(20)}") 
print(f"Saldo: {conto_risparmio.saldo()}")          