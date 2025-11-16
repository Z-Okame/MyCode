public class PortaCD {

    private CD[] PortaCD;
    private int N;

    public PortaCD(int N) {
        this.N = N;
        this.PortaCD = new CD[N];
    }

    //getter
    public CD getCD(int n) {
        if ((n < 0) || (n >= N)) {
             return null;
        }
        return PortaCD[n];
    }
    
    //setter
    public int setCD(CD cd, int n) {
        if ((n < 0) || (n >= N)) {
            return -1;
        }
        if (PortaCD[n] != null) {
            return -2;
        }
        PortaCD[n] = cd;
        return 0;
    }

    //methods

    /**
     * Rimuove il CD in posizione n
     * @param n posizione del CD da rimuovere
     */
    public void killCD(int n) {
        if ((n < 0) || (n >= N)) {
            return;
        }
        PortaCD[n] = null;
    }

    /**
     * Conta i CD presenti nel PortaCD
     * @return numero di CD presenti
     */
    public int getN() {
        int c = 0;
        for (int i = 0; i < N; i++) {
            if (PortaCD[i] != null) {
                c++;
            }
        }
        return c;
    }

    /**
     * Cerca un CD per titolo
     * @param titolo titolo del CD da cercare
     * @return posizione del CD trovato, -1 se non trovato
     */
    public int cercaCDperTitolo(String titolo) {
        for (int i = 0; i < N; i++) {
            if (PortaCD[i] != null && PortaCD[i].getTitolo().equals(titolo)) {
                return i;
            }
        }
        return -1;
    }

    /**
     * toString del PortaCD
     */
    public String toString() {
        String result = "PortaCD contiene:\n";
        for (int i = 0; i < N; i++) {
            if (PortaCD[i] != null) {
                result += "Posizione " + i + ": " + PortaCD[i].toString() + "\n";
            } else {
                result += "Posizione " + i + ": vuota\n";
            }
        }
        return result;
    }

    /**
     * Confronta la collezione di CD con un'altra collezione
     * @param p1 altra collezione di CD
     * @return numero di CD in comune
     */
    public int confrontaCollezione(PortaCD p1) {
        int c = 0;
        for (int i = 0; i < N; i++) {
            if (PortaCD[i] != null) {
                for (int j = 0; j < p1.N; j++) {
                    if (p1.getCD(j) != null) {
                        if (PortaCD[i].getTitolo().equals(p1.getCD(j).getTitolo()) && PortaCD[i].getAutore().equals(p1.getCD(j).getAutore()))
                            c++;
                    }
                }    
            }
        }
        return c;   
    }
}
