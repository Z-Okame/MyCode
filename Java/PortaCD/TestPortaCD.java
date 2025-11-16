public class TestPortaCD {
    public static void main(String[] args) {
        PortaCD portaCD = new PortaCD(3);
        PortaCD portaCD2 = new PortaCD(3);

        //istanziazione di CD
        CD cd1 = new CD("Album1", "Artista1", 10, 40);
        CD cd2 = new CD("Album2", "Artista2", 12, 50);
        CD cd3 = new CD("Album3", "Artista3", 8, 30);

        //istanziazione di altri CD per portaCD2
        CD cd4 = new CD("Album4", "Artista4", 15, 60);
        CD cd5 = new CD("Album5", "Artista5", 9, 35);
        CD cd6 = new CD("Album6", "Artista6", 11, 45);

        //Setting di 3 CD in portaCD
        portaCD.setCD(cd1, 0);
        portaCD.setCD(cd2, 1); 
        portaCD.setCD(cd3, 2); 

        //Setting di 3 CD in portaCD2
        portaCD2.setCD(cd4, 0); 
        portaCD2.setCD(cd5, 1); 
        portaCD2.setCD(cd6, 2); 


        //Conta dei CD presenti
        System.out.println("Numero di CD presenti in portaCD: " + portaCD.getN()); 
        System.out.println("Numero di CD presenti in portaCD2: " + portaCD2.getN()); 
        System.out.println("-----------------------------");

        //Cerca CD per titolo
        System.out.println("Posizione del CD per titolo 'Album2' in portaCD: " + portaCD.cercaCDperTitolo("Album2")); 
        System.out.println("Posizione del CD per titolo 'Album4' in portaCD2: " + portaCD2.cercaCDperTitolo("Album4")); 
        System.out.println("-----------------------------");

        //Stampa toString 
        System.out.println(portaCD.toString());
        System.out.println("-----");
        System.out.println(portaCD2.toString());
        System.out.println("-----------------------------");


        //Rimuovi CD da portaCD e portaCD2
        portaCD.killCD(1);
        System.out.println("Dopo aver rimosso il CD in posizione 1 da portaCD:");
        System.out.println(portaCD.toString());
        System.out.println("------");
        portaCD2.killCD(1);
        System.out.println("Dopo aver rimosso il CD in posizione 1 da portaCD2:");
        System.out.println(portaCD2.toString());
        System.out.println("-----------------------------");

        //Confronta collezioni
        System.out.println("Numero di CD in comune tra le due collezioni: " + portaCD.confrontaCollezione(portaCD2)); 
                
    }
}
