import java.util.ArrayList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
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
    private String parolaDaIndovinare; 
    private ArrayList<Character> lettereUsate = new ArrayList<>();
    private StringBuilder ParolaSconosciuta;


    /**
     * Funzione che inizializza il gioco
     */
    public void initialize() {
        updateImage();
        parolaDaIndovinare = chooseWord();
        InizializzaLabel();
    }

    @FXML
    void btnChiudiEvent(ActionEvent event) {
        System.exit(0);
    }

    @FXML
    /**
     * Gestione dell'input di gioco
     * @param event
     */
    void keyEvent(KeyEvent event) {

        if (event.getText().matches("[a-zA-Zx]")) {
            char lettera = event.getText().toLowerCase().charAt(0);
            
            
            // Boolean che indica se la lettera è stata trovata
            boolean letteraTrovata = false;

            //Controllo se la lettera è già stata usata, in caso contrario viene aggiunta all'ArrayList
            if (!(lettereUsate.contains(lettera))) {
                lettereUsate.add(lettera);
                //Ciclo di controllo nella parola
                for (int i = 0; i < parolaDaIndovinare.length(); i++) {
                    if (lettera == parolaDaIndovinare.charAt(i)) {
                        ParolaSconosciuta.setCharAt(i * 2, lettera);
                        letteraTrovata = true;
                    }
                }    
            }
            
            // Se la lettera non è stata trovata (o è già stata usata), incrementa gli errori
            if (!letteraTrovata) {
                wrongGuesses++;
                updateImage();
            }
            
            // Aggiorna la label
            lblParolaDaScoprire.setText(ParolaSconosciuta.toString());
        }

        //Controllo Vittoria
        if (!ParolaSconosciuta.toString().contains("_ ")) {
            Alert msg = new Alert(Alert.AlertType.INFORMATION);
            msg.setTitle("Vittoria");
            msg.setHeaderText(null);
            msg.setContentText("Complimenti hai vinto!!");
            msg.showAndWait();
            System.exit(0);
        }

        //Controllo Sconfitta
        if (wrongGuesses >= 10) {
            Alert msg = new Alert(Alert.AlertType.INFORMATION);
            msg.setTitle("Sconfitta");
            msg.setHeaderText(null);
            msg.setContentText("Mi dispiace, hai perso. La parola era: " + parolaDaIndovinare);
            msg.showAndWait();
            System.exit(0);
        }
    }

    /**
     *  Funzione che inizializza la label con la parola da indovinare
     */
    private void InizializzaLabel() {
        ParolaSconosciuta = new StringBuilder();
        for (int i = 0; i < parolaDaIndovinare.length(); i++) {
            ParolaSconosciuta.append("_ ");
        }
        lblParolaDaScoprire.setText(ParolaSconosciuta.toString());
    }

    /**
     * Funzione che sceglie una parola casuale dall'array di parole proveniente da Words.java
     * @return La parola scelta pseudocasualmente
     */
    private String chooseWord() {
        return Words.getWords()[(int) (Math.random() * Words.getWords().length)].toLowerCase();
    }

    /**
     * Funzione che aggiorna l'immagine dell'impiccato in base al numero di errori
     */
    private void updateImage() {
        String imagePath = "file:img/" + wrongGuesses + ".png";
        imgImpiccato.setImage(new Image(imagePath));
    }

}
