public class Lampadina {
    private String colore;
    private int potenza;
    static int numeroLampadineAccese = 0;    
    
    //costruttore
    Lampadina(String colore, int potenza) {
        this.colore = colore;
        this.potenza = potenza;
        numeroLampadineAccese++;
    }

    //getters
    public String getColore() {
        return colore;
    }

    public int getPotenza() {
        return potenza; 
    }

    //setters
    public void setColore(String colore) {
        this.colore = colore;
    }

    public void setPotenza(int potenza) {
        this.potenza = potenza;
    }

    //metodo
    public String stampaInfo() {
        return "Colore: " + this.colore + ", Potenza: " + this.potenza + "W" + ", Lampadine accese: " + Lampadina.numeroLampadineAccese;
    }

    public static void main(String[] args) {
        Lampadina lampadina1 = new Lampadina("Bianco", 60);
        Lampadina lampadina2 = new Lampadina("Giallo", 75);
        Lampadina lampadina3 = new Lampadina("Blu", 100);

        System.out.println(lampadina1.stampaInfo());
        System.out.println(lampadina2.stampaInfo());
        System.out.println(lampadina3.stampaInfo());
    }
}


        
