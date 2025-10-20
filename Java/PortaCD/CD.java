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

    public CD () {
        this.titolo = "";
        this.autore = "";
        this.numBrani = 0;
        this.durataTotale = 0;
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
    
    public String CompareDurata(CD cd1, CD cd2) {
        if (this.durataTotale > cd1.getDurataTotale() && this.durataTotale > cd2.durataTotale)
            return ("CD attuale");
        else if (cd1.getDurataTotale() > this.durataTotale && cd1.getDurataTotale() > cd2.getDurataTotale())
            return ("CD 1");
        return ("CD 2");

        /*if (cd1.getDurataTotale() > cd2.getDurataTotale()) {
            return ("CD 1");
        } else if (cd1.getDurataTotale() < cd2.getDurataTotale()) {
            return ("CD 2");
        } else {
            return ("I due CD hanno la stessa durata.");
        }*/
    }

    public static void main(String[] args) {
        CD cd1 = new CD("Uno come te", "Gigi d'Alessio", 14, 58);
        CD cd2 = new CD("La storia di Nino", "Nino d'Angelo", 10, 32);
        CD cd3 = new CD("Il mercante di Stelle", "Sal Da Vinci", 10, 37);
        System.out.println(cd1);
        System.out.println(cd2);
        System.out.println(cd3);
        System.out.println(cd3.CompareDurata(cd1, cd2));
    }
}
