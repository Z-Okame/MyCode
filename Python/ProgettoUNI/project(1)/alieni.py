#!/usr/bin/env python3
"""
@author  Michele Tomaiuolo - https://tomamic.github.io/
@license This software is free - https://opensource.org/license/mit
"""

import g2d
ARENA_W, ARENA_H,x,y,dx = 600,600,20,20,10

def tick():
    global x,y,dx
    g2d.clear_canvas()
    g2d.draw_image("sprites.png", (x, y), (20, 0), (20, 20))
    x += dx
    if x + dx > ARENA_W or x + dx < 0:
        dx = -dx
        y += 10

def main():
    g2d.init_canvas((ARENA_W, ARENA_H))
    g2d.main_loop(tick)

main()
