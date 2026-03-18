import java.util.ArrayList;
import java.util.Random;

public class Arena {
    ArrayList<Pokemon> wizards = new ArrayList<>();
    AIController AIController = new AIController();
    Random random;
    int turno;

    //Costruttore
    public Arena(ArrayList<Pokemon> wizards) {
        this.wizards = wizards;
        this.random = new Random();
        this.turno = 1;
    }
    
    //methods
    /**
     * Simula l'intera partita finché non rimane un solo mago vivo, gestendo i turni e le azioni dei maghi
     */
    void playMatch() {
        while (getAliveWizards().size() > 1) {
            playTurn();
        }
    }

    /**
     * Simula un turno di gioco, dove ogni mago vivo decide se attaccare o curarsi in base alla propria situazione, e agisce di conseguenza
      * I maghi agiscono in ordine di velocità.
      * Ogni azione è decisa dal ControllerAI
     */
    public ArrayList<String> playTurn() {
        ArrayList<String> log = new ArrayList<>();

        log.add("\n===== TURNO " + turno + " =====");
        ArrayList<Pokemon> alive = getAliveWizards();
        log.add("Maghi vivi a inizio turno: " + alive.size());

        for (Pokemon w : alive) {
            log.add("\n- Azione di " + w.getAlias()
                    + " [HP " + w.getHp() + "/" + w.getHpmax()
                    + ", Mana " + w.getMana() + "/" + w.getManamax() + "]");

            if (w.isAlive()) {
                if (w.getHp() < w.getHpmax() * 0.3) {
                    log.add("  Scelta AI: HP sotto 30% -> tenta CURA");

                    Spell bestHeal = null;
                    for (Spell s : w.getSpells()) {
                        if (w.canCast(s) && s.getTipo().equals("CURA")) {
                            if (bestHeal == null || s.getValoreBase() > bestHeal.getValoreBase()) {
                                bestHeal = s;
                            }
                        }
                    }

                    if (bestHeal != null) {
                        w.castSpell(bestHeal, w);
                        log.add("  Spell usata: " + bestHeal.getNome()
                                + " [PP " + bestHeal.getPpAttuali() + "/" + bestHeal.getPpMassimi() + "]");
                    } else {
                        w.rest();
                        log.add("  Nessuna spell CURA disponibile: riposo");
                    }

                    log.add("  Dopo azione: HP " + w.getHp() + "/" + w.getHpmax()
                            + ", Mana " + w.getMana() + "/" + w.getManamax());
                } else {
                    Pokemon target = AIController.cercaMagoConPochiHp(alive, w);

                    if (target != null) {
                        log.add("  Scelta AI: ATTACCO -> bersaglio previsto: " + target.getNome() + " ("
                                + target.getAlias() + ") con HP " + target.getHp() + "/" + target.getHpmax());

                        Spell bestAttack = AIController.attaccaConMiglioreSpeell(w, target);
                        if (bestAttack != null) {
                            log.add("  Spell usata: " + bestAttack.getNome()
                                    + " [PP " + bestAttack.getPpAttuali() + "/" + bestAttack.getPpMassimi() + "]");
                            log.add("  Stato bersaglio dopo attacco: " + target.getAlias()
                                    + " HP " + target.getHp() + "/" + target.getHpmax());
                        } else {
                            log.add("  Nessuna spell ATTACCO disponibile: riposo");
                        }
                    } else {
                        log.add("  Nessun bersaglio disponibile.");
                    }

                    log.add("  Stato attaccante dopo azione: HP " + w.getHp() + "/" + w.getHpmax()
                            + ", Mana " + w.getMana() + "/" + w.getManamax());
                }
            } else {
                log.add("  Saltato: mago non vivo.");
            }
        }

        log.add("===== FINE TURNO " + turno + " =====");
        turno++;

        return log;
    }

    /**
     * Restituisce una lista dei maghi ancora vivi, ordinati per velocità (dal più veloce al più lento)
     * @return lista dei maghi vivi ordinati per velocità
     */
    ArrayList<Pokemon> getAliveWizards() {
        ArrayList<Pokemon> alive = new ArrayList<>();
        for (Pokemon w : wizards) {
            if (w.isAlive()) {
                alive.add(w);
            }
        }
        alive = sortForSpeed(alive);
        return alive;
    }

    public int getTurno() {
        return turno;
    }

    public ArrayList<Pokemon> getWizards() {
        return wizards;
    }

    /**
     * Restituisce il vincitore della partita, ovvero l'unico mago ancora vivo, oppure null se non c'è un vincitore chiaro (ad esempio se tutti i maghi sono morti nello stesso turno)
     * @return il mago vincitore o null se non c'è un vincitore chiaro
     */
    Pokemon getWinner() {
        ArrayList<Pokemon> alive = getAliveWizards();
        if (alive.size() == 1) {
            return alive.get(0);
        } else {
            return null; // nessun vincitore o più di uno
        }
    }

    ArrayList<Pokemon> sortForSpeed(ArrayList<Pokemon> wizards) {   
        //Bubble sort per ordinare i maghi in base alla velocità
        //Il primo ciclo serve a tenere il conto dei maghi già ordinati
        for (int i = 0; i < wizards.size(); i++) {
            //confronto tra la velocità del mago j e j+1, se j è più lento di j+1, scambio i due maghi
            for (int j = 0; j < wizards.size() - 1 - i; j++) {
                int speedJ = wizards.get(j).getVelocità();
                int speedJ1 = wizards.get(j + 1).getVelocità();
                
                if (speedJ < speedJ1) {
                    Pokemon temp = wizards.get(j);
                    wizards.set(j, wizards.get(j + 1));
                    wizards.set(j + 1, temp);
                }
            }
        }
        return wizards;
    }
}
