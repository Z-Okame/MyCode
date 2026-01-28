import javafx.application.Application;
import javafx.event.Event;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;
import javafx.scene.layout.Border;
import javafx.scene.layout.BorderPane;

public class Calcolatrice extends Application{
    
    private Button[] buttons;
    private TextField risultato;
    private String[] strings = {
                                "1", "2", "3", "X",
                                "4", "5", "6", "+",
                                "7", "8", "9", "/",
                                ",", "0", "=", "-"
                                };
    
    public void start(Stage stage) {

        buttons = new Button[16];

        BorderPane root = new BorderPane();

        Button btnChiudi = new Button("Chiudi");
        root.setTop(btnChiudi);
        btnChiudi.setOnAction(e -> stage.close());

        GridPane tastiera = new GridPane();
        root.setCenter(tastiera);
        tastiera.setHgap(4);
        tastiera.setVgap(4);

        for(int i = 0; i < 16; i++) {
            buttons[i] = new Button(strings[i]);
            int riga = i/4;
            int colonna = i%4;
            buttons[i].setOnAction(e -> clickBottone(e));
            tastiera.add(buttons[i],colonna,riga);
        }

        risultato = new TextField();
        root.setBottom(risultato);

        root.setPadding(new Insets(15));

        stage.setScene(new Scene(root, 300, 200));
        stage.show();


    }

    private void clickBottone(Event e) {
        Button btn = (Button) e.getSource();
        risultato.appendText(btn.getText());
    }



    public static void main(String[] args) { launch(); }
}
