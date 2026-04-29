function Aggiungi() {
    //Creo elemento Nome e Elimina, impostando i testi e gli id
    let nome = document.getElementById("nome").value
    let nuovoNome = document.createElement("li")
    let eliminaButton = document.createElement("button")
    eliminaButton.textContent = "Elimina"
    eliminaButton.id = "elimina"
    nuovoNome.textContent = nome


    //Funzione anonima per eliinare l'elemento
    eliminaButton.addEventListener("click", function() {
        nuovoNome.remove();
        AggiornaContatore();
    });

    nuovoNome.addEventListener("mouseover", function() {
        nuovoNome.classList.add("sfondo");
    })

    nuovoNome.addEventListener("mouseout", function() {
        nuovoNome.classList.remove("sfondo");
    })


    // lo aggiungo all'elenco
    document.getElementById("elenco").appendChild(nuovoNome)
    nuovoNome.appendChild(eliminaButton)
    AggiornaContatore()
}

function AggiornaContatore() {
    //variabile per contatore
    let contatore = 0
    const lista = document.getElementById("elenco")
    //ciclo sulla lunghezza dell'elenco
    for (let i = 0; i < lista.children.length; i++) {
        contatore++
    }
    //aggiorno il testo del contatore
    let testo = document.getElementById("testo")
    testo.textContent = "Totale nomi: " + contatore
}

function SvuotaLista() {
    const lista = document.getElementById("elenco")
    while(lista.firstChild) {
        lista.firstChild.remove();
    }
    AggiornaContatore()
}

document.getElementById("aggiungi").addEventListener("click", Aggiungi)
document.getElementById("svuota").addEventListener("click", SvuotaLista)

