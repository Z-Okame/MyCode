import java.util.ArrayList;

public class Biblioteca {
    ArrayList<Pubblicazione> pubblicazioni;

    public Biblioteca(int dim) {
        this.pubblicazioni = new ArrayList<>(dim);
    }

    public void aggiungiPubblicazione(Pubblicazione p) {
        if (!pubblicazioni.contains(p))
            pubblicazioni.add(p);
    }

    public void rimuoviPubblicazione(Pubblicazione p) {
        pubblicazioni.remove(p);
    }

    public Pubblicazione Prestito(Pubblicazione p) {
        
        if (pubblicazioni.contains(p)) {
            pubblicazioni.remove(p);
            return p;
        }
        else 
            return null;
    }

    public String Restituzione(Pubblicazione p) {
        if (!pubblicazioni.contains(p)) {
            aggiungiPubblicazione(p);
            return "Restituzione avvenuta con successo";
        }
        else 
            return "Errore nella restituzione";

    }
}
