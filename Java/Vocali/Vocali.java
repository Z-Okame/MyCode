public class Vocali {
    public static void main (String[] args) {

        char[] array = {'a','a','e','i','o','u','u','e','i','e','e','o','i','e','e','u','e','i','e','o'};
        int[] array2 = new int[5];

        for (int i:array) {
            switch (i) {
                case 'a':
                    array2[0]++;
                    break;
                case 'e':
                    array2[1]++;
                    break;
                case 'i':
                    array2[2]++;
                    break;
                case 'o':
                    array2[3]++;
                    break;
                case 'u':
                    array2[4]++;
                    break;
            }
        }

        for(int j: array2)
            System.out.println(j);
    }
}