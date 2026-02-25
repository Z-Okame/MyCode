import javafx.application.Application;
import javafx.event.Event;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;
import javafx.scene.layout.BorderPane;

public class Calcolatrice extends Application{
    // Componenti dell'interfaccia grafica
    private Button[] buttons;
    private TextField risultato;
    private String[] strings = {
                                "1", "2", "3", "X",
                                "4", "5", "6", "+",
                                "7", "8", "9", "/",
                                ",", "0", "=", "-"
                                };
    
    // Variabili per gestire lo stato della calcolatrice
    private double primoNumero = 0;
    private String operatore = "";
    private boolean inizioNuovoNumero = true;
    private boolean operatorePremuto = false;
    
    //Stage che mostra la scena
    public void start(Stage stage) {

        //Array di bottoni per non crearli singolarmente
        buttons = new Button[16];

        //Borderpane Root - Radice, la base della grafica
        BorderPane root = new BorderPane();
        //Borderpane Per il displane, che metterai in alto per mostrare risultati + bottone di chiudi
        BorderPane display = new BorderPane();

        //Bottone per chiudere lo stage
        Button btnChiudi = new Button("Chiudi");
        btnChiudi.setOnAction(e -> stage.close()); //lambda expression, e parametro, -> operatore, stage.close() azione

        //La tastiera è un gridpane, che dispone gli elementi in griglia in base alla dimensione della finestra
        GridPane tastiera = new GridPane();
        //al centro del borderpane principale, root, imposto la tastiera a griglia
        root.setCenter(tastiera);
        //distanzio la griglia verticalmente e orizzontalmente
        tastiera.setHgap(4);
        tastiera.setVgap(4);

        // Creazione e posizionamento dei bottoni della calcolatrice
        for(int i = 0; i < 16; i++) {
            //creo un bottone per ciclo, con il contenuto che è il simbolo corrispondente all'indice di strings
            buttons[i] = new Button(strings[i]);
            //riga/4 per avere un numero da 0 a 3
            //colonna%4 per avere un numero da 0 a 3, in questo modo i bottoni vengono disposti in una griglia 4x4
            int riga = i/4;
            int colonna = i%4;
            //lambda expression che si attiva al click del bottone, e chiama il metodo clickBottone passando l'evento e
            buttons[i].setOnAction(e -> clickBottone(e));
            //aggiungo il bottone alla griglia, specificando prima la colonna e poi la riga
            tastiera.add(buttons[i],colonna,riga);
        }

        // Campo di testo per mostrare il risultato
        risultato = new TextField();
        //imposto il borderpane display al top del root, così sarà sopra la tastiera
        root.setTop(display);
        //al top del display invece imposto il bottone di chiudi, così sarà sopra il campo di testo del risultato
        display.setTop(btnChiudi);
        //al centro del display imposto il campo di testo del risultato, così sarà al centro del display e sotto il bottone di chiudi
        display.setCenter(risultato);
        //faccio un po' di padding al root, così non è attaccato ai bordi della finestra
        root.setPadding(new Insets(15));

        //faccio partire la scena, con il root come contenuto, e dimensioni 300x200
        stage.setScene(new Scene(root, 300, 200));
        stage.show();
        

    }

    /**
     * Metodo che gestisce il click sui bottoni della calcolatrice
     * @param e Evento di click
     */
    private void clickBottone(Event e) {
        Button btn = (Button) e.getSource();
        String valore = btn.getText();
        
        // il valore è un numero o una virgola
        if (valore.equals(",") || valore.equals("0") || valore.equals("1") 
            || valore.equals("2") || valore.equals("3") || valore.equals("4") 
        || valore.equals("5") || valore.equals("6") || valore.equals("7") 
        || valore.equals("8") || valore.equals("9")) 
        {
            // se inizioNuovoNumero è true, significa che stiamo iniziando a digitare un nuovo numero, 
            // quindi sostituiamo il testo del risultato con il nuovo valore, lo reimposti false così puoi continuare a fare append
            if (inizioNuovoNumero) { 
                risultato.setText(valore);
                inizioNuovoNumero = false;
            } else {
                risultato.appendText(valore); //attacca il nuovo valore al testo esistente, così puoi digitare numeri con più cifre
            }
        }
        // il valore è "="
        else if (valore.equals("=")) {
            calcolaRisultato(); //chiama calcola risultato
            operatore = ""; //resetta l'operatore, così puoi iniziare una nuova operazione
            inizioNuovoNumero = true; // imposta inizioNuovoNumero a true, così il prossimo numero che digiti sostituirà il risultato invece di essere attaccato
            operatorePremuto = false; // resetta operatorePremuto a false, così puoi premere un operatore dopo aver calcolato il risultato senza problemi
        } 
        // È un operatore 
        else {
            //controllo aggiuntivo. 
            // se operatorePremuto è true, significa che hai già premuto un operatore e stai premendo un altro operatore senza digitare un nuovo numero, quindi aggiorniamo semplicemente l'operatore senza calcolare il risultato
            if (operatorePremuto) { 
                operatore = valore; 
                return;
            }
            //primo numero quindi è soltanto il parsing del testo del risultato, sostituendo la virgola con il punto per gestire i numeri decimali
            primoNumero = Double.parseDouble(risultato.getText().replace(",", "."));
            //all'operatore assegniamo il valore del bottone premuto, così sappiamo quale operazione eseguire quando premiamo "="
            operatore = valore;
            inizioNuovoNumero = true; //inizia un nuovo numero, il secondo operando
            operatorePremuto = true; //sappi che hai già premuto un operatore
        }
    }
    /**
     * Metodo che calcola il risultato dell'operazione
     */
    private void calcolaRisultato() {
        //secondo numero, parsing del testo del risultato, sostituendo la virgola con il punto per gestire i numeri decimali
        double secondoNumero = Double.parseDouble(risultato.getText().replace(",", "."));
        double result = 0; //imposta il risultato iniziale a 0 
        
        //switch case per determinare l'operazione
        switch (operatore) {
            case "+":
                result = primoNumero + secondoNumero;
                break;
            case "-":
                result = primoNumero - secondoNumero;
                break;
            case "X":
                result = primoNumero * secondoNumero;
                break;
            case "/":
                try {
                    if  (secondoNumero == 0) {
                    throw new ArithmeticException("Divisione per zero non consentita");
                    }
                } catch (ArithmeticException e) {
                    risultato.setText("Errore: " + e.getMessage());
                    return;
                }
                result = primoNumero / secondoNumero;
                break;
        }
        
        risultato.setText(String.valueOf(result));
        primoNumero = result;
    }



    public static void main(String[] args) { launch(); }
}
