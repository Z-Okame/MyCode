let data = new Date(document.getElementById("data1").value);
let n = parseInt(document.getElementById("N").value);

data.setDate(parseInt(data.getDate() + n));

function VisualizzaDataNuovaEFineMese() {

    let str = " La data tra " + String(n) + " giorni è: " + data.toDateString();

    let fineMese = data.getMonth();

    while (fineMese.getMonth() === data.getMonth()) {
        fineMese.setDate(fineMese.getDate() + 1);
    }

    document.getElementById("calcoloN").innerText = str + " e il giorno di fine mese è: " + fineMese.toDateString();
}

document.getElementById("calcola").addEventListener("click", VisualizzaDataNuovaEFineMese);