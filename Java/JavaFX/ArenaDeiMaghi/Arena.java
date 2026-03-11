import java.util.ArrayList;
import java.util.Random;

public class Arena {
    ArrayList<Wizard> wizards = new ArrayList<>();
    AIController AIController = new AIController();
    Random random;
    int turno;

    //Costruttore
    public Arena(ArrayList<Wizard> wizards) {
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
            turno++;
        }
    }

    /**
     * Simula un turno di gioco, dove ogni mago vivo decide se attaccare o curarsi in base alla propria situazione, e agisce di conseguenza
      * I maghi agiscono in ordine di velocità.
      * Ogni azione è decisa dal ControllerAI
     */
    void playTurn() {
        System.out.println("\n===== TURNO " + turno + " =====");
        ArrayList<Wizard> alive = getAliveWizards();
        System.out.println("Maghi vivi a inizio turno: " + alive.size());

        
        //Stampo le statistiche di ogni mago 
        for (Wizard w : alive) {
            System.out.println("\n- Azione di " + w.getAlias()
                    + " [HP " + w.getHp() + "/" + w.getHpmax()
                    + ", Mana " + w.getMana() + "/" + w.getManamax() + "]");
            //Controllo se il mago è vivo, perché potrebbe essere stato ucciso da un mago precedente in questo turno
            if (w.isAlive()) {
                //Se gli HP del mago sono sotto il 30%, il ControllerAI decide di curarsi, altrimenti decide di attaccare
                if (w.getHp() < w.getHpmax() * 0.3) {
                    System.out.println("  Scelta AI: HP sotto 30% -> tenta CURA");
                    AIController.curaSeHpBasso(w); 
                    System.out.println("  Dopo azione: HP " + w.getHp() + "/" + w.getHpmax()
                            + ", Mana " + w.getMana() + "/" + w.getManamax());
                } else {
                    //Il mago ha ancora abbastanza HP per attaccare
                    Wizard target = AIController.cercaMagoConPochiHp(alive, w);
                    
                    //Il ControllerAI sceglie la spell d'attacco migliore e la usa, altrimenti il mago si riposa
                    if (target != null) {
                        System.out.println("  Scelta AI: ATTACCO -> bersaglio previsto: " + target.getNome() + " (" + target.getAlias() + ") con HP " + target.getHp() + "/" + target.getHpmax() );
                        
                        Spell bestAttack = AIController.attaccaConMiglioreSpeell(w, target);
                        if (bestAttack != null) {
                            System.out.println("  Spell usata: " + bestAttack.getNome()
                                    + " [PP " + bestAttack.getPpAttuali() + "/" + bestAttack.getPpMassimi() + "]");
                            System.out.println("  Stato bersaglio dopo attacco: " + target.getAlias()
                                    + " HP " + target.getHp() + "/" + target.getHpmax());
                        } else {
                            System.out.println("  Nessuna spell ATTACCO disponibile: riposo");
                        }
                    } else {
                        System.out.println("  Nessun bersaglio disponibile.");
                    }

                    //Stampa a schermo delle statistiche aggiornate
                    System.out.println("  Stato attaccante dopo azione: HP " + w.getHp() + "/" + w.getHpmax()
                            + ", Mana " + w.getMana() + "/" + w.getManamax());
                }
            //Il mago è morto prima, quindi salta il turno.
            } else {
                System.out.println("  Saltato: mago non vivo.");
            }
        }
    
        System.out.println("===== FINE TURNO " + turno + " =====");
    }

    /**
     * Restituisce una lista dei maghi ancora vivi, ordinati per velocità (dal più veloce al più lento)
     * @return lista dei maghi vivi ordinati per velocità
     */
    ArrayList<Wizard> getAliveWizards() {
        ArrayList<Wizard> alive = new ArrayList<>();
        for (Wizard w : wizards) {
            if (w.isAlive()) {
                alive.add(w);
            }
        }
        alive = sortForSpeed(alive);
        return alive;
    }

    /**
     * Restituisce il vincitore della partita, ovvero l'unico mago ancora vivo, oppure null se non c'è un vincitore chiaro (ad esempio se tutti i maghi sono morti nello stesso turno)
     * @return il mago vincitore o null se non c'è un vincitore chiaro
     */
    Wizard getWinner() {
        ArrayList<Wizard> alive = getAliveWizards();
        if (alive.size() == 1) {
            return alive.get(0);
        } else {
            return null; // nessun vincitore o più di uno
        }
    }

    ArrayList<Wizard> sortForSpeed(ArrayList<Wizard> wizards) {   
        //Bubble sort per ordinare i maghi in base alla velocità
        //Il primo ciclo serve a tenere il conto dei maghi già ordinati
        for (int i = 0; i < wizards.size(); i++) {
            //confronto tra la velocità del mago j e j+1, se j è più lento di j+1, scambio i due maghi
            for (int j = 0; j < wizards.size() - 1 - i; j++) {
                int speedJ = wizards.get(j).getVelocità();
                int speedJ1 = wizards.get(j + 1).getVelocità();
                
                if (speedJ < speedJ1) {
                    Wizard temp = wizards.get(j);
                    wizards.set(j, wizards.get(j + 1));
                    wizards.set(j + 1, temp);
                }
            }
        }
        return wizards;
    }
}
