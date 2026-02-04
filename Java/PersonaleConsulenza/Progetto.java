import java.util.ArrayList;

public class Progetto {
    ArrayList<Dipendente> dipendenti;

    public Progetto() {
        dipendenti = new ArrayList<>();
    }

    public void aggiungiDipendente(Dipendente d) {
        dipendenti.add(d);
    }

    public double calcolaCostoTotale(int ore) {
        double totale = 0;
        for (Dipendente d : dipendenti) {
            totale += d.calcolaStipendio(ore);
        }
        return totale;
    }
}
