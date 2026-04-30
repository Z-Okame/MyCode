import random
import time


list = [5, 3, 2]
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
        time.sleep(0.1)
        print("try number:" + str(i))
        i += 1
    return arr


print(bogo_sort(list))