from turtle import Turtle, Screen

screen = Screen()
Pasqualino = Turtle()

def move_forwards():
    Pasqualino.forward(10)

def move_backwards():
    Pasqualino.backward(10)

def turn_left():
    Pasqualino.left(10)

def turn_right():
    Pasqualino.right(10)

def clean():
    Pasqualino.clear()
    Pasqualino.penup()
    Pasqualino.home()
    Pasqualino.pendown()

screen.listen()
screen.onkey(key="w",fun=move_forwards)
screen.onkey(key="s",fun=move_backwards)
screen.onkey(key="a",fun=turn_left)
screen.onkey(key="d",fun=turn_right)
screen.onkey(key="c",fun=clean)
screen.exitonclick()