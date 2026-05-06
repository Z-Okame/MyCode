public class Studente extends Persona {
        private String matricola;
        private String università;

        public Studente(String nome, String cognome, String codiceFiscale, String matricola, String università) {
            super(nome, cognome, codiceFiscale);
            this.matricola = matricola;
            this.università = università;
        }

        //getter
        public String getMatricola() {
            return matricola;
        }
        public String getUniversità() {
            return università;
        }

        //setter
        public void setMatricola(String matricola) {
            this.matricola = matricola;
        }
        public void setUniversità(String università) {
            this.università = università;
        }

        //metodo
        public String toString() {
            return super.toString() + 
                   " Matricola: " + this.getMatricola() + 
                   " Universita': " + this.getUniversità() + ".";
        }       
}
