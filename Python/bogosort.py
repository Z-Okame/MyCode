import random
import time

#array di 100 elementos
list = [random.randint(0, 1000) for _ in range(100)]
print(list)

def is_sorted(arr):
    for i in range(len(arr) - 1):
        if arr[i] > arr[i + 1]:
            return False
    return True

def bogo_sort(arr):
    i = 1
    while not is_sorted(arr):
        random.shuffle(arr)
        time.sleep(0.00001)
        print("try number:" + str(i))
        i += 1
    return arr


print(bogo_sort(list))