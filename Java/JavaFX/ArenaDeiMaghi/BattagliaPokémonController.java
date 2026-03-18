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
    /**
     * Metodo che gestisce il click sul pulsante "Next Turn", eseguendo un turno di battaglia e aggiornando la visualizzazione
     * @param event Evento di click sul pulsante "Next Turn"
     */
    void NextTurn(ActionEvent event) {
        if (arena == null) {
            return;
        }

        //Creo la stringa con l'arraylist da playturn, e la aggiungo al log come stringa
        ArrayList<String> turnLog = arena.playTurn();
        appendLog(String.join("\n", turnLog)); // Unisce tutte le stringhe dell'arraylist in una singola stringa con ogni elemento separato da "\n""

        updateBattleView(); // Aggiorna la visualizzazione della battaglia con i nuovi dati dopo il turno

        if (arena.getAliveWizards().size() <= 1) {
            Pokemon winner = arena.getWinner();
            if (winner != null) {
                appendLog("\nVincitore: " + winner.getAlias() + "!");
                new Alert(Alert.AlertType.INFORMATION, "La battaglia è terminata! Il vincitore è: " + winner.getAlias()).showAndWait();
            }
            NextTurnBtn.setDisable(true);
            System.exit(0); // Chiude l'applicazione dopo la fine della battaglia
        }
    }

    /**
     * Metodo che inizializza la battaglia con i dati passati dalla schermata precedente 
     * @param roster Lista dei Pokemon che partecipano alla battaglia, incluso il Pokemon scelto dal giocatore
     * @param selectedPlayer Il Pokemon scelto dal giocatore, che sarà contrassegnato come "player" nella logica della battaglia
     */
    public void setArenaData(ArrayList<Pokemon> roster, Pokemon selectedPlayer) {
        arena = new Arena(roster); // Inizializza l'arena con il roster di Pokemon
        pokemonGiocatore = selectedPlayer; // Imposta il Pokemon del giocatore
        boolean playerFound = false;

        //Se il giocatore è vivo, cerca il suo Pokemon nell'arena e lo contrassegna come player
        while (!playerFound) {
            for (Pokemon p : arena.getWizards()) {
                if (p.getId() == pokemonGiocatore.getId()) {
                    p.setPlayer(true);
                    pokemonGiocatore = p;
                    playerFound = true;
                }
            }
        }

        NextTurnBtn.setDisable(false); // Abilita il pulsante "Next Turn"
        StoricoTurniArea.clear(); // Pulisce l'area di testo dello storico dei turni
        appendLog("Battaglia avviata con " + roster.size() + " Pokemon.");
        if (pokemonGiocatore != null) {
            appendLog("Pokemon del giocatore: " + pokemonGiocatore.getAlias());
        }
        updateBattleView(); // Aggiorna la visualizzazione iniziale della battaglia con i dati appena impostati
    }

    private void updateBattleView() {

        ArrayList<Pokemon> alive = arena.getAliveWizards();
        ContaTurniLabel.setText("Turno: " + (arena.getTurno() - 1));

        Pokemon currentCaster = resolveCurrentCaster(alive); // Trova il caster per vedere se è vivo
        //Trova il target usando l'AI se il caster è vivo, altrimenti trova un target con pochi HP tra quelli vivi per la visualizzazione
        Pokemon currentTarget = resolveCurrentTarget(alive, currentCaster); 

        if (currentCaster == null) {
            setPokemonView(null, true); // Se il caster è morto, mostra i dati di default per il caster
            setPokemonView(currentTarget, false);  
            return;
        }
        //Aggiorna i dati
        setPokemonView(currentCaster, true); 
        setPokemonView(currentTarget, false);
    }

    /**
     * Restituisce il caster se ancora vivo, altrimenti null. 
     * @param alive pokemon ancora vivi
     * @return p se è vivo, null altrimenti
     */
    private Pokemon resolveCurrentCaster(ArrayList<Pokemon> alive) {
        if (alive.isEmpty()) {
            return null;
        }

        // Cerca il Pokemon del giocatore tra i vivi, se è vivo è lui il caster
        for (Pokemon p : alive) {
            if (p.isPlayer()) {
                pokemonGiocatore = p;
                return p;
            }
        }

        // Il Pokemon del giocatore e morto: lato caster vuoto.
        return null;
    }


    /**
     * Restituisce il target scelto dal ControllerAI
     * @param alive pokemon ancora vivi
     * @param currentCaster il Pokemon che sta agendo in questo turno
     * @return il target scelto dal ControllerAI, o null se sono tutti morti
     */
    private Pokemon resolveCurrentTarget(ArrayList<Pokemon> alive, Pokemon currentCaster) {
        ArrayList<Pokemon> nonPlayerAlive = new ArrayList<>();
        //Crea una lista di Pokemon vivi che non sono il giocatore
        for (Pokemon p : alive) {
            if (!p.isPlayer()) {
                nonPlayerAlive.add(p); 
            }
        }

        //Ritorna null se sono tutti morti
        if (nonPlayerAlive.isEmpty()) {
            return null;
        }

        //Se il caster è vivo, cerca un target con meno velocità usando l'AI, e lo ritorna per la visualizzazione.
        if (currentCaster != null) {
            Pokemon targetFromAI = aiController.cercaMagoConMenoVelocita(nonPlayerAlive, currentCaster);
            if (targetFromAI != null) {
                return targetFromAI;
            }
        }

        // Se non è stato trovato un target dall'AI perchè il giocatore è morto, viene restituito il Pokemon con meno HP tra quelli non giocatori.
        Pokemon target = nonPlayerAlive.get(0);
        for (Pokemon p : nonPlayerAlive) {
            if (p.getHp() < target.getHp()) {
                target = p;
            }
        }
        return target;
    }

    /**
     * Imposta la visualizzazione dei dati in battglia per un dato Pokemon 
     * @param p il Pokemon di cui visualizzare i dati, o null se il Pokemon è morto
     * @param isCaster indica se il Pokemon è il caster (true) o il target (false), per decidere quali elementi della UI aggiornare
     */
    private void setPokemonView(Pokemon p, boolean isCaster) {
        //Serie di if che decidono quali elementi della UI modificare
        Label nome = isCaster ? NomeCaster : NomeTarget;
        Label hp = isCaster ? HPCaster : HPTarget;
        Label mana = isCaster ? ManaCaster : ManaTarget;
        TextArea mosse = isCaster ? mosseCaster : mosseArea1;
        ImageView sprite = isCaster ? caster : target;

        if (p == null) { // Se il Pokemon è morto, mostra i dati di default e nessuna immagine
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

        // If che controlla se il pokemon è il caster o il target per decidere quale immagine mostrare, fronte o retro.
        String pattern = isCaster ? "file:spritePokémonBack/Spr_b_g1_%03d.png" : "file:spritePokémonFront/Spr_1b_%03d.png";
        sprite.setImage(new Image(String.format(pattern, p.getId())));
    }

    /**
     * Metodo che formatta le mosse di un Pokemon
     * @param p il Pokemon di cui formattare le mosse
     * @return una stringa formattata con le mosse del Pokemon, o una stringa vuota se il Pokemon non ha mosse
     */
    private String formatMosse(Pokemon p) {
        StringBuilder sb = new StringBuilder(); // Usa StringBuilder per costruire la stringa in modo efficiente
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

    /**
     * Metodo che imposta sul log di battaglia lo storico dei turni
     * @param text il testo da aggiungere al log dei turni
     */
    private void appendLog(String text) {
        if (StoricoTurniArea.getText() == null || StoricoTurniArea.getText().isEmpty()) {
            StoricoTurniArea.setText(text);
        } else {
            StoricoTurniArea.appendText("\n" + text);
        }
        // Posiziona il cursore alla fine del testo per assicurarsi che l'ultima parte dello storico sia sempre visibile
        StoricoTurniArea.positionCaret(StoricoTurniArea.getText().length());
    }

}
