#list comprehension 
array = [i for i in range(11)]  # Properly format list comprehension
print(array)  # Use print function to display the list
#------------------------------------------------------------------------------------------------------------
nomi = ["Alex", "Marco", "Giovanni", "Luca", "Sara", "Anna", "Francesca", "Alessandro", "Matteo", "Giorgio"] 
nomi_corti = [nome for nome in nomi if len(nome)<=5]
print(nomi_corti)  # Print the filtered list of names
#------------------------------------------------------------------------------------------------------------
numeri = [1, 1, 2, 3, 5, 8, 13, 21, 34, 55]
quadrati = [x*x for x in numeri]
print(quadrati)  # List comprehension to calculate squares
#------------------------------------------------------------------------------------------------------------
lista_di_stringhe = ['9','0','32','8','2','8','64','29','42','99']
numeri = [int(x) for x in lista_di_stringhe]  # Convert strings to integers
risultato = [x for x in numeri if x%2!=0]  # Filter even numbers
print(risultato)
#------------------------------------------------------------------------------------------------------------
def elabora_lista(numeri):
    
    minimo = min(numeri)
    return[x-minimo for x in numeri]  # Filter out the minimum number
numeri = [10,8,4,7]
print (elabora_lista(numeri))  # Call the function and print the result
#------------------------------------------------------------------------------------------------------------
def trova_tutti_gli_indici(numeri, elemento):
    return [i for i in range(len(numeri)) if numeri[i] == elemento]
numeri = [2,2,3,5,2,6,7,2]
elemento = 2
print (trova_tutti_gli_indici(numeri, elemento))  # Find all indices of the element
#------------------------------------------------------------------------------------------------------------
