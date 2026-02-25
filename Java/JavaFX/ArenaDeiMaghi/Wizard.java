import java.util.ArrayList;

public class Wizard  {
    private String nome;
    private String alias;
    private int hp;
    private int hpmax;
    private int mana;
    private int manamax;
    private int potenzaMagica;
    private int difesa;
    private int velocità;
    ArrayList<Spell> spellList = new ArrayList<>();

    //Costruttore  
    public Wizard(String nome, String alias) {
        this.nome = nome;
        this.alias = alias;
        this.hp = (int) (Math.random() * 40 + 60); 
        this.hpmax = this.hp;
        this.mana = (int) (Math.random() * 20 + 40); 
        this.manamax = this.mana;
        this.potenzaMagica = (int) (Math.random() * 5 + 10); 
        this.difesa = (int) (Math.random() * 3 + 8); 
        this.velocità = (int) (Math.random() * 1 + 10); 
    }
    
    //getters
    public String getNome() {
        return nome;
    }

    public String getAlias() {
        return alias;
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

    //metodi

    public boolean isAlive() {
        if (hp > 0) {
            return true;
        }
        return false;
    }

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

    public void heal(int quantita) {
        hp += quantita;
        if (hp > hpmax) {
            hp = hpmax;
        } 
    }    

    public boolean canCast(Spell s) {
        if (mana >= s.getCostoBase()) {
            return true;
        }
        return false;
    }

    public void castSpell(Spell s, Wizard target) {
        if (canCast(s)) {
            mana -= s.getCostoBase();
            int danno = potenzaMagica + s.getValoreBase();
            target.takeDamage(danno);
        }
        else if (s.getTipo().equals("CURA")) {
            mana -= s.getCostoBase();
            int cura = potenzaMagica + s.getValoreBase();
            heal(cura);
        }
        else {
            System.out.println(alias + " non ha abbastanza mana per lanciare " + s.getNome());
        }
    }

    public void rest() {
        mana += 5;
        if (mana > manamax) {
            mana = manamax;
        }
    }

    public void regenMana(int quantita) {
        mana += quantita;
        if (mana > manamax) {
            mana = manamax;
        }
    }
}