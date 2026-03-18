import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Node;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.stage.Stage;

public class SetupBattagliaController {

    @FXML
    private TextField numeroPokemonField;

    @FXML
    private Label pokemonSceltoLabel;

    @FXML
    private Button continuaButton;

    private Pokemon pokemonGiocatore;

    @FXML
    void initialize() {
        numeroPokemonField.setText("6");
    }

    @FXML
    void continuaVersoBattaglia(ActionEvent event) throws IOException {
        int numeroPokemon = parseNumeroPokemon();
        ArrayList<Pokemon> roster = creaRosterCasuale(numeroPokemon);

        FXMLLoader loader = new FXMLLoader(getClass().getResource("CombattimentoPokémon.fxml"));
        Parent root = loader.load();

        BattagliaPokémonController controller = loader.getController();
        controller.setArenaData(roster, pokemonGiocatore);

        Stage stage = (Stage) ((Node) event.getSource()).getScene().getWindow();
        stage.setScene(new Scene(root, 900, 600));
        stage.show();
    }

    public void setPokemonGiocatore(Pokemon pokemonGiocatore) {
        this.pokemonGiocatore = pokemonGiocatore;
        if (pokemonSceltoLabel != null && pokemonGiocatore != null) {
            pokemonSceltoLabel.setText("Pokemon giocatore: " + pokemonGiocatore.getAlias());
        }
    }

    private int parseNumeroPokemon() {
        int defaultValue = 6;
        String text = numeroPokemonField.getText();

        if (text == null || text.isBlank()) {
            return defaultValue;
        }

        try {
            return Integer.parseInt(text.trim());
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }

    private ArrayList<Pokemon> creaRosterCasuale(int numeroPokemon) {
        ArrayList<Pokemon> allPokemon = Main.getPokemonList();
        ArrayList<Pokemon> candidates = new ArrayList<>();

        for (Pokemon p : allPokemon) {
            if (pokemonGiocatore == null || p.getId() != pokemonGiocatore.getId()) {
                candidates.add(p);
            }
        }

        Collections.shuffle(candidates);

        int count = Math.max(2, numeroPokemon);
        count = Math.min(count, allPokemon.size());

        ArrayList<Pokemon> roster = new ArrayList<>();
        if (pokemonGiocatore != null) {
            roster.add(pokemonGiocatore);
        }

        int neededOpponents = Math.max(1, count - roster.size());
        for (int i = 0; i < neededOpponents && i < candidates.size(); i++) {
            roster.add(candidates.get(i));
        }

        return roster;
    }
}
