import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;

public class ImpiccatoController {

    @FXML
    private Button btnChiudi;

    @FXML
    private ImageView imgImpiccato;

    @FXML
    private Label lblParolaDaScoprire;


    private int wrongGuesses = 0;

    public void initialize() {
        updateImage();
    }

    @FXML
    void btnChiudiEvent(ActionEvent event) {
        System.exit(0);
    }

    @FXML
    //Input
    void keyEvent(KeyEvent event) {
        
    }

    private void updateImage() {
        String imagePath = "file:img/" + wrongGuesses + ".png";
        imgImpiccato.setImage(new Image(imagePath));
    }

}
