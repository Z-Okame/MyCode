public class Main {
    public static void main(String[] args) {
        Studente studente = new Studente("Mario", "Rossi", "MRARSS80A01H501U", "123456", "Universita' di Roma");
        Docente docente = new Docente("Luigi", "Bianchi", "LGBBNC70B02H501Y", "Matematica", 3000.0);

        System.out.println(studente.toString());
        System.out.println(docente.toString());
    }
}
