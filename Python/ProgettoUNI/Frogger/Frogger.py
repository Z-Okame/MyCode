#!/usr/bin/env python3
'''
Implementa una posizione minima e massima per le macchine ( e i tronchi)
per spaziarli allo spawn
"self.ymin = x0"
"self.ymax = x0 + 100"
'''


import random
from Frog import Frog

sprites = "https://fondinfo.github.io/sprites/frogger.png"
#Animazione Veicolo

ARENA_W, ARENA_H,CAR_DX = 600, 600,10


class Car:
    def __init__(self, x0: int, y0: int):
        self._x = x0
        self._y = y0
        #randomizza direzione
        if random.randint(0,1) == 0:
            self._dx = -CAR_DX
            self._Sdx = (190,34) #Sprite direction
        else:
            self._dx = CAR_DX
            self._Sdx = (191,2)

    def move(self):
        if not -100 <= self._x + self._dx <= ARENA_W+100:
            if self._dx < 0:
                self._x = ARENA_W+100
            else:
                self._x = -100
        self._x += self._dx

    def pos(self) -> tuple[int, int]:
        return self._x, self._y


def tick():
    g2d.clear_canvas()  # BG
    g2d.set_color((255,0,0))
    g2d.draw_image(sprites, c1.pos(), c1._Sdx, (34, 27))
    g2d.draw_image(sprites, c2.pos(), c2._Sdx, (34, 27))
    g2d.draw_image(sprites, c3.pos(), c3._Sdx, (34, 27))
    g2d.draw_image(sprites, c4.pos(), c4._Sdx, (34, 27))
    g2d.set_color((0,255,0))
    g2d.draw_image(sprites, frog.pos(), (3,4), (26, 24))
    c1.move()
    c2.move()
    c3.move()
    c4.move()
    frog.move()

def main():
    global c1, c2, c3, c4, frog, g2d
    import g2d  # Ball does not depend on g2d
    c1 = Car(random.randint(100,400), random.randint(100,400))
    c2 = Car(random.randint(100,400), random.randint(100,400))
    c3 = Car(random.randint(100,400), random.randint(100,400))
    c4 = Car(random.randint(100,400), random.randint(100,400))
    frog = Frog(200,500)

    g2d.init_canvas((ARENA_W, ARENA_H))
    g2d.main_loop(tick)

if __name__ == "__main__":
    main()
