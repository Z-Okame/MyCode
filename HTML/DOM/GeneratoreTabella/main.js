function GeneraTabella() {

    let Nrighe = document.getElementById("righe").value
    let Ncolonne = document.getElementById("colonne").value

    let tabella = document.createElement("table")

    for(let i = 0; i < Nrighe; i++) {
        let riga = document.createElement("tr")
        for(let j = 0; j < Ncolonne; j++) {
            let colonna = document.createElement("th")
            riga.appendChild(colonna)
        }
        tabella.appendChild(riga)
    }

    document.getElementById("tabella-container").appendChild(tabella)
}


function GeneraNumeri() {
    
}

document.getElementById("genera").addEventListener('click', GeneraTabella)