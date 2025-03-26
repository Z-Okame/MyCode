#include <stdio.h> // per printf
#include <stdlib.h> // per malloc e free
#include <math.h> // per sqrt
#include <time.h> // per clock

#define MAX 1000000000 // Limite superiore (un miliardo)

// Dichiarazione globale dei puntatori per gli array
unsigned long long *numeri; 
unsigned long long *primi;

int main() {
    int i, j, k = 0;
    clock_t start, end;
    double cpu_time_used;
	
    // Allocazione dinamica degli array
    numeri = (unsigned long long *)malloc((MAX + 1) * sizeof(unsigned long long));
    primi = (unsigned long long *)malloc(MAX * sizeof(unsigned long long));


    // Inizia il timer
    start = clock();

    // Inizializza l'array, assumendo che tutti i numeri siano primi
    for (i = 2; i <= MAX; i++) {
        numeri[i] = 1;
    }

    // elimino i multipli
    for (i = 2; i <= sqrt(MAX); i++) {
        if (numeri[i]) { 
            for (j = i * i; j <= MAX; j += i) {
                numeri[j] = 0;
            }
        }
    }

    // Raccolta dei numeri primi nell'array primi
    for (i = 2; i <= MAX; i++) {
        if (numeri[i]) {
            primi[k] = i;
            k++;
        }
    }

    
    end = clock();
    cpu_time_used = ((double)(end - start)) / CLOCKS_PER_SEC;

    
    printf("\nTempo impiegato: %f secondi\n", cpu_time_used);

    
	printf("Numeri primi trovati: %d", k);
	
    // Libero la memoria allocata dinamicamente
    free(numeri);
    free(primi);

    return 0;
}