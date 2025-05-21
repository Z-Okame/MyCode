from turtle import Screen,Turtle
import turtle as t
import random

def random_color():
    r = random.randint(0, 255)
    g = random.randint(0, 255)
    b = random.randint(0, 255)
    return (r, g, b)

window = Screen()
t.colormode(255)


Ciro = Turtle()
Ciro.hideturtle()

messaggio = Turtle()

for i in range(5):
    Ciro.forward(150)
    Ciro.right(144)


window.textinput('title','cosa vuoi fare?')

messaggio.write("CIAOO")
messaggio.clear()
messaggio.write("Ciao")


Ciro.penup()
Ciro.goto(100,150)
Ciro.pendown()
Ciro.dot(30, (random_color()))

Ciro.pencolor('blue')
Ciro.fillcolor('blue')

Ciro.begin_fill()
for _ in range(4):
    Ciro.forward(50)
    Ciro.right(90)
Ciro.end_fill()

window.exitonclick()

