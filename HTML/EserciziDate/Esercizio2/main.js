let data = new Date(document.getElementById("data1").value);
let n = parseInt(document.getElementById("N").value);

data.setDate(parseInt(data.getDate() + n));

function VisualizzaDataNuova() {

    document.getElementById("calcoloN").innerText = " La data tra " + String(n) + " giorni è: " + data.toDateString();
}

document.getElementById("calcola").addEventListener("click", VisualizzaDataNuova);