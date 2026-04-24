function GeneraTabella() {
    document.getElementById("tabella-container").innerHTML = ""

    let Nrighe = document.getElementById("righe").value
    let Ncolonne = document.getElementById("colonne").value

    let tabella = document.createElement("table")
    let Ptesto = document.createElement('p')
    Ptesto.textContent = '0'
    let somma = document.getElementById('somma')
    somma.innerHTML = ""
    somma.appendChild(Ptesto)

    for(let i = 0; i < Nrighe; i++) {
        let riga = document.createElement("tr")
        for(let j = 0; j < Ncolonne; j++) {
            let colonna = document.createElement("th")
            colonna.textContent = (i + 1) * (j + 1)
            if ((i+j) % 2 == 0){
                colonna.classList = 'even'
            }
            else{
                colonna.classList = 'odd'
            }
            colonna.addEventListener('click', ()=>{
            Ptesto.textContent = `${parseInt(Ptesto.textContent) + parseInt(colonna.textContent)}`
            colonna.textContent = '0'
            colonna.className = 'empty'
            })
            riga.appendChild(colonna)
        }
        tabella.appendChild(riga)
    }

    document.getElementById("tabella-container").appendChild(tabella)

}
document.getElementById("genera").addEventListener('click', GeneraTabella)