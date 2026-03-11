import java.util.ArrayList;

public class AIController {
    //metodi

    /**
     * Cerca il mago con meno HP tra quelli vivi, per decidere chi attaccare
     * @param wizards lista di maghi vivi
     * @return il mago con meno HP
     */
    public Wizard cercaMagoConPochiHp(ArrayList<Wizard> wizards, Wizard caster) { //passeremo la lista dei maghi vivi
        Wizard target = null;
        for (Wizard w : wizards) {
            if (w == caster || !w.isAlive()) {
                continue;
            }
            if (target == null || w.getHp() < target.getHp()) { //per la prima iterazione, target è null, quindi viene assegnato il primo mago. Per le iterazioni successive, se il mago corrente ha meno hp del target attuale, diventa il nuovo target    
                target = w;
            }
        }
        return target;
    }

    /**
     * Sceglie il miglior incantesimo di attacco disponibile e lo lancia sul bersaglio, altrimenti si riposa
     * @param caster il mago che lancia l'incantesimo
     * @param target il mago bersaglio dell'attacco
     */
    public Spell attaccaConMiglioreSpeell(Wizard caster, Wizard target) {
        Spell bestSpell = null;
        for (Spell s : caster.getSpells()) {
            if (caster.canCast(s) && s.getTipo().equals("ATTACCO")) { //verifico se il mago ha abbastanza mana e PP per lanciare l'incantesimo
                if (bestSpell == null || s.getValoreBase() > bestSpell.getValoreBase()) { //per la prima iterazione, bestSpell è null, quindi viene assegnato il primo incantesimo. Per le iterazioni successive, se l'incantesimo corrente ha più danno base del bestSpell attuale, diventa il nuovo bestSpell
                    bestSpell = s;
                }
            }
        }
        if (bestSpell != null) {
            caster.castSpell(bestSpell, target); //lancio l'incantesimo migliore sul bersaglio
        } else {
            caster.rest(); //se non c'è un incantesimo disponibile, il mago si riposa per recuperare mana
        }
        return bestSpell;
    }

    /**
     * Se gli HP del mago sono sotto il 30%, cerca il miglior incantesimo di cura disponibile e lo lancia su se stesso, altrimenti si riposa
     * @param caster
     */
    public void curaSeHpBasso(Wizard caster) {
            Spell bestSpell = null;
            for (Spell s : caster.getSpells()) {
                if (caster.canCast(s) && s.getTipo().equals("CURA")) { //verifico se il mago ha abbastanza mana per lanciare l'incantesimo e se l'incantesimo è di tipo cura
                    if (bestSpell == null || s.getValoreBase() > bestSpell.getValoreBase()) { //per la prima iterazione, bestSpell è null, quindi viene assegnato il primo incantesimo di cura. Per le iterazioni successive, se l'incantesimo di cura corrente ha più valore base del bestSpell attuale, diventa il nuovo bestSpell
                        bestSpell = s;
                    }
                }
            }
            if (bestSpell != null) { //verifico se è stato trovato un incantesimo di cura che il mago può lanciare
                caster.castSpell(bestSpell, caster); //lancio l'incantesimo migliore su me stesso
            }
            else {
                caster.rest(); //se non c'è un incantesimo di cura disponibile, il mago si riposa per recuperare mana
            }
        }
    }

