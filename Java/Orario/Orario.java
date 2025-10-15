package Java.Orario;

public class Orario {
    int ore;
    int minuti;
    int secondi;

    //costruttore
    public Orario(int ore, int minuti, int secondi) {
        setOre(ore);
        setMinuti(minuti);
        setSecondi(secondi);
    }

    public Orario() {
        this.ore = 0;
        this.minuti = 0;
        this.secondi = 0;
    }

    //getter
    public int getOre() {
        return ore;
    }
    public int getMinuti() {
        return minuti;
    }
    public int getSecondi() {
        return secondi;
    }

    //setter
    public void setOre(int ore) {
        if (ore <= 23 && ore >=0) {
            this.ore = ore;
        }
        else
            this.ore = 0;
    }
    public void setMinuti(int minuti) {
        if (minuti <= 59 && minuti >=0) {
            this.minuti = minuti;
        }
        else
            this.minuti = 0;
    }
    public void setSecondi(int secondi) {
        if (secondi <= 59 && secondi >=0) {
            this.secondi = secondi;
        }
        else
            this.secondi = 0;
    }

    //metodi
    void tic() {
        setSecondi(secondi + 1);
        if (getSecondi() == 0) {
            setMinuti(minuti + 1);
            if (getMinuti() == 0) {
                setOre(ore + 1);
            }
        }
    }

    void aggiungiMinuti(int m) {
        setOre(getOre() + ((getOre() + m)/60) % 24);
        setMinuti(getMinuti() + ((getMinuti() + minuti) % 60));
        }
    

    String mostra() {
        return String.format("%02d:%02d:%02d", ore, minuti, secondi);
    }

    boolean ugualeA(Orario altro) {
        if (this.getOre() == altro.getOre() && this.getMinuti() == altro.getMinuti() && this.getSecondi() == altro.getSecondi())
            return true;
        return false;
    }

}

