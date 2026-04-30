from Libro import Libro
from Rivista import Rivista
from DVD import DVD
from EBook import EBook
from Catalogo import Catalogo

libro = Libro("Il nome della rosa", 1980, "Umberto Eco", 512)
rivista = Rivista("Focus", 2024, "Aprile", 12)
dvd = DVD("Inception", 2010, "Christopher Nolan", 148)
ebook = EBook("Clean Code", 2008, "PDF", 3.5)

libro.descrivi()
rivista.descrivi()
dvd.descrivi()
ebook.descrivi()

catalogo = Catalogo()
catalogo.aggiungi(libro)
catalogo.aggiungi(rivista)
catalogo.aggiungi(dvd)
catalogo.aggiungi(ebook)

libro.prestito()
dvd.prestito()

catalogo.stampa_catalogo()
catalogo.report()

print(libro)
print(rivista)
print(dvd)
print(ebook)
