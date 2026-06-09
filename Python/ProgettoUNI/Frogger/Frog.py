import g2d

class Frog:
    def __init__(self, x0: int, y0: int):
        self._x = x0
        self._y = y0 
        
    def move(self):
        self.dy = 0
        if g2d.mouse_clicked():
            self._y -= 15
    
    def pos(self) -> tuple[int, int]:
        return self._x, self._y
        
    def check_collisions(self, a1: Frog, a2: Car) -> bool:
        pass
        
        