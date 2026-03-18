import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import java.util.ArrayList;

public class SelezionePokemon extends Application {

    @Override
    public void start(Stage stage) throws Exception {
        ArrayList<Pokemon> maghi = Main.getPokemonList(); //Ottiene tutti e 151 i Pokémon dal Main

        FXMLLoader loader = new FXMLLoader(getClass().getResource("SelezionePokemon.fxml"));
        Parent root = loader.load();

        SelezionePokemonController controller = loader.getController();
        controller.initialize(maghi); //Passa al controller per creare i box dinamici
        
        stage.setTitle("Selezione Pokémon");
        stage.setScene(new Scene(root, 650, 600));
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}
