function GeneraTabella() {
    document.getElementById("tabella-container").innerHTML = ""

    let Nrighe = document.getElementById("righe").value
    let Ncolonne = document.getElementById("colonne").value

    let tabella = document.createElement("table")

    for(let i = 0; i < Nrighe; i++) {
        let riga = document.createElement("tr")
        for(let j = 0; j < Ncolonne; j++) {
            let colonna = document.createElement("th")
            colonna.textContent = Math.floor((Math.random() * 200) - 100)
            riga.appendChild(colonna)
        }
        tabella.appendChild(riga)
    }

    document.getElementById("tabella-container").appendChild(tabella)
}

function ColoraNegativi() {
    let tabella = document.getElementById("tabella-container").children[0]
    const celle = tabella.querySelectorAll('th')
    for (let i = 0; i < celle.length; i++) {
        if (celle[i].textContent < 0) {
            celle[i].classList.add('negativo')
        }
        else {
            celle[i].classList.remove('negativo')
        }
    }
}
document.getElementById("genera").addEventListener('click', GeneraTabella)
document.getElementById("colora").addEventListener('click',ColoraNegativi)