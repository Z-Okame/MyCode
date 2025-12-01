#include <stdlib.h>
#include <stdint.h>
#include <stdio.h>

struct CopyStats {
    unsigned int bytesCopied;
    unsigned int readErrors;
    unsigned int writeErrors;
};

int main() {
    FILE *sorgente = fopen("sorgente.txt", "r");
    FILE *destinazione = fopen("destinazione.txt", "w");
    uint8_t buffer[256];
    
    if (sorgente == NULL || destinazione == NULL) {
        perror("Errore nell'apertura dei file");
        return 1;
    }

    

    
    
}