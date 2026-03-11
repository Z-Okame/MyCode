import java.util.ArrayList;

public class Main {

	public static void main(String[] args) {
		ArrayList<Wizard> maghi = new ArrayList<>();

		Wizard steve = new Wizard("Steve", "Steve");
		Wizard goku = new Wizard("Kakarot", "Goku");

		inizializzaSpell(steve);
		inizializzaSpell(goku);

		maghi.add(steve);
		maghi.add(goku);

		Arena arena = new Arena(maghi);
		arena.playMatch();

		Wizard vincitore = arena.getWinner();
		if (vincitore != null) {
			System.out.println("\nIl vincitore e: " + vincitore.getAlias());
		} else {
			System.out.println("\nNessun vincitore determinato.");
		}
	}

	private static void inizializzaSpell(Wizard wizard) {
		wizard.getSpells().add(new Spell("Palla di Fuoco", 10, 20, "ATTACCO", 4));
		wizard.getSpells().add(new Spell("Lancia Fulminea", 8, 15, "ATTACCO", 6));
		wizard.getSpells().add(new Spell("Cura Minore", 7, 7, "CURA", 3));
		wizard.getSpells().add(new Spell("Cura Maggiore", 12, 11, "CURA", 2));
	}
}
