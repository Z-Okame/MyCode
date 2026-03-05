import math

class Triangolo:
    def __init__(self,a,b,c):
        self.a = a
        self.b = b
        self.c = c
        
    def __str__(self):
        return f"A ({self.a.getX()},{self.a.getY()}), B ({self.b.getX()},{self.b.getY()}), C ({self.c.getX()}, {self.c.getY()})"
    
    #getter
    def getA(self):
        return self.a
    def getB(self):
        return self.b
    def getC(self):
        return self.c

    #setter
    def setA(self, x, y):
        self.a.setX(x)
        self.a.setY(y)
        
    def setB(self, x, y):
        self.b.setX(x)
        self.b.setY(y)
        
    def setC(self, x, y):
        self.c.setX(x)
        self.c.setY(y)
        
    #methods
    def perimetro(self):
        return (self.getA().distanza(self.b) + self.getB().distanza(self.c) + self.getC().distanza(self.a))
    
    def area(self):
        return math.sqrt(((self.perimetro() / 2) - self.getA().distanza(self.getB())) * 
                         ((self.perimetro() / 2) - self.getB().distanza(self.getC())) * 
                         ((self.perimetro() / 2) - self.getC().distanza(self.getA())))
                         
        