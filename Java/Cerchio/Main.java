package Java.Cerchio;

public class Main {
    public static void main(String[] args) {

        Cerchio c = new Cerchio(2.5f);
        System.out.println("Raggio: " + c.getRaggio());
        System.out.println("Area: " + c.area());
        System.out.println("Circonferenza: " + c.circonferenza());

        Cerchio c2 = new Cerchio(5.0f);
        System.out.println("Raggio: " + c2.getRaggio());
        System.out.println("Area: " + c2.area());
        System.out.println("Circonferenza: " + c2.circonferenza());
    }
}
