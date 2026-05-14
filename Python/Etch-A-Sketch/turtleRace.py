from turtle import Turtle, Screen, turtles
import random

screen = Screen()

is_race_on = False
screen.setup(500, 400)
user_bet = screen.textinput("Make your bet", "Which turtle will win the race? Enter a color: ")
colors = ["red", "orange", "yellow", "green", "blue", "purple"]
y_positions = [-70, -40, -10, 20, 50, 80]
turtles = []

line = Turtle()
line.hideturtle()
line.color("black")
line.penup()
line.goto(230, -100)
line.pendown()
line.goto(230, 100)


for turtle_index in range(0,6):
    jhonny = Turtle(shape="turtle")
    jhonny.color(colors[turtle_index])
    jhonny.penup()
    jhonny.goto(-230, y_positions[turtle_index])
    turtles.append(jhonny)
if user_bet:
    is_race_on = True

while is_race_on:
    for turtle in turtles:
        if turtle.xcor() > 230:
            is_race_on = False
            winning_color = turtle.pencolor()
            if winning_color == user_bet:
                print(f"You've won! The {winning_color} turtle is the winner!")
            else:
                print(f"You've lost! The {winning_color} turtle is the winner!")

        turtle.forward(random.randint(0, 10))

screen.exitonclick()