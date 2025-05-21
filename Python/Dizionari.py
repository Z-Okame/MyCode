color = ['red', 'blue', 'ocean']
number = ['1','2','3']

car = {}

for x in range(0,3):
    car.update({color[x] : number[x]})
    
print(car)

car.clear()

print(car)