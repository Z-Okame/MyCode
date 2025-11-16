public class Quadrato {
    private Punto centro;    
    private double lato;
    private double angolo_rotazione;

    public Quadrato(Punto centro, double lato, double angolo_rotazione) {
        this.centro = centro;
        this.lato = lato;
        this.angolo_rotazione = angolo_rotazione;
    } 

    //getter
    public Punto getCentro () {
        return centro;
    }
    public double getLato() {
        return lato;
    }
    public double getAngolo_rotazione () {
        return angolo_rotazione;
    }

    //setter
    public void setCentro (Punto centro) {
        this.centro = centro;
    }
    public void setLato (double lato) {
        this.lato = lato;
    }
    public void setAngolo_rotazione (double angolo_rotazione) {
        this.angolo_rotazione = angolo_rotazione;
    }
    
    //methods

    /**
     * Function for calculating the Area
     * @return double result
     */
    public double area () {
        return Math.pow(lato, 2);
    }

    /**
     * Function for calculating the Perimeter
     * @return double result
     */
    public double perimetro() {
        return lato * 4;
    }

    /**
     * Function to get the vertex A of the square
     * @return Punto result
     */
    public Punto getVerticeA() {
        return new Punto(centro.getX() - this.lato/2 , centro.getY() + this.lato/2);
    }
    /**
     * Function to get the vertex B of the square
     * @return Punto result
     */
    public Punto getVerticeB() {
        return new Punto(centro.getX() + this.lato/2 , centro.getY() + this.lato/2);
    }

    /**
     * Function to get the vertex C of the square
     * @return Punto result
     */
    public Punto getVerticeC() {
        return new Punto(centro.getX() - this.lato/2 , centro.getY() - this.lato/2);
    }

    /**
     * Function to get the vertex D of the square
     * @return Punto result
     */
    public Punto getVerticeD() {
        return new Punto(centro.getX() + this.lato/2 , centro.getY() - this.lato/2);
    }

    public String toString() {
        return String.format("------------\n Centro : %.2f, %.2f\nAngolo rotazione: %.2f\n Lato: %.2f\n Vertice A: %.2f, %.2f\n Vertice B: %.2f, %.2f\n Vertice C: %.2f, %.2f\n Vertice D: %.2f, %.2f\n Area: %.2f\n Perimetro: %.2f\n------------", centro.getX(), centro.getY(), angolo_rotazione, lato, getVerticeA().getX(), getVerticeA().getY(), getVerticeB().getX(), getVerticeB().getY(), getVerticeC().getX(), getVerticeC().getY(), getVerticeD().getX(), getVerticeD().getY(), area(), perimetro());
    }

    public static void main(String[] args) {
        Quadrato q1 = new Quadrato (new Punto (4,8), 2, 0);

        System.out.println(q1.toString());
    }
    

}
