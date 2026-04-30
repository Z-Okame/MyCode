import turtle as t
import random

def choosecolor():
  r = random.randint(0, 255)
  g = random.randint(0, 255)
  b = random.randint(0, 255)
  return (r,g,b)

t.colormode(255)

ciro = t.Turtle()
ciro.speed("fastest")
ciro.pensize(1)
distanza = 5
for n in range (0, (int)(360/distanza)):
    ciro.pencolor(choosecolor())
    ciro.circle(100)
    ciro.setheading(n*distanza)
    

screen = t.Screen()
screen.exitonclick()