public class Main {

	public static void main(String[] args) {
		
		Applicazione app = new Applicazione();
		
		Spesa s1 = new Spesa("01/01/2024", 100.0, "Cibo", "Contanti");
		Spesa s2 = new Spesa("02/01/2024", 50.0, "Trasporti", "Carta di credito");
		Spesa s3 = new Spesa("03/01/2024", 75.0, "Cibo", "Carta di debito");
		
		s1.applicaIVA();
		s2.applicaIVA();
		s3.applicaIVA();

		app.setSpesa(s1, 0);
		app.setSpesa(s2, 1);
		app.setSpesa(s3, 2);
		
		// stampa la spesa totale
		System.out.println("Spesa totale complessiva: " + app.calcolaSpesaTotaleComplessiva());
		//stampa la spesa media
		System.out.println("Spesa media: " + app.calcolaSpesaMedia());
		// stampa la spesa minima
		System.out.println("Spesa minima: " + app.calcolaSpesaMinima());
		// stampa la spesa massima
		System.out.println("Spesa massima: " + app.calcolaSpesaMassima());
		// stampa la spesa totale media più alta per categoria
		System.out.println(app.calcolaCategoriaConSpesaMediaPiùAlta());
		// stampa la spesa totale media più bassa per categoria
		System.out.println(app.calcolaCategoriaConSpesaMediaPiùBassa());
		// stampa la spesa totale più alta per modalità di pagamento
		System.out.println(app.calcolaModalitàDiPagamentoConSpesaTotalePiùAlta());
		// stampa la spesa totale più bassa per modalità di pagamento
		System.out.println(app.calcolaModalitàDiPagamentoConSpesaTotalePiùBassa());
		

		}
	}

