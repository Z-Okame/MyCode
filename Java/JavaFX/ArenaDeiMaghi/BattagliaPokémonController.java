import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Alert;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextArea;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import java.util.ArrayList;

public class BattagliaPokémonController {

    @FXML
    private Label ContaTurniLabel;

    @FXML
    private Label HPCaster;

    @FXML
    private Label HPTarget;

    @FXML
    private Label ManaCaster;

    @FXML
    private Label ManaTarget;

    @FXML
    private Button NextTurnBtn;

    @FXML
    private Label NomeCaster;

    @FXML
    private Label NomeTarget;

    @FXML
    private TextArea StoricoTurniArea;

    @FXML
    private Label StoricoTurniLabel;

    @FXML
    private Label TitoloLabel;

    @FXML
    private ImageView caster;

    @FXML
    private TextArea mosseArea1;

    @FXML
    private TextArea mosseCaster;

    @FXML
    private ImageView target;

    private Arena arena;
    private AIController aiController = new AIController();
    private Pokemon pokemonGiocatore;

    @FXML
    void NextTurn(ActionEvent event) {
        if (arena == null) {
            return;
        }

        if (arena.getAliveWizards().size() <= 1) {
            Pokemon winner = arena.getWinner();
            if (winner != null) {
                appendLog("\nVincitore: " + winner.getAlias() + "!");
                new Alert(Alert.AlertType.INFORMATION, "La battaglia è terminata! Il vincitore è: " + winner.getAlias()).showAndWait();
            }
            return;
        }

        ArrayList<String> turnLog = arena.playTurn();
        appendLog(String.join("\n", turnLog));

        updateBattleView();

        if (arena.getAliveWizards().size() <= 1) {
            Pokemon winner = arena.getWinner();
            if (winner != null) {
                appendLog("\nVincitore: " + winner.getAlias() + "!");
            }
            NextTurnBtn.setDisable(true);
        }
    }

    public void setArenaData(ArrayList<Pokemon> roster, Pokemon selectedPlayer) {
        arena = new Arena(roster);
        pokemonGiocatore = selectedPlayer;

        for (Pokemon p : arena.getWizards()) {
            p.setPlayer(false);
        }
        if (pokemonGiocatore != null) {
            for (Pokemon p : arena.getWizards()) {
                if (p.getId() == pokemonGiocatore.getId()) {
                    p.setPlayer(true);
                    pokemonGiocatore = p;
                    break;
                }
            }
        }

        NextTurnBtn.setDisable(false);
        StoricoTurniArea.clear();
        appendLog("Battaglia avviata con " + roster.size() + " Pokemon.");
        if (pokemonGiocatore != null) {
            appendLog("Pokemon del giocatore: " + pokemonGiocatore.getAlias());
        }
        updateBattleView();
    }

    private void updateBattleView() {
        if (arena == null) {
            return;
        }

        ArrayList<Pokemon> alive = arena.getAliveWizards();
        ContaTurniLabel.setText("Turno: " + (arena.getTurno() - 1));

        Pokemon currentCaster = resolveCurrentCaster(alive);
        Pokemon currentTarget = resolveCurrentTarget(alive, currentCaster);

        if (currentCaster == null) {
            setPokemonView(null, true);
            setPokemonView(currentTarget, false);
            return;
        }

        setPokemonView(currentCaster, true);
        setPokemonView(currentTarget, false);
    }

    private Pokemon resolveCurrentCaster(ArrayList<Pokemon> alive) {
        if (alive.isEmpty()) {
            return null;
        }

        for (Pokemon p : alive) {
            if (p.isPlayer()) {
                pokemonGiocatore = p;
                return p;
            }
        }

        // Il Pokemon del giocatore e morto: lato caster vuoto.
        return null;
    }

    private Pokemon resolveCurrentTarget(ArrayList<Pokemon> alive, Pokemon currentCaster) {
        ArrayList<Pokemon> nonPlayerAlive = new ArrayList<>();
        for (Pokemon p : alive) {
            if (!p.isPlayer()) {
                nonPlayerAlive.add(p);
            }
        }

        if (nonPlayerAlive.isEmpty()) {
            return null;
        }

        if (currentCaster != null) {
            Pokemon targetFromAI = aiController.cercaMagoConPochiHp(nonPlayerAlive, currentCaster);
            if (targetFromAI != null) {
                return targetFromAI;
            }
        }

        Pokemon target = nonPlayerAlive.get(0);
        for (Pokemon p : nonPlayerAlive) {
            if (p.getHp() < target.getHp()) {
                target = p;
            }
        }
        return target;
    }

    private void setPokemonView(Pokemon p, boolean isCaster) {
        Label nome = isCaster ? NomeCaster : NomeTarget;
        Label hp = isCaster ? HPCaster : HPTarget;
        Label mana = isCaster ? ManaCaster : ManaTarget;
        TextArea mosse = isCaster ? mosseCaster : mosseArea1;
        ImageView sprite = isCaster ? caster : target;

        if (p == null) {
            nome.setText("-");
            hp.setText("HP: -");
            mana.setText("Mana: -");
            mosse.clear();
            sprite.setImage(null);
            return;
        }

        nome.setText(p.getAlias());
        hp.setText("HP: " + p.getHp() + "/" + p.getHpmax());
        mana.setText("Mana: " + p.getMana() + "/" + p.getManamax());
        mosse.setText(formatMosse(p));

        String pattern = isCaster ? "file:spritePokémonBack/Spr_b_g1_%03d.png" : "file:spritePokémonFront/Spr_1b_%03d.png";
        sprite.setImage(new Image(String.format(pattern, p.getId())));
    }

    private String formatMosse(Pokemon p) {
        StringBuilder sb = new StringBuilder();
        for (Spell s : p.getSpells()) {
            sb.append(s.getNome())
              .append(" [")
              .append(s.getTipo())
              .append("] - Potenza ")
              .append(s.getValoreBase())
              .append(" - Mana ")
              .append(s.getCostoBase())
              .append(" - PP ")
              .append(s.getPpAttuali())
              .append("/")
              .append(s.getPpMassimi())
              .append("\n");
        }
        return sb.toString();
    }

    private void appendLog(String text) {
        if (StoricoTurniArea.getText() == null || StoricoTurniArea.getText().isEmpty()) {
            StoricoTurniArea.setText(text);
        } else {
            StoricoTurniArea.appendText("\n" + text);
        }
        StoricoTurniArea.positionCaret(StoricoTurniArea.getText().length());
    }

}
