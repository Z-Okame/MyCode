public class Libro {
    private String titolo;
    private String autore;
    private int numPagine;
    private double costo_Pagina = 0.05;
    final double COSTO_FISSO = 5.5;

    //costruttore
    public Libro(String titolo, String autore, int numPagine) {
        this.titolo = titolo;
        this.autore = autore;
        this.numPagine = numPagine;
    }

    public Libro() {
        this.titolo = "unnamed";
        this.autore = "unnamed";
        this.numPagine = 0;
    }

    //getter
    public String getTitolo() {
        return titolo;
    }
    public String getAutore() {
        return autore;
    }
    public int getNumPagine() {
        return numPagine;
    }
    public double getCosto_Pagina() {
        return costo_Pagina;
    }

    //setter
    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }
    public void setAutore(String autore) {
        this.autore = autore;
    }
    public void setNumPagine(int numPagine) {
        this.numPagine = numPagine;
    }
    public void setCosto_Pagina(double costo_Pagina) {
        this.costo_Pagina = costo_Pagina;
    }

    //metodi
    public double prezzo() {
        return (getNumPagine() * getCosto_Pagina()) + COSTO_FISSO;
    }

    public static void main(String[] args) {
        Libro l1 = new Libro("Ciao", "Gigi",13);
        Libro l2 = new Libro();
        l2.setAutore("Gigi");
        l2.setTitolo("Ciao2");
        l2.setNumPagine(26);
        System.out.println("Il prezzo di " + l2.getTitolo() + " e' " + l2.prezzo());
        System.out.println("Il prezzo di " + l1.getTitolo() + " e' " + l1.prezzo());
    }
}