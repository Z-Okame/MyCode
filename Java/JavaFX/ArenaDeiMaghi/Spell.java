public class Spell {
    private String nome;
    private int costoBase;
    private int valoreBase;
    private String tipo; // "ATTACCO", "CURA"

    //PP: Punti Potere --> meccanica di Pokémon per limitare l'uso di un incantesimo, così da bilanciare il gioco
    //evitando cure infinite
    private int ppMassimi; 
    private int ppAttuali;

    public Spell(String nome, int costoBase, int valoreBase, String tipo, int ppMassimi) {
        this.nome = nome;
        this.costoBase = costoBase;
        this.valoreBase = valoreBase;
        this.tipo = tipo;
        this.ppMassimi = ppMassimi;
        this.ppAttuali = ppMassimi;
    }

    public String getNome() {
        return nome;
    }

    public int getCostoBase() {
        return costoBase;
    }

    public int getValoreBase() {
        return valoreBase;
    }

    public String getTipo() {
        return tipo;
    }

    public int getPpMassimi() {
        return ppMassimi;
    }

    public int getPpAttuali() {
        return ppAttuali;
    }

    public boolean hasPP() {
        return ppAttuali > 0;
    }

    public void consumaPP() {
        if (ppAttuali > 0) {
            ppAttuali--;
        }
    }
}