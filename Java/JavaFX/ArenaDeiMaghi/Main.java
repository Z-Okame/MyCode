import java.util.ArrayList;
/**
 * TO DO:
 * - Implementa istanzazione dinamica dei maghi (Quanti Pokémon vuoi?)
 * - Implementa la grafica dell'arena
 * - Modifica criterio del target
 * - Implementa ereditarietà nelle spell per dare PP solo alle cure
 * - Finisci di dare ID al combatimento e fai il codice
 *  -------------------------------------------------------------------
 */
public class Main {

	public static void main(String[] args) {
		ArrayList<Wizard> maghi = new ArrayList<>();

		Wizard steve = new Wizard("Steve", "Steve");
		Wizard goku = new Wizard("Kakarot", "Goku");
		Wizard merlin = new Wizard("Merlin", "Merlin");

		inizializzaSpell(steve);
		inizializzaSpell(goku);
		inizializzaSpell(merlin);

		maghi.add(steve);
		maghi.add(goku);
		maghi.add(merlin);


		Arena arena = new Arena(maghi);
		arena.playMatch();

		Wizard vincitore = arena.getWinner();
		if (vincitore != null) {
			System.out.println("\nIl vincitore e': " + vincitore.getAlias());
		} else {
			System.out.println("\nNessun vincitore determinato.");
		}
	}

	private static void inizializzaSpell(Wizard wizard) {
		wizard.getSpells().add(new Spell("Palla di Fuoco", 10, 20, "ATTACCO", 99));
		wizard.getSpells().add(new Spell("Lancia Fulminea", 8, 15, "ATTACCO", 99));
		wizard.getSpells().add(new Spell("Cura Minore", 7, 7, "CURA", 3));
		wizard.getSpells().add(new Spell("Cura Maggiore", 12, 11, "CURA", 2));
	}
}
