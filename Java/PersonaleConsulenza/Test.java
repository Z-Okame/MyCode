public class Test {
    public static void main(String[] args) {
        Progetto progetto = new Progetto();

        Dipendente tecnico1 = new TecnicoElettronico("Mario", "Rossi", "T001", 2015, true);
        Dipendente tecnico2 = new TecnicoElettronico("Luigi", "Verdi", "T002", 2018, false);
        Dipendente dirigente1 = new Dirigente("Anna", "Bianchi", "D001", 2010);

        progetto.aggiungiDipendente(tecnico1);
        progetto.aggiungiDipendente(tecnico2);
        progetto.aggiungiDipendente(dirigente1);

        int oreLavorate = 160; // esempio di ore lavorate in un mese
        double costoTotale = progetto.calcolaCostoTotale(oreLavorate);

        System.out.println("Costo totale del progetto per " + oreLavorate + " ore lavorate: " + costoTotale);
    }
}
