function stampa() {
    let frase = document.getElementById("inputText").value;
    let char = frase.charAt(frase.length - 1);

    if (char == "?") 
        document.getElementById("Esercizio").innerText = "Non lo so..";    
    else if (char == "!") 
        document.getElementById("Esercizio").innerText = "Hai ragione!";
    else 
        document.getElementById("Esercizio").innerText = "Riformula la frase.";

}