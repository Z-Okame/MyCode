import random

stages = [r'''
  +---+
  |   |
  O   |
 /|\  |
 / \  |
      |
=========
''', r'''
  +---+
  |   |
  O   |
 /|\  |
 /    |
      |
=========
''', r'''
  +---+
  |   |
  O   |
 /|\  |
      |
      |
=========
''', '''
  +---+
  |   |
  O   |
 /|   |
      |
      |
=========''', '''
  +---+
  |   |
  O   |
  |   |
      |
      |
=========
''', '''
  +---+
  |   |
  O   |
      |
      |
      |
=========
''', '''
  +---+
  |   |
      |
      |
      |
      |
=========
''']

word_list = ["arancia", "babbuino", "cammello"]

# TODO-1: - Crea una variabile chiamata 'lives' che tenga traccia del numero di vite rimaste.
#  Assegna a 'lives' il valore 6.

chosen_word = random.choice(word_list)
print(chosen_word)

placeholder = ""
word_length = len(chosen_word)
for position in range(word_length):
    placeholder += "_"
print(placeholder)

game_over = False
correct_letters = []

while not game_over:
    guess = input("Indovina la lettera: ").lower()

    display = ""

    for letter in chosen_word:
        if letter == guess:
            display += letter
            correct_letters.append(guess)
        elif letter in correct_letters:
            display += letter
        else:
            display += "_"

    print(display)

    # TODO-2: - Se guess non è una lettera in chosen_word, riduci di 1 il valore di 'lives'.
    #  Se 'lives' arriva a 0 il gioco deve terminare e stampare a schermo 'Hai perso.'

    if "_" not in display:
        game_over = True
        print("You win.")

    # TODO-3: - visualizza l'ASCII art di 'stages'
    #  corrispondente al numero di vite rimaste al giocatore.

