import java.util.ArrayList;
import java.util.Collections;
import javafx.application.Application;

public class Main {

	//Pool di spell disponibili per tutti i Pokémon
	private static final ArrayList<Spell> spellPool = createSpellPool();

	//Creo la lista con tutti i 151 Pokémon
	private static final ArrayList<Pokemon> pokemonList = createPokemonList();

	//Metodo per avviare l'applicazione JavaFX
	public static void main(String[] args) {
		Application.launch(SelezionePokemon.class, args);
	}

	//Metodo per passare la lista dei Pokémon agli altri controller
	public static ArrayList<Pokemon> getPokemonList() {
		return new ArrayList<>(pokemonList);
	}

	//Metodo per creare la lista dei Pokémon con i loro nomi e le spell iniziali
	private static ArrayList<Pokemon> createPokemonList() {
		ArrayList<Pokemon> maghi = new ArrayList<>();

		addPokemon(maghi, "Bulbasaur");
		addPokemon(maghi, "Ivysaur");
		addPokemon(maghi, "Venusaur");
		addPokemon(maghi, "Charmander");
		addPokemon(maghi, "Charmeleon");
		addPokemon(maghi, "Charizard");
		addPokemon(maghi, "Squirtle");
		addPokemon(maghi, "Wartortle");
		addPokemon(maghi, "Blastoise");
		addPokemon(maghi, "Caterpie");
		addPokemon(maghi, "Metapod");
		addPokemon(maghi, "Butterfree");
		addPokemon(maghi, "Weedle");
		addPokemon(maghi, "Kakuna");
		addPokemon(maghi, "Beedrill");
		addPokemon(maghi, "Pidgey");
		addPokemon(maghi, "Pidgeotto");
		addPokemon(maghi, "Pidgeot");
		addPokemon(maghi, "Rattata");
		addPokemon(maghi, "Raticate");
		addPokemon(maghi, "Spearow");
		addPokemon(maghi, "Fearow");
		addPokemon(maghi, "Ekans");
		addPokemon(maghi, "Arbok");
		addPokemon(maghi, "Pikachu");
		addPokemon(maghi, "Raichu");
		addPokemon(maghi, "Sandshrew");
		addPokemon(maghi, "Sandslash");
		addPokemon(maghi, "NidoranF");
		addPokemon(maghi, "Nidorina");
		addPokemon(maghi, "Nidoqueen");
		addPokemon(maghi, "NidoranM");
		addPokemon(maghi, "Nidorino");
		addPokemon(maghi, "Nidoking");
		addPokemon(maghi, "Clefairy");
		addPokemon(maghi, "Clefable");
		addPokemon(maghi, "Vulpix");
		addPokemon(maghi, "Ninetales");
		addPokemon(maghi, "Jigglypuff");
		addPokemon(maghi, "Wigglytuff");
		addPokemon(maghi, "Zubat");
		addPokemon(maghi, "Golbat");
		addPokemon(maghi, "Oddish");
		addPokemon(maghi, "Gloom");
		addPokemon(maghi, "Vileplume");
		addPokemon(maghi, "Paras");
		addPokemon(maghi, "Parasect");
		addPokemon(maghi, "Venonat");
		addPokemon(maghi, "Venomoth");
		addPokemon(maghi, "Diglett");
		addPokemon(maghi, "Dugtrio");
		addPokemon(maghi, "Meowth");
		addPokemon(maghi, "Persian");
		addPokemon(maghi, "Psyduck");
		addPokemon(maghi, "Golduck");
		addPokemon(maghi, "Mankey");
		addPokemon(maghi, "Primeape");
		addPokemon(maghi, "Growlithe");
		addPokemon(maghi, "Arcanine");
		addPokemon(maghi, "Poliwag");
		addPokemon(maghi, "Poliwhirl");
		addPokemon(maghi, "Poliwrath");
		addPokemon(maghi, "Abra");
		addPokemon(maghi, "Kadabra");
		addPokemon(maghi, "Alakazam");
		addPokemon(maghi, "Machop");
		addPokemon(maghi, "Machoke");
		addPokemon(maghi, "Machamp");
		addPokemon(maghi, "Bellsprout");
		addPokemon(maghi, "Weepinbell");
		addPokemon(maghi, "Victreebel");
		addPokemon(maghi, "Tentacool");
		addPokemon(maghi, "Tentacruel");
		addPokemon(maghi, "Geodude");
		addPokemon(maghi, "Graveler");
		addPokemon(maghi, "Golem");
		addPokemon(maghi, "Ponyta");
		addPokemon(maghi, "Rapidash");
		addPokemon(maghi, "Slowpoke");
		addPokemon(maghi, "Slowbro");
		addPokemon(maghi, "Magnemite");
		addPokemon(maghi, "Magneton");
		addPokemon(maghi, "Farfetchd");
		addPokemon(maghi, "Doduo");
		addPokemon(maghi, "Dodrio");
		addPokemon(maghi, "Seel");
		addPokemon(maghi, "Dewgong");
		addPokemon(maghi, "Grimer");
		addPokemon(maghi, "Muk");
		addPokemon(maghi, "Shellder");
		addPokemon(maghi, "Cloyster");
		addPokemon(maghi, "Gastly");
		addPokemon(maghi, "Haunter");
		addPokemon(maghi, "Gengar");
		addPokemon(maghi, "Onix");
		addPokemon(maghi, "Drowzee");
		addPokemon(maghi, "Hypno");
		addPokemon(maghi, "Krabby");
		addPokemon(maghi, "Kingler");
		addPokemon(maghi, "Voltorb");
		addPokemon(maghi, "Electrode");
		addPokemon(maghi, "Exeggcute");
		addPokemon(maghi, "Exeggutor");
		addPokemon(maghi, "Cubone");
		addPokemon(maghi, "Marowak");
		addPokemon(maghi, "Hitmonlee");
		addPokemon(maghi, "Hitmonchan");
		addPokemon(maghi, "Lickitung");
		addPokemon(maghi, "Koffing");
		addPokemon(maghi, "Weezing");
		addPokemon(maghi, "Rhyhorn");
		addPokemon(maghi, "Rhydon");
		addPokemon(maghi, "Chansey");
		addPokemon(maghi, "Tangela");
		addPokemon(maghi, "Kangaskhan");
		addPokemon(maghi, "Horsea");
		addPokemon(maghi, "Seadra");
		addPokemon(maghi, "Goldeen");
		addPokemon(maghi, "Seaking");
		addPokemon(maghi, "Staryu");
		addPokemon(maghi, "Starmie");
		addPokemon(maghi, "MrMime");
		addPokemon(maghi, "Scyther");
		addPokemon(maghi, "Jynx");
		addPokemon(maghi, "Electabuzz");
		addPokemon(maghi, "Magmar");
		addPokemon(maghi, "Pinsir");
		addPokemon(maghi, "Tauros");
		addPokemon(maghi, "Magikarp");
		addPokemon(maghi, "Gyarados");
		addPokemon(maghi, "Lapras");
		addPokemon(maghi, "Ditto");
		addPokemon(maghi, "Eevee");
		addPokemon(maghi, "Vaporeon");
		addPokemon(maghi, "Jolteon");
		addPokemon(maghi, "Flareon");
		addPokemon(maghi, "Porygon");
		addPokemon(maghi, "Omanyte");
		addPokemon(maghi, "Omastar");
		addPokemon(maghi, "Kabuto");
		addPokemon(maghi, "Kabutops");
		addPokemon(maghi, "Aerodactyl");
		addPokemon(maghi, "Snorlax");
		addPokemon(maghi, "Articuno");
		addPokemon(maghi, "Zapdos");
		addPokemon(maghi, "Moltres");
		addPokemon(maghi, "Dratini");
		addPokemon(maghi, "Dragonair");
		addPokemon(maghi, "Dragonite");
		addPokemon(maghi, "Mewtwo");
		addPokemon(maghi, "Mew");

		return maghi;
	}

