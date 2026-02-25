import java.util.ArrayList;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.input.KeyEvent;
//Parte di codice, separiamo la logica, dalla grafica.
public class ImpiccatoController {

    @FXML
    private Button btnChiudi; //bottone per chiudere il gioco

    @FXML
    private ImageView imgImpiccato; //ImageView che mostra l'immagine dell'impiccato in base al numero di errori

    @FXML
    private Label lblParolaDaScoprire; //Label che mostra la parola da indovinare, con le lettere scoperte e quelle ancora nascoste

    private int wrongGuesses = 0; //variabile che tiene traccia del numero di errori commessi dal giocatore
    private String parolaDaIndovinare; //variabile che contiene la parola da indovinare
    private ArrayList<Character> lettereUsate = new ArrayList<>(); //ArrayList che tiene traccia delle lettere già usate dal giocatore, per evitare che vengano contate come errori se vengono ripetute
    private StringBuilder ParolaSconosciuta; //StringBuilder che rappresenta la parola da indovinare con le lettere ancora nascoste (rappresentate da "_ ") e quelle scoperte (rappresentate dalla lettera stessa), viene aggiornato ogni volta che il giocatore indovina una lettera corretta
    //StringbBuilder è utilizzato per la sua efficienza nella manipolazione di stringhe, poiché permette di modificare il contenuto senza creare nuovi oggetti stringa ogni volta, a differenza della classe String che è immutabile.

    /**
     * Funzione che inizializza il gioco
     */
    public void initialize() {
        updateImage(); //aggiorna l'immagine dell'impiccato all'inizio del gioco (0 errori)
        parolaDaIndovinare = chooseWord(); //sceglie la parola da indovinare
        InizializzaLabel(); //imposta la lable del gioco con la parola segreta
    }

    @FXML
    void btnChiudiEvent(ActionEvent event) {
        System.exit(0); //chiude lo stage
    }

    @FXML
    /**
     * Gestione dell'input di gioco, questo viene controllato tutta la partita, quindi è giusto che tenga la logica di gioco, 
     * in questo modo è più semplice gestire le vittorie e le sconfitte, e aggiornare la grafica in base alle azioni del giocatore
     * @param event
     */
    void keyEvent(KeyEvent event) {

        //Se è una lettera
        if (event.getText().matches("[a-zA-Zx]")) {
            char lettera = event.getText().toLowerCase().charAt(0); //salva il primo carattere dell'input, convertendolo in minuscolo per uniformità
            
            
            // Boolean che indica se la lettera è stata trovata
            boolean letteraTrovata = false;

            //Controllo se la lettera è già stata usata, in caso contrario viene aggiunta all'ArrayList
            if (!(lettereUsate.contains(lettera))) {
                lettereUsate.add(lettera);
                //Ciclo di controllo nella parola
                for (int i = 0; i < parolaDaIndovinare.length(); i++) { 
                    if (lettera == parolaDaIndovinare.charAt(i)) //un po' come controllare un array di char 
                    {
                        ParolaSconosciuta.setCharAt(i * 2, lettera);
                        letteraTrovata = true; //permette di non dare errore
                    }
                }    
            }
            
            // Se la lettera non è stata trovata (o è già stata usata), incrementa gli errori
            if (!letteraTrovata) {
                wrongGuesses++;
                updateImage(); //aggiorna l'immagine dell'impiccato in base al numero di errori
            }
            
            // Aggiorna la label
            lblParolaDaScoprire.setText(ParolaSconosciuta.toString()); //aggiorna la label con eventuali nuovi caratteri indovinati
        }

        //Controllo Vittoria
        //se non contiene _... hai vinto!
        if (!ParolaSconosciuta.toString().contains("_ ")) {
            Alert msg = new Alert(Alert.AlertType.INFORMATION);
            msg.setTitle("Vittoria");
            msg.setHeaderText(null);
            msg.setContentText("Complimenti hai vinto!!");
            msg.showAndWait();
            System.exit(0);
        }

        //Controllo Sconfitta
        //se hai superato i 10 errori, hai perso!
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
     * Funzione che inizializza la label con la parola da indovinare
     */
    private void InizializzaLabel() {
        ParolaSconosciuta = new StringBuilder(); //crea una nuova stringbuilder, tipo le stringhe in python, ma senza occupare memoria
        for (int i = 0; i < parolaDaIndovinare.length(); i++) {
            ParolaSconosciuta.append("_ "); //setta il _ _ _ _ _...
        }
        lblParolaDaScoprire.setText(ParolaSconosciuta.toString());//imposta la label
    }

    /**
     * Funzione che sceglie una parola casuale dall'array di parole proveniente da Words.java
     * @return La parola scelta pseudocasualmente in minuscolo
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
