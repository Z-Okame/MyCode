from turtle import Turtle, Screen

screen = Screen()
pacman = Turtle()
pacman.shape("circle")
pacman.color("yellow")
pacman.penup()
pacman.speed("slow")

def look_left():
    pacman.setheading(180)

def look_right():
    pacman.setheading(0)

def look_up():
    pacman.setheading(90)

def look_down():
    pacman.setheading(270)

screen.listen()
screen.onkey(key="Left",fun=look_left)
screen.onkey(key="Right",fun=look_right)
screen.onkey(key="Up",fun=look_up)
screen.onkey(key="Down",fun=look_down)

for _ in range(1000):
    pacman.forward(10)

screen.exitonclick()