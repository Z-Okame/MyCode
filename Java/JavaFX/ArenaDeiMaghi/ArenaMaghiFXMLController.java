import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.ImageView;
import javafx.scene.layout.HBox;
import javafx.scene.layout.VBox;
import javafx.scene.layout.TilePane;
import javafx.geometry.Insets;
import java.util.ArrayList;

public class ArenaMaghiFXMLController {

    @FXML
    private Button CloseButton;
    
    @FXML
    private TilePane tilePane;

    @FXML
    void CloseStage(ActionEvent event) {
        System.exit(0);
    }
    
    /**
     * Metodo per creare dinamicamente HBOX per ogni mago 
     */
    public void initialize(ArrayList<Wizard> maghi) {

        for (Wizard mago : maghi) {
            // Creo un HBox per ogni mago
            HBox MagoBox = new HBox();
            MagoBox.setPadding(new Insets(10));
            MagoBox.setStyle("-fx-border-color: #333; -fx-border-width: 1; -fx-background-color: #f0f0f0;");
            
            // ImageView placeholder da sostituire
            ImageView imageView = new ImageView();
            imageView.setFitWidth(80);
            imageView.setFitHeight(80);
            
            // VBox per gli attributi del mago
            VBox attributi = new VBox();
            attributi.getChildren().addAll( 
                new Label("Nome: " + mago.getNome()),
                new Label("Alias: " + mago.getAlias()),
                new Label("HP: " + mago.getHp() + "/" + mago.getHpmax()),
                new Label("Mana: " + mago.getMana() + "/" + mago.getManamax()),
                new Label("Potenza Magica: " + mago.getPotenzaMagica()),
                new Label("Difesa: " + mago.getDifesa()),
                new Label("Velocità: " + mago.getVelocità())
            );
            
            // metto assieme 
            MagoBox.getChildren().addAll(imageView, attributi);
            tilePane.getChildren().add(MagoBox);
        }
    }

}
