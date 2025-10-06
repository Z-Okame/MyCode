package Java.Cerchio;

public class Cerchio {
    private float raggio;
    //costruttore
    public Cerchio () {
        this.raggio = 10;
    }
    public Cerchio (float raggio) {
        this.raggio = raggio;
    }
    //getter
    public float getRaggio() {
        return raggio;
    }
    //setter
    public float setRaggio(float raggio) {
        return this.raggio = raggio;
    }
    //metodi
    public float area () {
        return (float)Math.PI * raggio * raggio;
    }

    public float circonferenza() {
        return 2 * (float)Math.PI * raggio;
    }
    
}
