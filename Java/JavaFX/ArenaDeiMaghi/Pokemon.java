import java.util.ArrayList;

public class Pokemon  {
    private String nome;
    private String alias;
    private int hp;
    private int hpmax;
    private int mana;
    private int manamax;
    private int potenzaMagica;
    private int difesa;
    private int velocità;
    private boolean player;
    public static int ID = 0;
    private final int id;
    ArrayList<Spell> spellList = new ArrayList<>();

    //Costruttore  
    public Pokemon(String nome, String alias) {
        this.nome = nome;
        this.alias = alias;
        this.hp = (int) (Math.random() * 40 + 60) + 40; 
        this.hpmax = this.hp;
        this.mana = (int) (Math.random() * 20 + 40) + 20; 
        this.manamax = this.mana;
        this.potenzaMagica = (int) (Math.random() * 5 + 10); 
        this.difesa = (int) (Math.random() * 3 + 8); 
        this.velocità = (int) (Math.random() * 1 + 10); 
        this.player = false;
        ID++;
        this.id = ID;
    }
    
    //getters
    public String getNome() {
        return nome;
    }

    public String getAlias() {
        return alias;
    }

    public int getId() {
        return id;
    }

    public int getHp() {
        return hp;
    }

    public int getHpmax() {
        return hpmax;
    }

    public int getMana() {
        return mana;
    }

    public int getManamax() {
        return manamax;
    }

    public int getPotenzaMagica() {
        return potenzaMagica;
    }

    public int getDifesa() {
        return difesa;
    }

    public int getVelocità() {
        return velocità;
    }

    public boolean isPlayer() {
        return player;
    }

    public void setPlayer(boolean player) {
        this.player = player;
    }

    public ArrayList<Spell> getSpells() {
        return spellList;
    }

    //metodi

    /**
     * Verifica se il mago è ancora vivo
     * @return true se HP > 0, false altrimenti
     */
    public boolean isAlive() {
        if (hp > 0) {
            return true;
        }
        return false;
    }

    /**
     * Subisce un danno riducendo gli HP (considerando la difesa)
     * @param danno il danno ricevuto prima della difesa
     */
    public void takeDamage(int danno) {
        int dannoSubito = danno - difesa;
        if (dannoSubito < 0) {
            dannoSubito = 0;
        }
        hp -= dannoSubito;
        if (hp < 0) {
            hp = 0;
        }
    }

    /**
     * Cura il mago ripristinando HP (fino al massimo)
     * @param quantita la quantità di HP da ripristinare
     */
    public void heal(int quantita) {
        hp += quantita;
        if (hp > hpmax) {
            hp = hpmax;
        } 
    }    

    /**
     * Verifica se il mago ha abbastanza mana per lanciare l'incantesimo
     * @param s l'incantesimo da verificare
     * @return true se ha abbastanza mana, false altrimenti
     */
    public boolean canCast(Spell s) {
        if (mana >= s.getCostoBase() && s.hasPP()) {
            return true;
        }
        return false;
    }

    /**
     * Lancia un incantesimo su un bersaglio
     * @param s l'incantesimo da lanciare
     * @param target il bersaglio dell'incantesimo
     */
    public void castSpell(Spell s, Pokemon target) {
        if (canCast(s)) {
            mana -= s.getCostoBase();
            s.consumaPP();
            
            if (s.getTipo().equals("ATTACCO")) {
                int danno = potenzaMagica + s.getValoreBase();
                target.takeDamage(danno);
            } else if (s.getTipo().equals("CURA")) {
                int cura = potenzaMagica + s.getValoreBase();
                this.heal(cura);  // Cura se stesso
            }
        } else {
            System.out.println(alias + " non puo lanciare " + s.getNome()
                    + " (mana o PP insufficienti)");
        }
    }

    /**
     * Riposa per recuperare 5 punti mana
     */
    public void rest() {
        mana += 5;
        if (mana > manamax) {
            mana = manamax;
        }
    }

    /**
     * Rigenera una quantità di mana (fino al massimo)
     * @param quantita la quantità di mana da rigenerare
     */
    public void regenMana(int quantita) {
        mana += quantita;
        if (mana > manamax) {
            mana = manamax;
        }
    }
}