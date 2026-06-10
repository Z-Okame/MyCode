import g2d
import random
ARENA_W, ARENA_H = 500, 400
#=======================================================================
#=======================================================================
class Actor:
    def move(self, arena: "Arena"):
        raise NotImplementedError("Abstract method")

    def pos(self) -> tuple[int, int]:
        raise NotImplementedError("Abstract method")

    def size(self) -> tuple[int, int]:
        raise NotImplementedError("Abstract method")

    def sprite(self) -> tuple[int, int] | None:
        raise NotImplementedError("Abstract method")


def check_collision(a1: Actor, a2: Actor) -> bool:
    x1, y1, w1, h1 = a1.pos() + a1.size()
    x2, y2, w2, h2 = a2.pos() + a2.size()
    return (y2 <= y1 + h1 and y1 <= y2 + h2 and
            x2 <= x1 + w1 and x1 <= x2 + w2)
#=======================================================================
#=======================================================================


#=======================================================================
#=======================================================================
class Arena:
    def __init__(self, size: tuple[int, int]):
        self._w, self._h = size
        self._count = 0
        self._turn = -1
        self._actors = []
        self._curr_keys = self._prev_keys = tuple()
        self._collisions = []

    def spawn(self, a: Actor):
        if a not in self._actors:
            self._actors.append(a)

    def kill(self, a: Actor):
        if a in self._actors:
            self._actors.remove(a)

    def tick(self, keys=[]):
        actors = list(reversed(self._actors))
        self._detect_collisions(actors)
        self._prev_keys = self._curr_keys
        self._curr_keys = keys
        for self._turn, a in enumerate(actors):
            a.move(self)
        self._count += 1

    def actors(self) -> list:
        return list(self._actors)

    def size(self) -> tuple[int, int]:
        return (self._w, self._h)

    def count(self) -> int:
        return self._count

    def _detect_collisions(self, actors):
        self._collisions.clear()
        tile = 40
        nx, ny = -(-self._w // tile), -(-self._h // tile)
        cells = [set() for _ in range(nx * ny)]
        for i, a in enumerate(actors):
            x, y, w, h = (round(v) for v in a.pos() + a.size())
            for tx in range((x - 1) // tile, 1 + (x + w + 1) // tile):
                for ty in range((y - 1) // tile, 1 + (y + h + 1) // tile):
                    if 0 <= tx < nx and 0 <= ty < ny:
                        cells[ty * nx + tx].add(i)
        for i, a in enumerate(actors):
            neighs = set()
            x, y, w, h = (round(v) for v in a.pos() + a.size())
            for tx in range((x - 1) // tile, 1 + (x + w + 1) // tile):
                for ty in range((y - 1) // tile, 1 + (y + h + 1) // tile):
                    if 0 <= tx < nx and 0 <= ty < ny:
                        neighs |= cells[ty * nx + tx]
            colls = [actors[j] for j in sorted(neighs, reverse=True)
                     if i != j and check_collision(a, actors[j])]
            self._collisions.append(colls)

    def collisions(self) -> list[Actor]:
        t, colls = self._turn, self._collisions
        return colls[t] if 0 <= t < len(colls) else []
    

    def game_status(self) -> str:
        has_player = any(isinstance(a, Player) for a in self.actors())
        has_aliens = any(isinstance(a, Alien) for a in self.actors())
        if not has_player:
            return "lose"
        if not has_aliens:
            return "win"
        return "playing"
#=======================================================================
#=======================================================================


#=======================================================================
#=======================================================================
class Projectile(Actor):
    def __init__(self, x0, y0):
        self._x = x0
        self._y = y0
        self._dy = 4

    def move(self, arena):
        for other in arena.collisions():
            if isinstance(other, Alien):
                self.hit(arena)
        self._y -= self._dy

    def pos(self) -> tuple[int, int]:
        return self._x, self._y

    def size(self):
        return (3, 8)

    def sprite(self):
        return (361, 18)

    def hit(self, arena: Arena):
        arena.kill(self)
#=======================================================================
#=======================================================================


#=======================================================================
#=======================================================================
class Player(Actor):
    def __init__(self, x0: int, y0: int):
        self._x = x0
        self._y = y0
        self._dx = 4
        self._dy = 4

    def size(self) -> tuple[int, int]:
        return (27, 15)

    def sprite(self) -> tuple[int, int]:
        return (348, 364)

    def pos(self) -> tuple[int, int]:
        return self._x, self._y

    def move(self, arena: Arena):
        for other in arena.collisions():
            if isinstance(other, AlienShot):
                self.hit(arena)
        keys = g2d.current_keys()
        if "ArrowLeft" in keys:
            self._x -= self._dx
        elif "ArrowRight" in keys:
            self._x += self._dx

    def shoot(self):
        x, y = self.pos()
        return Projectile(x + 10, y - 10)
    
    def hit(self, arena: Arena):
        arena.kill(self)
#=======================================================================
#=======================================================================

#=======================================================================
#=======================================================================
class Alien(Actor):
    def __init__(self, x0: int, y0: int):
        self._x = x0
        self._y = y0
        self._xmin = x0
        self._xmax = x0 + 100
        self._dx = 4
        self._dy = 4
        self._count = 0

    def move(self, arena):
        for other in arena.collisions():
            if isinstance(other, Projectile):
                self.hit(arena)
        if self._xmin <= self._x + self._dx <= self._xmax:
            self._x += self._dx
        else:
            self._dx = -self._dx
            self._y += self._dy
        self._count += 1

    def pos(self) -> tuple[int, int]:
        return self._x, self._y

    def sprite(self):
        if self._count % 28 < 16:
            return (220, 20)
        else:
            return (196, 20)

    def size(self):
        return (24, 16)

    def hit(self, arena: Arena):
        arena.kill(self)

    def shoot(self):
        x, y = self.pos()
        return AlienShot(x + 10, y - 10)
#=======================================================================
#=======================================================================


#=======================================================================
#=======================================================================
class AlienShot(Actor):
    def __init__(self, x0, y0):
        self._x = x0
        self._y = y0
        self._dy = 4

    def move(self, arena):
        for other in arena.collisions():
            if isinstance(other, Player):
                self.hit(arena)
        self._y += self._dy

    def pos(self) -> tuple[int, int]:
        return self._x, self._y

    def size(self):
        return (3, 8)

    def sprite(self):
        return (361, 18)

    def hit(self, arena: Arena):
        arena.kill(self)
#=======================================================================
#=======================================================================

#=======================================================================
#=======================================================================
def tick():
    global arena, player
    sprites = "https://fondinfo.github.io/sprites/invaders.png"
    keys = g2d.current_keys()
    prev = g2d.previous_keys()
    g2d.clear_canvas((0,0,0))

    aliens = [a for a in arena.actors() if isinstance(a, Alien)]
    remaining = len(aliens)
    limit = max(6, 100 - (27 - remaining) * 4)

    if "ArrowUp" in keys and "ArrowUp" not in prev:
        arena.spawn(player.shoot())

    if aliens and random.randrange(0, limit) == 3:
        arena.spawn(random.choice(aliens).shoot())

    arena.tick(keys)

    for a in arena.actors():
        g2d.draw_image(sprites, a.pos(), a.sprite(), a.size())
        

    status = arena.game_status()
    if status == "lose":
        g2d.alert('You Lose!!')
        g2d.close_canvas()
    elif status == "win":
        g2d.alert('You Win!!')
        g2d.close_canvas()
#=======================================================================     
#=======================================================================


def main():
    global arena, player
 
    arena = Arena((ARENA_W, ARENA_H))
    for i in range(9):
        arena.spawn(Alien(50 + i * 32, 140))
    for i in range(9):
        arena.spawn(Alien(50 + i * 32, 110))
    for i in range(9):
        arena.spawn(Alien(50 + i * 32, 80))
    player = Player(120, 380)
    arena.spawn(player)

    g2d.init_canvas((ARENA_W, ARENA_H))
    g2d.main_loop(tick)
                        
                        
if __name__ == "__main__":
    main()

