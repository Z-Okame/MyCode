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
    /**
     * Metodo per passare alla schermata della battaglia, con il Pokemon scelto dal giocatore
     * @param event Evento di click sul bottone "Continua"
     * @throws IOException Eccezione in caso di problemi con il caricamento del file FXML della schermata della battaglia
     */
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

    /**
     * Metodo per leggere il numero di Pokemon da inserire nella battaglia
     * @return Il numero di Pokemon scelto dal giocatore, o un valore di default se il campo è vuoto o non valido
     */
    private int parseNumeroPokemon() {
        //Valore di default se il campo è vuoto o non è un numero valido
        int defaultValue = 2;
        String text = numeroPokemonField.getText();

        //Se il campo è vuoto o contiene solo spazi, ritorna il valore di default
        if (text == null || text.isBlank()) {
            return defaultValue;
        }

        //Se il campo non ha un numero valido, ritorna il valore di default
        try {
            int value = Integer.parseInt(text.trim());
            if (value < 2) {
                return 2; // Il numero minimo di Pokemon per la battaglia è 2
            }
            if (value > 151) {
                return 151; // Il numero massimo di Pokemon disponibili è 151
            }
            return value;
        } catch (NumberFormatException ex) {
            return defaultValue;
        }
    }

    /**
     * Metodo per creare un roster di Pokemon nemici casuale per la battaglia
     * @param numeroPokemon numero specificato dal giocatore nel setup
     * @return
     */
    private ArrayList<Pokemon> creaRosterCasuale(int numeroPokemon) {
       
        //Crea una lista con tutti i Pokemon e un'altra con i pokemon candidati (escludendo quello del giocatore)
        ArrayList<Pokemon> allPokemon = Main.getPokemonList();
        ArrayList<Pokemon> roster = new ArrayList<>();

        Collections.shuffle(allPokemon); // Mescola la lista di tutti i Pokemon per ottenere una selezione casuale

        //Aggiunge sempre il Pokemon del giocatore, cosi in battaglia puo essere marcato correttamente
        roster.add(pokemonGiocatore);
        

        //Aggiunge alla lista dei candidati il numero di pokemon specificato dal giocatore, escludendo quello scelto da lui
        for (int i = 0; i < allPokemon.size() && roster.size() < numeroPokemon; i++) {
            Pokemon p = allPokemon.get(i);
            if (p.getId() != pokemonGiocatore.getId()) {
                roster.add(p);
            }
        }


        return roster;
    }
}
