#classe fatta per evitare problemi di visualizzazione, non uile al progetto
from turtle import Turtle

class Border:
    
    def __init__(self):
        self.border = Turtle()
        self.border.hideturtle()
        self.border.speed("fastest")
        self.border.penup()
        self.border.color("white")
        self.border.pensize(2)
        self.draw_border()
    
    def draw_border(self):
        # Coordinate dei limiti: da -280 a 280 (+10 per ciascuna per collisione più precisa)
        x_max = 290
        x_min = -290
        y_max = 290
        y_min = -290
        self.border.goto(x_min, y_max)
        self.border.pendown()
        self.border.goto(x_max, y_max)
        self.border.goto(x_max, y_min)
        self.border.goto(x_min, y_min)
        self.border.goto(x_min, y_max)
        self.border.penup()
