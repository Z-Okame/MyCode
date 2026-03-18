import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.layout.TilePane;
import javafx.stage.Stage;
import javafx.geometry.Insets;
import java.util.ArrayList;
import java.io.IOException;

public class SelezionePokemonController {

    @FXML
    private Button CloseButton;

    @FXML
    private TilePane tilePane;

    @FXML
    void CloseStage(ActionEvent event) {
        System.exit(0);
    }

    /**
     * Metodo per passare alla schermata di setup della battaglia, con il Pokemon scelto dal giocatore
     * @param pokemonGiocatore il Pokemon scelto dal giocatore
     * @throws IOException Eccezione in caso di problemi con il caricamento del file FXML della schermata di setup della battaglia
     */
    private void goToSetupConPokemonGiocatore(Pokemon pokemonGiocatore) throws IOException {
        FXMLLoader loader = new FXMLLoader(getClass().getResource("SetupBattaglia.fxml"));
        Parent root = loader.load();

        SetupBattagliaController controller = loader.getController();
        controller.setPokemonGiocatore(pokemonGiocatore);

        Stage stage = (Stage) tilePane.getScene().getWindow();
        stage.setScene(new Scene(root, 420, 260));
        stage.show();
    }
    
    /**
     * Metodo per creare dinamicamente HBOX per ogni mago 
     */
    public void initialize(ArrayList<Pokemon> maghi) {

        for (Pokemon mago : maghi) {
            // Creo un HBox per ogni mago
            HBox MagoBox = new HBox();
            MagoBox.setPadding(new Insets(10));
            MagoBox.setStyle("-fx-border-color: #333; -fx-border-width: 1; -fx-background-color: #f0f0f0;");
            MagoBox.setSpacing(10);

            // ImageView placeholder da sostituire
            ImageView imageView = new ImageView();
            imageView.setFitWidth(80);
            imageView.setFitHeight(80);
            imageView.setPreserveRatio(true);

            // Caricamento diretto dalla cartella tramite file:
            String imagePath = String.format("file:spritePokémonFront/Spr_1b_%03d.png", mago.getId());
            imageView.setImage(new Image(imagePath));

            // VBox per gli attributi del mago
            VBox attributi = new VBox();
            attributi.getChildren().addAll( 
                new Label("Nome: " + mago.getNome()),
                new Label("Alias: " + mago.getAlias()),
                new Label("HP: " + mago.getHp() + "/" + mago.getHpmax()),
                new Label("Mana: " + mago.getMana() + "/" + mago.getManamax()),
                new Label("Potenza Magica: " + mago.getPotenzaMagica()),
                new Label("Difesa: " + mago.getDifesa()),
                new Label("Velocità: " + mago.getVelocità()),
                new Label( "Clicca per selezionare questo Pokemon")
            );

        //Lambda expression assegnata ad ogni box
        //Gestisce il click portando al setup della battaglia con il Pokemon scelto
            MagoBox.setOnMouseClicked(e -> {
                try {
                goToSetupConPokemonGiocatore(mago);
                } catch (IOException ex) {
                throw new RuntimeException(ex);
                }
            }
            );

            // metto assieme 
            MagoBox.getChildren().addAll(imageView, attributi);
            tilePane.getChildren().add(MagoBox);
        }
    }

}
