public class Persona {
    private String nome;
    private String cognome;
    private String codiceFiscale;

    //costruttore
    public Persona(String nome, String cognome, String codiceFiscale) {
        this.nome = nome;
        this.cognome = cognome;
        this.codiceFiscale = codiceFiscale;
    }

    //getter
    public String getNome() {
        return nome;
    }
    public String getCognome() {
        return cognome;
    }
    public String getCodiceFiscale() {
        return codiceFiscale;
    }
    //setter
    public void setNome(String nome) {
        this.nome = nome;
    }
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }
    public void setCodiceFiscale(String codiceFiscale) {
        this.codiceFiscale = codiceFiscale;
    }

    //metodo
    public String toString() {
        return "Nome: " + this.getNome() + 
               " Cognome: " + this.getCognome() + 
               " Codice Fiscale: " + this.getCodiceFiscale() + ".";
    }

}