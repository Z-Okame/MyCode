public class Spell {
    private String nome;
    private int costoBase;
    private int valoreBase;
    private String tipo; // "ATTACCO", "CURA"

    public Spell(String nome, int costoBase, int valoreBase, String tipo) {
        this.nome = nome;
        this.costoBase = costoBase;
        this.valoreBase = valoreBase;
        this.tipo = tipo;
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
}