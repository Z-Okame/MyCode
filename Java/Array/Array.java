public class Array {

    public static void main(String[] args) {
        int[] array1 = {1,3,5,7,9,11};
        int[] array2 = {2,4,6,8,10,12};
        int[] array3 = new int [array1.length + array2.length];
        System.out.println(array1.length);
        System.out.println(array2.length);

        int i = 0, j = 0, k = 0;

        while (i < array1.length && j < array2.length) {
            if (array1[i] <= array2[j]) {
                array3[k] = array1[i];
                k++;
                i++;
            } else {
                array3[k] = array2[j];
                k++;
                j++;
            }
        }
        
        while (i < array1.length) {
            array3[k] = array1[i];
            k++;
            i++;
        }
        while (j < array2.length) {
            array3[k] = array2[j];
            k++;
            j++;
        }
            
        

        System.out.print("Array 3: ");
        for (int l = 0; l < array3.length; l++) {
            System.out.print(array3[l]);
            System.out.print(" ");
        }
    }
}
    
