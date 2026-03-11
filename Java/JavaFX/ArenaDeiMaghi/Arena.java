import java.util.ArrayList;
import java.util.Random;

public class Arena {
    ArrayList<Wizard> wizards = new ArrayList<>();
    Random random;
    int turno;

    //methods
    void playMatch() {

    }

    void playTurn() {

    }

    ArrayList<Wizard> getAliveWizards() {
        ArrayList<Wizard> alive = new ArrayList<>();
        for (Wizard w : wizards) {
            if (w.isAlive()) {
                alive.add(w);
            }
        }
        return alive;
    }

    Wizard getWinner() {
        ArrayList<Wizard> alive = getAliveWizards();
        if (alive.size() == 1) {
            return alive.get(0);
        } else {
            return null; // nessun vincitore o più di uno
        }
    }

    ArrayList<Wizard> sortForSpeed() {
        ArrayList<Wizard> sorted = new ArrayList<>(wizards);
        return sorted;
    }
}
