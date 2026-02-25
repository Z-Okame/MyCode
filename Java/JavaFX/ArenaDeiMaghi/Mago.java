import java.util.Random;


public class Mago {
    protected int HealthPoints;
    protected int ManaPoints;
    protected int PotenzaMagica;
    protected int Difesa;
    protected int Velocità;


    //Costruttore 
    public Mago(int HealthPoints, int ManaPoints, int PotenzaMagica, int Difesa, int Velocità) {
        this.HealthPoints = (int) (Math.random() * 40 + 60); // Valore casuale tra 40 e 60
        this.ManaPoints = (int) (Math.random() * 20 + 40); // Valore casuale tra 20 e 40
        this.PotenzaMagica = (int) (Math.random() * 5 + 10); // Valore casuale tra 5 e 10
        this.Difesa = (int) (Math.random() * 3 + 8); // Valore casuale tra 3 e 8
        this.Velocità = (int) (Math.random() * 1 + 10); // Valore casuale tra 1 e 10
    }

    //Getters
    public int getHealthPoints() {
        return HealthPoints;
    }

    public int getManaPoints() {
        return ManaPoints;
    }

    public int getPotenzaMagica() {
        return PotenzaMagica;
    }

    public int getDifesa() {
        return Difesa;
    }

    public int getVelocità() {
        return Velocità;
    }

    //
    public void attaccaMago(Mago Merlino) {
        
    }


}
