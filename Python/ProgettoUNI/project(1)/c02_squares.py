import random
import g2d

g2d.init_canvas((500,500))
p1 = ((random.randint(0,499),random.randint(0,499)))
p2 = ((random.randint(0,499),random.randint(0,499)))
      
g2d.draw_line(p1,p2)
