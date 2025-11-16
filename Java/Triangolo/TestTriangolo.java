public class TestTriangolo {

    public static void main(String[] args) {
        Triangolo t1 = new Triangolo(new Punto(2.0,3.5), new Punto(4.0, 5.0), new Punto(3.0, -1.0));
        Triangolo t2 = new Triangolo(new Punto(2.0,3.5), new Punto(4.0, 5.0), new Punto(3.0, -1.0));

        System.out.println(t1.toString());
        System.out.println(t2.toString());

        if (t1.equals(t2))
            System.out.println("i due triangoli coincidono");
        else
            System.out.println("i due triangoli non coincidono");


        if(t1.equivale(t2))
            System.out.println("i due triangoli hanno la stessa area");
        else
            System.out.println("i due triangoli non hanno la stessa area");
        
    }
}