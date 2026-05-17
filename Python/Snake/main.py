from turtle import Screen,Turtle
import time

screen = Screen()
screen.setup(600, 600)
screen.bgcolor("black")
screen.title("Snake.")
screen.tracer(0)

segments = []

for i in range(3):
    turtle = Turtle()
    turtle.shape("square")
    turtle.color("blue")
    turtle.penup()
    turtle.goto(i * -20, 0)
    segments.append(turtle)

screen.update()

game_is_on = True
while game_is_on:
    screen.update()
    for seg in segments:
        seg.forward(20)
        time.sleep(0.1)

screen.exitonclick()
