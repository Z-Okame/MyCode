#include <stdio.h> per printf
#include <stdlib.h> per malloc e free
#include <math.h> per sqrt
#include <time.h> per clock

#define N 1000000000   // Limite massimo per la ricerca


// Funzione brute force per controllare se un numero è primo
int isPrimo(int n) {
    if (n == 2) return 1;
    if (n <= 1 || n % 2 == 0) return 0;

    for (int i = 3; i * i <= n; i += 2) {
        if (n % i == 0) return 0;
    }
    return 1;
}

int main() {
    clock_t start = clock();

    unsigned long long i, j = 0;

    // Allocazione dinamica dell'array per i numeri primi
    unsigned long long *array = (unsigned long long *)malloc(N * sizeof(unsigned long long));


    for (i = 2; i < N; i++) {
        if (isPrimo(i)) {
            array[j] = i;
            j++;
        }
    }

    clock_t end = clock();
    double time_spent = (double)(end - start) / CLOCKS_PER_SEC;

    printf("Il tempo di processo è %f secondi\n", time_spent);
    printf("Numeri primi trovati: %llu\n", j);

    // Libera la memoria allocata
    free(array);

    return 0;
}