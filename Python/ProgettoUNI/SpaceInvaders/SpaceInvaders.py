
import random
import g2d

ARENA_W, ARENA_H, BALL_W, BALL_H = 480, 320, 20, 20

class Alien:
    def __init__(self, x0: int, y0: int):
        self._x = x0
        self._y = y0
        self._xmin = x0
        self._xmax = x0 + 100
        self._dx = 4
        self._count = 0
    
    def move(self):
        if not self._xmin <= self._x + self._dx <= self._xmax:
            self._dx = -self._dx
            self._y += 4
        else:
            self._x += self._dx
        self._count += 1
        
    def pos(self) -> tuple[int,int]:
        return self._x, self._y
    
    def sprite(self):
        if self._count % 28 < 16:
            return (220,20)
        else:
            return (196,20)
           
    
    def size(self):
        return (24,16)
    

def tick():
    sprites ="https://fondinfo.github.io/sprites/invaders.png"
    
    g2d.clear_canvas()
    for a in aliens:
        g2d.draw_image(sprites,a.pos(), a.sprite(), a.size())
        a.move()

    

def main():
    global aliens,g2d
    aliens = []
    for i in range (6):
        aliens.append(Alien(120 + i*32,140))
    g2d.init_canvas((ARENA_W,ARENA_H))
    g2d.main_loop(tick)
                        
                        
if __name__ == "__main__":
    main()

    