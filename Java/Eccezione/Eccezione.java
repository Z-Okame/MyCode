public class Eccezione {
    
    static String divisione(int a, int b) {
    try {
        return Integer.toString(a/b);
    }
    catch (ArithmeticException e) {
        return "divisione per zero";
    }
    }

    static String quoziente10(int d) {
        return divisione(10, d);
    }

    
    public static void main(String[] args) {
        for (int n = 15; n >= 0; n--)
            System.out.println(quoziente10(n));

    }

}
