import java.util.ArrayList;

public class Applicazione {
	ArrayList<Spesa> spese = new ArrayList<Spesa>(3);
	
	public void setSpesa(Spesa s, int index) {
		if (index < spese.size() && spese.get(index) == null)
			spese.set(index, s);
		else
			spese.add(s);
	}
	
	public void killSpesa(int index) {
		if (index < spese.size() && spese.get(index) == null)
			spese.remove(index);
		else return;
	}
	
	/***
	 * Metodo che crea una lista per le spese di tutte le categorie
	 * @param categoria
	 * @return Lista dinamica con le spese
	 */
	public ArrayList<Spesa> getSpesaByCategoria(String categoria) {
		ArrayList<Spesa> s = new ArrayList<Spesa>(1);
		for (int i = 0; i < spese.size(); i++) {
			if (spese.get(i).getCategoria().equals(categoria))
				s.add(spese.get(i));
		}
		return s;
	}
	
	/***
	 * Metodo che crea una lista dinamica di categorie
	 * @return Lista dinamica con le categorie
	 */
	public ArrayList<String> getCategorie(){
		ArrayList <String> categorie = new ArrayList<String>(1);
		for (int i = 0; i < spese.size(); i++) {
			if (! categorie.contains(spese.get(i).getCategoria()))
				categorie.add(spese.get(i).getCategoria());
		}
		return categorie;
	}
	
	/***
	 * Metodo che crea una lista per le spese di tutte le modalità di pagamento
	 * @param modalità
	 * @return Lista dinamica con le spese
	 */
	public ArrayList<Spesa> getSpesaByModalitàDiPagamento(String modalità) {
		ArrayList<Spesa> s = new ArrayList<Spesa>(1);
		for (int i = 0; i < spese.size(); i++) {
			if (spese.get(i).getModalità_pagamento().equals(modalità))
				s.add(spese.get(i));
		}
		return s;
	}
	
	
	/***
	 * Metodo che crea una lista per le modalità di pagamento
	 * @return Lista dinamica con modalità di pagamento
	 */
	public ArrayList<String> getModalitàDiPagamento(){
		ArrayList <String> categorie = new ArrayList<String>(1);
		for (int i = 0; i < spese.size(); i++) {
			if (! categorie.contains(spese.get(i).getModalità_pagamento()))
				categorie.add(spese.get(i).getModalità_pagamento());
		}
		return categorie;
	}
	
	/***
	 * Metodo che calcola la spesa totale complessiva
	 * @return spesa totale
	 */
	public double calcolaSpesaTotaleComplessiva() {
		double tot = 0;
		for (int i = 0; i < spese.size(); i++) {
			tot += spese.get(i).getImporto();
		}
		return tot;
	}
	
	/***
	 * Metodo che calcola la spesa media
	 * @return spesa media
	 */
	public double calcolaSpesaMedia() {
		return calcolaSpesaTotaleComplessiva() / spese.size();
	}
	
	/***
	 * Metodo che calcola la spesa minima
	 * @return spesa minima
	 */
	public double calcolaSpesaMinima() {
		double min = spese.get(0).getImporto();
		for (int i = 0; i < spese.size(); i++) {
			if(min < spese.get(i).getImporto() && spese.get(i) != null)
				min = spese.get(i).getImporto();
		}
		return min;
	}
	
	/***
	 * Metodo che calcola la spesa massima
	 * @return spesa massima
	 */
	public double calcolaSpesaMassima() {
		double max = spese.get(0).getImporto();
		for (int i = 0; i < spese.size(); i++) {
			if(max > spese.get(i).getImporto() && spese.get(i) != null)
				max = spese.get(i).getImporto();
		}
		return max;
	}
	
	/***
	 * Metodo che calcola la spesa totale di ogni categoria
	 * @param categoria
	 * @return totale delle spese di ogni categoria
	 */
	public double calcolaSpesaTotalePerCategoria(String categoria) {
		double tot = 0;
		ArrayList<Spesa> s1 = getSpesaByCategoria(categoria);
		for (int i = 0; i < s1.size(); i++) {
			tot += s1.get(i).getImporto();
		}
		return tot;
	}
	
