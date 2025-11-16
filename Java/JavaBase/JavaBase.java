public class JavaBase {

	public static void main(String[] args) {
		// CAST
		System.out.println("divisione intera " + 17/5);
		System.out.println("cast implicito " + 17.0/5);  // cast implicito
		System.out.println("cast implicito " + 17/5.0);  // cast implicito
		System.out.println("cast esplicito " + (float)17/5); // cast esplicito
		System.out.println("cast esplicito " + (char)17/5);  // cast esplicito
		
		// TIPI PRIMITIVI
		byte b = 123;             // -128                 +127
		short s = 127 + 1;        // -32768               +32767
		int i = 32767 + 1;        // -2147483648          +2147483647
		long l = 2147483647 + 1;  // -9223372036854775808 +9223372036854775807
		l = 9223372036854775807L;

		float f = 2.3f;
		double d = 2.3;

		// CLASSI NUMERICHE
        Byte bb = 12;
        Short ss = 13;
		Integer ii = 0;
		Float ff = 0.0F;
		Double dd = 34.1234567;
        
		System.out.println("Byte    " + Byte.MIN_VALUE    + " .. " + Byte.MAX_VALUE);  
		System.out.println("Short   " + Short.MIN_VALUE   + " .. " + Short.MAX_VALUE);
		System.out.println("Integer " + Integer.MIN_VALUE + " .. " + Integer.MAX_VALUE);  
		System.out.println("Float   " + Float.MIN_VALUE   + " .. " + Float.MAX_VALUE);  
		System.out.println("Double  " + Double.MIN_VALUE  + " .. " + Double.MAX_VALUE);

		java.text.DecimalFormat df = new java.text.DecimalFormat("0.#####");

		System.out.println(df.format(12.34590985));
		System.out.println(df.format(dd));

		// TIPI PRIMITIVI
		char c = 'A';
		c = 'A' + 1;
		System.out.println("char " + c);  
		System.out.println("char " + (short) c);
		c = 255;
		System.out.println("char " + c);
		System.out.println("char " + (int) c);

		boolean bln = false;
		System.out.println("boolean " + bln);

		// INPUT CONSOLE (1)
		java.util.Scanner sc = new java.util.Scanner(System.in);

	    try 
	    {
		    System.out.print("Input di un intero: ");
			i = sc.nextInt();
		} 
	    catch (java.util.InputMismatchException e) 
	    {
	    	System.out.println("Errore: " + e.getMessage());
		}

		// INPUT CONSOLE (2)
	    System.out.print("Input di un intero: ");
		if (sc.hasNextInt())
		{
			i = sc.nextInt();
	    	System.out.println("Inserito: " + i);
		}

		// INPUT CONSOLE (3)
	    System.out.print("Input di un orario (hh:mm:ss): ");
	    while (!sc.hasNext("[0-9]{2}:[0-9]{2}:[0-9]{2}"))
	    {
	    	sc.next();
	    	System.out.println("Formato errato.");
	    }
		System.out.println("Orario inserito: " + sc.next());
	    sc.close();

   		// CLASSE STRINGA
		String str = "ITIS";
		String str1 = str;
		String str2 = new String("PR");
		String str3 = new String("PR");
		/*
		 Il confronto tra due stringhe avviene con il metodo equals() anziche' con l'operatore ==.
		 Se invece si utlizza l'operatore ==, non si ottiene un confronto carattere per carattere,
		 ma viene indicato se due stringhe puntano alla stessa area di memoria.
		 */
		System.out.println("le stringhe 1 e 2 sono: " + str.equals( str1 ) + " e " + (str == str1)); // true true
		str1 += " aggiunta";
		System.out.println("le stringhe 1 e 2 sono: " + str + " e " + str1);
		System.out.println("le stringhe 1 e 2 sono: " + str.equals( str1 ) + " e " + (str == str1)); // false false

		System.out.println("le stringhe 2 e 3 sono: " + str2.equals( str3 ) + " e " + (str2 == str3)); // true false

		//  e' possibile concatenare le stringhe utilizzando il metodo concat().
		str = str.concat(str2);
		System.out.println(str); // Stampa ITISPR
		// oppure
		str = str + " " + str2;
		System.out.println(str); // Stampa ITIS PR
		// Elimina spazi bianchi da una stringa a dx e sx
		str = str.trim();
		// Conversione Maiuscolo e Minuscolo 
		str.toLowerCase();
		str.toUpperCase();
		// Sostituzione
		str = str.replace("PR", "PC");	//ritorna ITIS PC;
		System.out.println(str); // Stampa ITIS PR

		// e' possibile anche estrarre una parte di una stringa, utilizzando il metodo substring().
		// Il metodo endsWith() indica se una stringa termina con un determinato suffisso e startsWith() se inizia con un certo prefisso

		// Array: dichiarazioni alternative
		int[] array1 = new int[8];
		array1[1] = 3;
		int[] array2 = { 1, 3, 5, 7, 9, 10, 14, 0 };
		// L'attributo length vale sempre la dimensione massima
		System.out.println("Stampa valori array:");
		for (int k = 0; k < array2.length; k++)
			System.out.println(array2[k]);
		
		// ciclo foreach
		for(int j: array2)
			System.out.println(j);

		System.out.println("Programma terminato.");
	}
}