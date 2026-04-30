from turtle import Turtle, Screen

ciro = Turtle()
ciro.shape("turtle")
ciro.color("blue")
ciro.speed(100)

lati = 3

for _ in range(100):
    angolo = 360/lati
    for _ in range(lati):
        ciro.right(angolo)
        ciro.forward(90)
    lati+=1
    
screen = Screen()
screen.exitonclick()