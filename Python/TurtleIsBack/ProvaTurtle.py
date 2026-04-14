from turtle import Turtle, Screen

ciro = Turtle()
ciro.shape("turtle")
ciro.color("blue")
ciro.speed(100)

#disegna quadrato
for _ in range(4):
    ciro.forward(100)
    ciro.right(90)

ciro.penup()
ciro.left(90)
ciro.forward(100)

#disegna cerchio
ciro.pendown()
ciro.circle(100)


#sposta turtle
ciro.right(90)
ciro.penup()
ciro.forward(20)
ciro.goto(-500,250)

#linea tratteggiata
for _ in range(50):
    ciro.forward(10)
    ciro.pendown()
    ciro.forward(10)
    ciro.penup()

ciro.goto(-500,-250)
#linea tratteggiata
for _ in range(50):
    ciro.forward(10)
    ciro.pendown()
    ciro.forward(10)
    ciro.penup()
    
ciro.goto(-450,250)
ciro.right(90)
#linea tratteggiata
for _ in range(50):
    ciro.forward(10)
    ciro.pendown()
    ciro.forward(10)
    ciro.penup()

ciro.penup()
ciro.goto(450,250)
#linea tratteggiata
for _ in range(50):
    ciro.forward(10)
    ciro.pendown()
    ciro.forward(10)
    ciro.penup()
    
screen = Screen()
screen.exitonclick()