	//Metodo per aggiungere un Pokémon alla lista con le spell iniziali
	private static void addPokemon(ArrayList<Pokemon> maghi, String nome) {
		Pokemon pokemon = new Pokemon(nome, nome);
		inizializzaSpell(pokemon);
		maghi.add(pokemon);
	}

	private static ArrayList<Spell> createSpellPool() {
		ArrayList<Spell> pool = new ArrayList<>();
		// Attacchi
		pool.add(new Spell("Ruotafuoco", 10, 10, "ATTACCO", 99));
		pool.add(new Spell("Fulmine", 9, 5, "ATTACCO", 99));
		pool.add(new Spell("Surf", 11, 8, "ATTACCO", 99));
		pool.add(new Spell("Botta", 8, 2, "ATTACCO", 99));
		pool.add(new Spell("Turbine", 13, 12, "ATTACCO", 99));
		pool.add(new Spell("Pistolacqua", 7, 4, "ATTACCO", 99));
		pool.add(new Spell("Iper Raggio", 12, 9, "ATTACCO", 99));
		pool.add(new Spell("Psichico", 10, 7, "ATTACCO", 99));
		pool.add(new Spell("Terremoto", 14, 11, "ATTACCO", 99));
		pool.add(new Spell("Gela", 9, 6, "ATTACCO", 99));
		// Cure
		pool.add(new Spell("Cura Minore", 7, 7, "CURA", 3));
		pool.add(new Spell("Cura Maggiore", 12, 11, "CURA", 2));
		pool.add(new Spell("Ripresa", 15, 15, "CURA", 1));
		return pool;
	}

	/**
	 * Metodo che assegna 4 mosse ad ogni Pokemon
	 * @param pokemon Il Pokemon a cui assegnare le mosse
	 */
	private static void inizializzaSpell(Pokemon pokemon) {
		// Crea una copia della pool di spell, la mescola, e assegna le prime 4 al Pokémon
		ArrayList<Spell> shuffledSpells = new ArrayList<>(spellPool);
		Collections.shuffle(shuffledSpells);
		
		// Assegna le prime 4 mosse
		for (int i = 0; i < 4 && i < shuffledSpells.size(); i++) {
			pokemon.getSpells().add(shuffledSpells.get(i)); //Aggiungo allo spellbook del Pokemon la spell
		}
	}
}
