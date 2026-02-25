import java.util.ArrayList;

public class Utente {
    private String nome;
    private String cognome;
    private String recapito;
    ArrayList<Pubblicazione> pubblicazioni_in_prestito;

    //CONSTRUCTOR
    public Utente(String nome, String cognome, String recapito, ArrayList<Pubblicazione> pubblicazioni_in_prestito) {
        this.nome = nome;
        this.cognome = cognome;
        this.recapito = recapito;    
        pubblicazioni_in_prestito = new ArrayList<Pubblicazione>();
    }

    //GETTERS AND SETTERS
    public String getNome() {
        return nome;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }


    public String getCognome() {
        return cognome;
    }
    public void setCognome(String cognome) {
        this.cognome = cognome;
    }


    public String getRecapito() {
        return recapito;
    }
    public void setRecapito(String recapito) {
        this.recapito = recapito;
    }


    public ArrayList<Pubblicazione> getPubblicazioni_in_prestito() {
        return pubblicazioni_in_prestito;
    }
    public void setPubblicazioni_in_prestito(ArrayList<Pubblicazione> pubblicazioni_in_prestito) {
        this.pubblicazioni_in_prestito = pubblicazioni_in_prestito;
    }

    //METHODS

    public String scorriList(ArrayList<Pubblicazione> list){
        String str = "";
        for (Pubblicazione i : list) {
         str += i.toString();
        }
        return str;
    } 


    public String toString() {
        return "Utente: " +  "Nome: " + this.nome + ",Cognome: " + this.cognome + ",Recapito: " + this.recapito + scorriList(pubblicazioni_in_prestito);
    }
}