	/***
	 * Metodo che calcola la spesa totale di ogni modalità
	 * @param modalità
	 * @return totale delle spese di ogni modalità
	 */
	public double calcolaSpesaTotalePerModalità(String modalità) {
		double tot = 0;
		ArrayList<Spesa> s1 = getSpesaByModalitàDiPagamento(modalità);
		for (int i = 0; i < s1.size(); i++) {
			tot += s1.get(i).getImporto();
		}
		return tot;
	}
	
	/***
	 * Metodo che calcola la spesa media di una categoria
	 * @param categoria
	 * @return spesa media della categoria
	 */
	public double calcolaSpesaMediaPerCategoria(String categoria) {
		return calcolaSpesaTotalePerCategoria(categoria) / getSpesaByCategoria(categoria).size();
	}
	
	/***
	 * Metodo che calcola la categoria con la spesa media più bassa
	 * @return Stringa con la categoria dalla spesa media più bassa
	 */
	public String calcolaCategoriaConSpesaMediaPiùBassa() {
		ArrayList<String> categorie = getCategorie();
		double[] medie = new double[categorie.size()];
		for (int i = 0; i < categorie.size(); i++) {
			medie[i] = calcolaSpesaMediaPerCategoria(categorie.get(i));
		}
		double min = medie[0];
		int c = 0;
		for (int i = 1; i < medie.length; i++) {
			if (medie[i] < min) {
				min = medie[i];
				c = i;
			}
		}
		return categorie.get(c) + " Ha la spesa media piu' bassa";
	}
	
	/***
	 * Metodo che calcola la categoria con la spesa media più alta
	 * @return Stringa con la categoria dalla spesa media più alta
	 */
	public String calcolaCategoriaConSpesaMediaPiùAlta() {
		ArrayList<String> categorie = getCategorie();
		double[] medie = new double[categorie.size()];
		for (int i = 0; i < categorie.size(); i++) {
			medie[i] = calcolaSpesaMediaPerCategoria(categorie.get(i));
		}
		double max = medie[0];
		int c = 0;
		for (int i = 1; i < medie.length; i++) {
			if (medie[i] > max) {
				max = medie[i];
				c = i;
			}
		}
		return categorie.get(c) + " Ha la spesa media piu' alta";
	}
	
	/***
	 * Metodo che calcola la modalità di pagamento con spesa totale più alta
	 * @return Stringa con la modalità dalla spessa totale più alta
	 */
	public String calcolaModalitàDiPagamentoConSpesaTotalePiùAlta() {
		ArrayList<String> modalità = getModalitàDiPagamento();
		double[] tots = new double[modalità.size()];
		for (int i = 0; i < modalità.size(); i++) {
			tots[i] = calcolaSpesaTotalePerModalità(modalità.get(i));
		}
		double max = tots[0];
		int c = 0;
		for (int i = 1; i < tots.length; i++) {
			if (tots[i] > max) {
				max = tots[i];
				c = i;
			}
		}
		return modalità.get(c) + " Ha la spesa totale piu' alta";
	}
	
	/***
	 * Metodo che calcola la modalità di pagamento con spesa totale più bassa
	 * @return Stringa con la modalità dalla spessa totale più bassa
	 */
	public String calcolaModalitàDiPagamentoConSpesaTotalePiùBassa() {
		ArrayList<String> modalità = getModalitàDiPagamento();
		double[] tots = new double[modalità.size()];
		for (int i = 0; i < modalità.size(); i++) {
			tots[i] = calcolaSpesaTotalePerModalità(modalità.get(i));
		}
		double min = tots[0];
		int c = 0;
		for (int i = 1; i < tots.length; i++) {
			if (tots[i] < min) {
				min = tots[i];
				c = i;
			}
		}
		return modalità.get(c) + " Ha la spesa totale piu' bassa";
	}
	
}