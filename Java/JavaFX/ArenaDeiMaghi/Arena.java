import java.util.ArrayList;
import java.util.Random;

public class Arena {
    ArrayList<Wizard> wizards = new ArrayList<>();
    Random random = new Random();
    private int round;

    public void playMatch() {
       // ...
    }

    public void playTurn() {
        // ...
    }

    public ArrayList<Wizard> getAliveWizards() {
        ArrayList<Wizard> aliveWizards = new ArrayList<>();
        for (Wizard wizard : wizards) {
            if (wizard.getHp() > 0) {
                aliveWizards.add(wizard);
            }
        }
        return aliveWizards;
    }

    public Wizard getWinner() {
        ArrayList<Wizard> aliveWizards = getAliveWizards();
        if (aliveWizards.size() == 1) {
            return aliveWizards.get(0);
        }
        return null; 
    }

}
