public class Docente extends Persona {
    private String materia;
    private double salario;

    public Docente(String nome, String cognome, String codiceFiscale, String materia, double salario) {
        super(nome, cognome, codiceFiscale);
        this.materia = materia;
        this.salario = salario;
    }

    //getter
    public String getMateria() {
        return materia;
    }
    public double getSalario() {
        return salario;
    }

    //setter
    public void setMateria(String materia) {
        this.materia = materia;
    }
    public void setSalario(double salario) {
        this.salario = salario;
    }
    public String toString() {
        return super.toString() + 
               " Materia: " + this.getMateria() + 
               " Salario: " + this.getSalario() + ".";
    }
}
