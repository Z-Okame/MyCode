import java.time.LocalDate;

public class Main {
    public static void main(String[] args) {
        Libro libro1 = new Libro("Il Signore degli Anelli", LocalDate.of(1954, 7, 29), 1216, "978-0261102385", "J.R.R. Tolkien");
        Rivista rivista1 = new Rivista("National Geographic", LocalDate.of(2024, 6, 1), 100, true);

        Biblioteca biblioteca = new Biblioteca(10);
        biblioteca.aggiungiPubblicazione(libro1);
        biblioteca.aggiungiPubblicazione(rivista1);

        System.out.println("Pubblicazioni in biblioteca dopo l'aggiunta:");
        for (Pubblicazione p : biblioteca.pubblicazioni) {
            System.out.println(p);
        }

        Pubblicazione prestito = biblioteca.Prestito(libro1);
        if (prestito != null) {
            System.out.println("\nPrestito effettuato per: " + prestito);
        } else {
            System.out.println("\nLa pubblicazione non è disponibile per il prestito.");
        }

        System.out.println("\nPubblicazioni in biblioteca dopo il prestito:");
        for (Pubblicazione p : biblioteca.pubblicazioni) {
            System.out.println(p);
        }

        String risultatoRestituzione = biblioteca.Restituzione(prestito);
        System.out.println("\n" + risultatoRestituzione);

        System.out.println("\nPubblicazioni in biblioteca dopo la restituzione:");
        for (Pubblicazione p : biblioteca.pubblicazioni) {
            System.out.println(p);
        }
    }
}
