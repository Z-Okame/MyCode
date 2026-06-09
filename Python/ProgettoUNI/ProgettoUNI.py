#!/usr/bin/env python3
"""
@author  Michele Tomaiuolo - https://tomamic.github.io/
@license This software is free - https://opensource.org/license/mit
"""
import random


#Animazione Veicolo

ARENA_W, ARENA_H, CAR_W, CAR_H,BALL_DX = 600, 600, 30, 20,10


class Car:
    def __init__(self, x0: int, y0: int):
        self._x = x0
        self._y = y0
        #randomizza direzione
        if random.randint(0,1) == 0:
            self._dx = -BALL_DX
        else:
            self._dx = BALL_DX

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
    g2d.draw_rect(c1.pos(), (CAR_W,CAR_H))  # FG
    g2d.draw_rect(c2.pos(), (CAR_W,CAR_H))
    g2d.draw_rect(c3.pos(), (CAR_W,CAR_H))
    g2d.draw_rect(c4.pos(), (CAR_W,CAR_H)) # FG
    c1.move()
    c2.move()
    c3.move()
    c4.move()

def main():
    global c1, c2, c3, c4, g2d
    import g2d  # Ball does not depend on g2d
    c1 = Car(random.randint(100,400), random.randint(100,400))
    c2 = Car(random.randint(100,400), random.randint(100,400))
    c3 = Car(random.randint(100,400), random.randint(100,400))
    c4 = Car(random.randint(100,400), random.randint(100,400))

    g2d.init_canvas((ARENA_W, ARENA_H))
    g2d.main_loop(tick)

if __name__ == "__main__":
    main()
