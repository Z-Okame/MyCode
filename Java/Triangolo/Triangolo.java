public class Triangolo {
    private Punto a;
    private Punto b;
    private Punto c;

    public Triangolo(Punto a, Punto b, Punto c) {
        this.a = a;
        this.b = b;
        this.c = c;
    }

    //setter
    public void setA(Punto a) {
        this.a = a;
    }
    public void setB(Punto b) {
        this.b = b;
    }
    public void setC(Punto c) {
        this.c = c;
    }
    //getter
    public Punto getA() {
        return a;
    }
    public Punto getB() {
        return b;
    }
    public Punto getC() {
        return c;
    }
    
    //metodi

    /**
     * calcola il perimetro del triangolo
     * @return (double) perimetro
     */
    public double perimetro() {
        return a.distanza(b) + b.distanza(c) + c.distanza(a);
    }

    /**
     * calcola l'area del triangolo
     * @return (double) area
     */
    public double area() {
        return Math.sqrt((perimetro()/2) * ((perimetro()/2) - a.distanza(b)) * ((perimetro()/2) - b.distanza(c)) * ((perimetro()/2) - c.distanza(a)));
    }

    /**
     * restituisce una stringa che descrive il triangolo
     */
    public String toString() {
        return ("Punto A: " + a.toString() + ", Punto B: " + b.toString() + ", Punto C: " + c.toString() + String.format("Perimetro: %.2f e Area: %.2f", perimetro(), area()));
    }

    /**
     * controlla se due triangoli sono uguali
     * @param (Triangolo t) 
     * @return (boolean) true se sono uguali, false se non sono uguali
     */
    public boolean equals(Triangolo t) {
        if (a.equals(this.a, t.getA()) && b.equals(this.b, t.getB()) && c.equals(this.c, t.getC())) {
            return true;
        }
        return false;
    }

    /**
     * controlla se due triangoli hanno la stessa area
     * @param (Triangolo t)
     * @return (boolean) true se hanno la stessa area, false se non hanno la stessa area
     */
    public boolean equivale(Triangolo t) {
        if (this.area() == t.area())
            return true;
        return false;
    }
}
