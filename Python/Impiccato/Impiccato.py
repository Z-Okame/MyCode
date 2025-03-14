import random
from hangman_art import stages, logo
from parole_impiccato import word_list

lives = 6
letters = []

chosen_word = random.choice(word_list)

print(logo)
print(f"Benvenuto nel gioco dell' Impiccato!, la parola da indovinare contiene {len(chosen_word)} lettere")

placeholder = ""
word_length = len(chosen_word)
for position in range(word_length):
    placeholder += "_"
print("Word to guess: " + placeholder)

game_over = False
correct_letters = []

while not game_over:

    print(f"****************************{lives}/6 VITE RIMASTE****************************")
    guess = input("Indovina la lettera: ").lower()

    if guess in letters:
        print(f"Hai già inserito la lettera {guess}")
        continue
    else:
        letters.append(guess)

    display = ""

    for letter in chosen_word:
        if letter == guess:
            display += letter
            correct_letters.append(guess)
        elif letter in correct_letters:
            display += letter
        else:
            display += "_"

    print("Parola da indovinare: " + display)

    if guess not in chosen_word:
        print(f"Hai scelto {guess}, che non è presente nella parola. Hai perso una vita.")
        lives -= 1

        if lives == 0:
            game_over = True
            print(f"***********************HAI PERSO**********************")
            print(f"La parola era: {chosen_word}")

    if "_" not in display:
        game_over = True
        print("****************************HAI VINTO****************************")

    print(stages[lives])
