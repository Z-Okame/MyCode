import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;

public class ConvertitoreController {

    @FXML
    private Button btnChiudi;

    @FXML
    private Button btnDollari;

    @FXML
    private Button btnEuro;

    @FXML
    private TextField tfDollari;

    @FXML
    private TextField tfEuro;

    @FXML
    void btnChiudiEvent(ActionEvent event) {
            System.exit(0);
    }

    @FXML
    void btnDollariEvent(ActionEvent event) {
        String dollariText = tfDollari.getText();
        try {
            double dollariAmount = Double.parseDouble(dollariText);
            double euroAmount = dollariAmount / 1.17;
            tfDollari.setText(String.format("%.2f", euroAmount));
        } catch (NumberFormatException e) {
            tfDollari.setText("Invalid input");
        }
    }

    @FXML
    void btnEuroEvent(ActionEvent event) {
        String euroText = tfEuro.getText();
        try {
            double euroAmount = Double.parseDouble(euroText);
            double dollarAmount = euroAmount * 1.17;
            tfEuro.setText(String.format("%.2f", dollarAmount));
        } catch (NumberFormatException e) {
            tfEuro.setText("Invalid input");
        }
    }

}