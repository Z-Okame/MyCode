import g2d

g2d.init_canvas((600, 400))

# draw_rect, draw_circle…

g2d.set_color((0, 255, 0))
g2d.draw_line((150, 100), (400, 300))   # pt1, pt2

g2d.set_color((255, 0, 0))
g2d.draw_text("Hello", (150, 100), 40)  # text, center, font-size

g2d.main_loop()