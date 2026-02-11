#Iterazione su un dizionario
grades = {
    "math": 8,
    "italian": 7,
    "history": 6,
    "english": 9
}

media = 0

for i in grades.keys():
    print(i)
    
for i in grades.values():
    media += i
    print(i)

for i in grades:
    print(f"{i} : ", grades[i])
    
print("Media = " + str(media/len(grades)))