//Da finire, fatto input della matrice, da applicare l'algoritmo
//prova a fartelo da solo una vola
#include <stdio.h>
#include <malloc.h>

int N_NODI, N_ARCHI;

int main()
{

    FILE *fin; 
    fin = fopen("input.txt", "r");
    fscanf(fin,"%i %i", N_NODI,N_ARCHI);

    //Dichiarazione del grafo
    int *grafo;
    int *dist_min;
    grafo = calloc(N_NODI * N_NODI, sizeof(int)); //Alloca e setta memoria a zero
    dist_min = malloc(N_NODI * sizeof(int));
    
    for(int i = 1; i < N_ARCHI; i++)
        dist_min = -1;
    
    dist_min[0] = 0;

    for(int i = 0; i < N_NODI; i++)
    {
        for(int j = 0; j < N_NODI; j++)
        {
            grafo[i * N_NODI + N_NODI] = -1;
        }
    }

    //input
    for(int i = 0; i < N_ARCHI; i++)
    {
        int s, f, p;
        fscanf(fin,"%i %i &i", &s, &f, &p);
        grafo[s * N_NODI + f] = p;
        //grafo[s][f] = P;
    }

    
    fclose(fin);
    return 0;
}


void dijkstra(int *grafo)
{

    int nodo_partenza = 0;
    
    while()
    {
        for(int i = 0; i < N_NODI; i++)
        {
            if(grafo[N_NODI*nodo_partenza + i] != -1)
            {
                if(min_dist[nodo_partenza] + grafo[N_NODI*nodo_partenza + i] < min_diar)
            }
        }
    }

}