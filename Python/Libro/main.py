from Libro import Libro
from Libreria import Libreria
Libro = Libro("Le barzellette di Totti", "Francesco Totti", 100)


L = Libreria()

L.addLibro(Libro)
print(L.mostraTitolo())