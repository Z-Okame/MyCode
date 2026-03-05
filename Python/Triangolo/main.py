from Triangolo import Triangolo
from Punto import Punto

a = Punto(2, 3.5)
b = Punto(4, 5)
c = Punto(3, -1)

t = Triangolo(a, b, c)

print(t)
print(round(t.perimetro(), 2))
print(round(t.area(), 2))