import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;
import java.util.ArrayList;

public class ArenaDeiMaghiFXML extends Application {

    @Override
    public void start(Stage stage) throws Exception {
        // Creo i maghi
        ArrayList<Wizard> maghi = new ArrayList<>();
        maghi.add(new Wizard("Steve", "Steve"));
        maghi.add(new Wizard("Kakarot", "Goku"));
        maghi.add(new Wizard("Manuel", "Okame"));
        maghi.add(new Wizard("Merlino", "Best Mago Generico"));
        maghi.add(new Wizard("Rennala", "Regina del Plenilunio"));
        
        // Spezzo il loader, così posso passare i maghi al controller
        FXMLLoader loader = new FXMLLoader(getClass().getResource("ArenaMaghiFXML.fxml"));
        Parent root = loader.load(); // carica la scena come Parent
        
        // Estraggo il controller e passo i maghi
        ArenaMaghiFXMLController controller = loader.getController();
        controller.initialize(maghi); 
        
        stage.setTitle("Arena dei Maghi");
        stage.setScene(new Scene(root, 620, 420));
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}
