#!/usr/bin/env python3
"""
@author  Michele Tomaiuolo - https://tomamic.github.io/
@license This software is free - https://opensource.org/license/mit
"""

import g2d

x, y, dx, dy = 80, 80, 4, -4
ARENA_W, ARENA_H = 480, 360

def tick():
    global x, dx, y, dy
    g2d.clear_canvas()                  # Draw background
    g2d.draw_image("ball.png", (x, y))  # Draw foreground
    if g2d.mouse_clicked():
        dx = 0
    if x + dx > ARENA_W-20 or x + dx < 0:
        dx = -dx
    x = x + dx
    
    if y + dy > ARENA_H-20 or y + dy < 0:
        dy = -dy
    else:
        dy = dy + 1
        
    y = y + dy
    
    
    

g2d.init_canvas((ARENA_W, ARENA_H))
g2d.main_loop(tick)  # call tick 30 times/second
