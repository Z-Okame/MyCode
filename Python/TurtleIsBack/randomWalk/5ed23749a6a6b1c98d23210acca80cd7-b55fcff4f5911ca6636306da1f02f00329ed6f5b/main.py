########### Challenge 4 - Random Walk ########
import turtle as t
import random

def choosecolor():
  r = random.randint(0, 255)
  g = random.randint(0, 255)
  b = random.randint(0, 255)
  return (r,g,b)

def chooseangle():
  return random.choice(angles)

t.colormode(255)
ciro = t.Turtle()
ciro.shape("square")
ciro.pensize(15)
ciro.speed("fastest")


colours = ["CornflowerBlue", "DarkOrchid", "IndianRed", "DeepSkyBlue", "LightSeaGreen", "wheat", "SlateGray", "SeaGreen"]
angles = [0,90,180,270]

while (True):
    ciro.color(choosecolor())
    ciro.setheading(chooseangle())
    ciro.forward(50)
    



screen = t.Screen()
screen.window_height()
screen.exitonclick()
