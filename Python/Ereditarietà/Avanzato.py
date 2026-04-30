class Lettore():
    def descrizione(self):
        return "Lettore"
#--------------------------
class Scrittore():
    def descrizione(self):
        return "Scrittore"
#--------------------------
class Amministratore(Lettore,Scrittore):
    def mostra_permessi(self):
        return Amministratore.__mro__
        

amministratore = Amministratore()
print(amministratore.mostra_permessi())

