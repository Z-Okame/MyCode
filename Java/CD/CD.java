package Java.CD;

public class CD {
    //attributi
    private String titolo;
    private String autore;
    private int numBrani;
    private int durataTotale; //in minuti

    //costruttore
    public CD(String titolo, String autore, int numBrani, int durataTotale) {
        this.titolo = titolo;
        this.autore = autore;
        this.numBrani = numBrani;
        this.durataTotale = durataTotale;
    }

    //getter
    public String getTitolo() {
        return titolo;
    }
    public String getAutore() {
        return autore;
    }
    public int getNumBrani() {
        return numBrani;
    }
    public int getDurataTotale() {
        return durataTotale;
    }

    //setter
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }
    public void setAutore(String autore) {
        this.autore = autore;
    }
    public void setNumBrani(int numBrani) {
        this.numBrani = numBrani;
    }
    public void setDurataTotale(int durataTotale) {
        this.durataTotale = durataTotale;
    }

    //metodi
    public String toString() {
        return "Titolo: " + this.titolo + ", Autore: " + this.autore + ", Numero Brani: " + this.numBrani + ", Durata Totale: " + this.durataTotale + " minuti.";
    }
    
    public void CompareDurata(CD cd1, CD cd2) {
        if (cd1.getDurataTotale() > cd2.getDurataTotale()) {
            System.out.println("Il CD " + cd1.getTitolo() + " ha una durata maggiore di " + cd2.getTitolo() + ".");
        } else if (cd1.getDurataTotale() < cd2.getDurataTotale()) {
            System.out.println("Il CD " + cd2.getTitolo() + " ha una durata maggiore. di " + cd1.getTitolo() + ".");
        } else {
            System.out.println("I due CD hanno la stessa durata.");
        }
    }

    public static void main(String[] args) {
        CD cd1 = new CD("Uno come te", "Gigi d'Alessio", 14, 58);
        CD cd2 = new CD("La storia di Nino", "Nino d'Angelo", 10, 32);
        CD cd3 = new CD("Il mercante di Stelle", "Sal Da Vinci", 10, 37);
        System.out.println(cd1.toString());
        System.out.println(cd2.toString());
        System.out.println(cd3.toString());
        cd1.CompareDurata(cd1, cd2);
        cd1.CompareDurata(cd1, cd3);
        cd1.CompareDurata(cd2, cd3);
    }
}
