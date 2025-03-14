#include <stdio.h> // per printf e scanf 
#include <stdlib.h> // per rand, srand e la costante NULL
#include <time.h> // per clock e time(NULL)
#define DIM 500

	//Dichiarazione delle variabili globali 
	int a[DIM][DIM], b[DIM][DIM], prod[DIM][DIM];

int main() {
	clock_t start = clock();
	
    int i, j, k;
    srand(time(NULL));
	
    // Riempimento matrice A
    for (i = 0; i < DIM; i++) {
        for (j = 0; j < DIM; j++) {
            a[i][j] = rand() % 10;
        }
    }

    // Riempimento matrice B
    for (i = 0; i < DIM; i++) {
        for (j = 0; j < DIM; j++) {
            b[i][j] = rand() % 10;
        }
    }

    // Calcolo del prodotto delle matrici
    for (i = 0; i < DIM; i++) {
        for (j = 0; j < DIM; j++) {
            for (k = 0; k < DIM; k++) {
                prod[i][j] += a[i][k] * b[k][j];
            }
        }
    }


	clock_t end = clock();
	double time_spent = (double) (end - start) / CLOCKS_PER_SEC;
	printf ("Tempo di esecuzione: %f secondi\n", time_spent);

    return 0;
}
