let Maiuscole = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
let Minuscole = "abcdefghijklmnopqrstuvwxyz"
let Numeri = "0123456789"
let Simboli = "-_*+%&$="

for (let i = 0; i < 5; i++) {
    let Password = ""
    for (let j = 0; j < 3; j++) {
        Password += Maiuscole.charAt(Math.floor(Math.random() * Maiuscole.length))
        Password += Minuscole.charAt(Math.floor(Math.random() * Minuscole.length))
        Password += Numeri.charAt(Math.floor(Math.random() * Numeri.length))
        Password += Simboli.charAt(Math.floor(Math.random() * Simboli.length))
    }
    //split, sort and join to shuffle the password characters
    document.getElementById("Esercizio").innerText += Password + "\n"
}