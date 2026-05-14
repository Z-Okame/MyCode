google.charts.load("current", { packages: ["corechart"] });
google.charts.setOnLoadCallback(() => {
    startApp();
    document.getElementById("generaGrafico").addEventListener("click", disegnaGrafico);
});

//Funzione che disegna un grafico di default
function startApp() {
    disegnaGrafico();
}

//Funzione per disegnare il grafico
function disegnaGrafico() {
    const A = parseFloat(document.getElementById("valA").value);
    const B = parseFloat(document.getElementById("valB").value);
    const C = parseFloat(document.getElementById("valC").value);
    const tipo = document.getElementById("tipo").value;

    // Crea la DataTable con due colonne: x e y
    const data = new google.visualization.DataTable();
    data.addColumn("number", "x");
    data.addColumn("number", "y");

    // Calcola i punti da x = -10 a x = 10 con uno step di 1
    const punti = [];
    for (let x = -10; x <= 10; x += 1) {
        let y;
        if (tipo === "retta") {
            y = A * x + B;          // y = Ax + B
        } else {
            y = A * x * x + B * x + C; // y = Ax² + Bx + C
        }
        punti.push([x, y]);
    }
    data.addRows(punti);

    // Opzioni del grafico
    let titolo = ""
    if (tipo === "retta") {
        titolo = "Retta"
    }
    else {
        titolo = "Parabola"
    }

    const options = {
        title: titolo,
        curveType: "none",
        legend: { position: "none" },
        hAxis: { title: "x", viewWindow: { min: -10, max: 10 } },
        vAxis: { title: "y" ,viewWindow: { min: -10, max: 10 } },
        colors: [tipo === "retta" ? "#1565C0" : "#B71C1C"]
    };

    const chart = new google.visualization.LineChart(
        document.getElementById("VisualizzaGrafico")
    );
    chart.draw(data, options);
}
