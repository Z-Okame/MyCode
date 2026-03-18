import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import java.util.ArrayList;

public class ArenaDeiMaghiFXML extends Application {

    @Override
    public void start(Stage stage) throws Exception {
        ArrayList<Pokemon> maghi = Main.getPokemonList();

        FXMLLoader loader = new FXMLLoader(getClass().getResource("ArenaMaghiFXML.fxml"));
        Parent root = loader.load();

        ArenaMaghiFXMLController controller = loader.getController();
        controller.initialize(maghi);
        
        stage.setTitle("Arena dei Maghi");
        stage.setScene(new Scene(root, 920, 600));
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}
