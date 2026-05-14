class Grafico {
    //costruttore
    constructor(A, B, C, tipo, containerId) {
        this.A = A;
        this.B = B;
        this.C = C;
        this.tipo = tipo;         
        this.container = document.getElementById(containerId);
    }

    //metodi
    /**
     * metodo che calcola i punti per cui passa la funzione
     * @returns Array di Array (coppie di punti)
     */
    calcolaPunti() {
        const punti = [];
        for (let x = -10; x <= 10; x += 1) {
            const y = this.tipo === "retta"
                ? this.A * x + this.B
                : this.A * x * x + this.B * x + this.C;
            punti.push([x, y]);
        }
        return punti;
    }

    /**
     * Metodo che disegna il grafico
     * fa uso di "addColumn" e "addRows", addColumn crea due colonne di una tabella, addRows aggiunge nelle righe le coppie di punti
     * viene poi definito il titolo del grafico in base al tipo selezionato e le opzioni di visualizzazione
     * infine viene creata l'immagine del grafico.
     */
    disegna() {
        const data = new google.visualization.DataTable();
        data.addColumn("number", "x");
        data.addColumn("number", "y");
        data.addRows(this.calcolaPunti());

        const titolo = this.tipo === "retta"
            ? `Retta: y = ${this.A}x + ${this.B}`
            : `Parabola: y = ${this.A}x² + ${this.B}x + ${this.C}`;

        const options = { title: titolo, legend: { position: "none" } };
        const chart = new google.visualization.LineChart(this.container);
        chart.draw(data, options);
    }
}

class UIController {
    //metodi

    /**
     * metodo che legge i valori in input
     * @returns float A, float B, float C, String tipo
     */
    leggiInput() {
        return {
            A: parseFloat(document.getElementById("valA").value),
            B: parseFloat(document.getElementById("valB").value),
            C: parseFloat(document.getElementById("valC").value),
            tipo: document.getElementById("tipo").value
        };
    }

    /**
     * metodo che associa a {A,B,C,tipo} il loro valore dall'input
     * istanzia un oggetto Grafico con i 3 parametri, tipo e container
     * chiama il metodo disegna del grafico "g"
     */
    onBottoneClick() {
        const { A, B, C, tipo } = this.leggiInput();
        const g = new Grafico(A, B, C, tipo, "VisualizzaGrafico");
        g.disegna();
    }
}

// Avvio
google.charts.load("current", { packages: ["corechart"] });
google.charts.setOnLoadCallback(() => {
    const ui = new UIController();
    document.getElementById("generaGrafico").addEventListener("click", () => ui.onBottoneClick());
    ui.onBottoneClick(); // grafico iniziale
});