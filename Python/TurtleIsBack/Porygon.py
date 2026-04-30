import turtle

screen = turtle.Screen()
screen.bgcolor("#C8C8C8")
screen.title("Porygon #137")
screen.setup(700, 700)
screen.tracer(0)

t = turtle.Turtle()
t.hideturtle()

# Palette
_ = None       # sfondo
K = "#252528"  # nero outline
R = "#D63350"  # rosso
P = "#F08C91"  # rosa medio
L = "#FFBCBC"  # rosa chiaro
W = "#EEEEF0"  # bianco (occhio)
G = "#909090"  # grigio (pupilla)
C = "#14A0C8"  # ciano
T = "#64C3DC"  # ciano chiaro
B = "#3755BB"  # blu scuro

# Griglia 16 righe × 17 colonne
# Ogni cella verificata con colore RGB dall'immagine originale
grid = [
#    0  1  2  3  4  5  6  7  8  9  10 11 12 13 14 15 16
    [_, _, _, _, _, _, K, K, _, _, _, _, _, _, _, _, _],  # 0
    [_, _, _, _, K, P, P, P, K, _, _, _, _, _, _, K, K],  # 1  r1c5=rosa (non grigio)
    [_, _, _, K, P, P, P, P, P, K, _, _, _, _, K, C, K],  # 2  r2c14=K (dark)
    [_, _, K, P, P, P, L, P, P, R, K, _, _, K, C, C, K],  # 3  r3c13=K
    [_, K, B, P, P, P, W, G, W, R, K, _, _, K, C, B, _],  # 4  r4c1=K,r4c6=W,r4c7=G,r4c8=W
    [_, K, C, C, B, R, W, G, L, K, L, _, B, B, C, K, _],  # 5  r5c4=B,r5c6=W,r5c7=G
    [K, C, C, C, B, R, P, R, K, R, K, K, B, B, B, K, _],  # 6  r6c7=R,r6c10-11=K
    [K, C, C, C, B, B, K, K, R, R, R, R, R, B, K, _, _],  # 7
    [_, K, B, B, K, B, B, B, B, R, R, R, R, K, K, _, _],  # 8
    [_, _, K, K, B, B, C, B, B, R, R, K, K, _, _, _, _],  # 9  r9c13=sfondo
    [_, _, _, K, B, C, C, C, B, R, K, C, B, B, _, _, _],  # 10  r10c10=K (dark teal->K)
    [_, _, K, B, B, B, C, C, C, K, C, C, C, B, K, _, _],  # 11
    [_, _, K, B, B, K, K, B, B, B, C, C, B, B, K, _, _],  # 12  r12c5-6=K, r12c2=K, r12c14=K
    [_, _, _, _, _, _, _, _, K, B, C, C, B, K, _, _, _],  # 13  r13c3-7=sfondo
    [_, _, _, _, _, _, _, _, _, K, B, B, K, _, _, _, _],  # 14
    [_, _, _, _, _, _, _, _, _, _, K, K, _, _, _, _, _],  # 15
]

ROWS = len(grid)    # 16
COLS = len(grid[0]) # 17
SIZE = 37

ox = -(COLS * SIZE) / 2
oy =  (ROWS * SIZE) / 2

def draw_pixel(col, row, color):
    x = ox + col * SIZE
    y = oy - row * SIZE
    t.penup()
    t.goto(x, y)
    t.pendown()
    t.fillcolor(color)
    t.pencolor(color)
    t.pensize(1)
    t.begin_fill()
    for _ in range(4):
        t.forward(SIZE)
        t.left(90)
    t.end_fill()

for r, row in enumerate(grid):
    for c, color in enumerate(row):
        if color is not None:
            draw_pixel(c, r, color)

# Label
t.penup()
t.goto(0, oy - ROWS * SIZE - 28)
t.pencolor("#222222")
t.write("Porygon  #137", align="center", font=("Courier", 15, "bold"))

screen.update()
turtle.done()