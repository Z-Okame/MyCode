public class GestioneVoti {
    static String[] voti = {"8", "10", "abc", "12", "-3", "7"};

    String media(String[] voti) {
        
        int somma = 0;
        int count = 0;

    for (String n : voti) {
        try {
            if(Integer.parseInt(n) <= 10 && Integer.parseInt(n) < 0) {
                somma += Integer.parseInt(n);
                count++;
            }
        }
        catch (NumberFormatException e) {
            return (n + "elemento non valido");
        }
        return ("La media dei voti è " + Integer.toString(somma / count));
        }
    }

    public static void main(String[] args) {
        System.out.println(media(voti));

        String[] voti2 = {"7", "3", "2","10","8"};
        System.out.println(media(voti2));
    }



}