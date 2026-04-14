let data1 = new Date(document.getElementById("data1").value);
let data2 = new Date(document.getElementById("data2").value);

let giorniRimanenti = Math.round((data2-data1)/86400000);

function differenza() {

    document.getElementById("differenza").innerText = "differenza: " + giorniRimanenti + " giorni";
}

document.getElementById("calcola").addEventListener("click",differenza);