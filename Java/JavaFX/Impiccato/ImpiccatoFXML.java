import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;

public class ImpiccatoFXML extends Application {

    @Override
    public void start(Stage stage) throws Exception {
        Parent root = FXMLLoader.load(getClass().getResource("impiccato.fxml"));
        stage.setTitle("Impiccato");
        stage.setScene(new Scene(root, 620, 420));
        stage.show();
    }

    public static void main(String[] args) {
        launch();
    }
}
