import java.time.LocalDate;

public class Libro extends Pubblicazione {
    private String ISBN;
    private String autore;

    //costruttore
    public Libro(String titolo, LocalDate dataPubblicazione, int numPagine, String ISBN, String autore) {
        super(titolo, dataPubblicazione, numPagine);
        this.ISBN = ISBN;
        this.autore = autore;
    }

    //getters and setters
    public String getISBN() {
        return ISBN;
    }

    public void setISBN(String iSBN) {
        this.ISBN = iSBN;
    }

    public String getAutore() {
        return autore;
    }

    public void setAutore(String autore) {
        this.autore = autore;
    }

    //metodo
    public String toString() {
        return super.toString() + ", ISBN=" + ISBN + ", autore=" + autore;
    }


}
