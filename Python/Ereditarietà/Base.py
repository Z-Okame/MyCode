#---------------------------
class Veicolo():
    def __init__(self,marca, velocità_max):
        self.marca = marca
        self.velocità_max = velocità_max
        
    def descrivi(self):
        return "Veicolo"

#---------------------------
class Auto(Veicolo):
    def __init__(self, marca, velocità_max):
        super().__init__(marca, velocità_max)
        
    def descrivi(self):
        return "Auto"

#---------------------------
class Moto(Veicolo):
    def __init__(self, marca, velocità_max):
        super().__init__(marca, velocità_max)
        
    def descrivi(self):
        return "Moto"

#---------------------------
class Bicicletta(Veicolo):
    def __init__(self, marca, velocità_max):
        super().__init__(marca, velocità_max)
        
    def descrivi(self):
        return "Bicicletta"
    
auto = Auto("Ford", 200)
moto = Moto("Yamaha", 300)
bicicletta = Bicicletta("Giant", 50)

print(auto.descrivi())
print(moto.descrivi())
print(bicicletta.descrivi())