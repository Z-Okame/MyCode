public class TestOrario {
        public static void main(String[] args) {
        Orario orario1 = new Orario(23, 59, 59);
        System.out.println(orario1.mostra());
        orario1.tic();
        System.out.println(orario1.mostra());
        orario1.aggiungiMinuti(125);
        System.out.println(orario1.mostra());

        Orario orario2 = new Orario(15, 15, 15);
        if (orario1.getOre() == orario2.getOre() && orario1.getMinuti() == orario2.getMinuti() && orario1.getSecondi() == orario2.getSecondi())
            System.out.println("Gli orari sono uguali");
         else
            System.out.println("Gli orari sono diversi");       
        }
}
