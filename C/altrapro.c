#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <time.h>
#define N 1000000
#define DIM 10000000

unsigned long long array[N]={0};

unsigned long long isPrimo(unsigned long long n){
    unsigned long long i;

	if (n>=1 && n<=3) {
		return 1;
	}

	if (n % 2 == 0)
		return 0; /* no perche' numeri pari */

	for(i=3; i <= (int)sqrt(n); i += 2)
		if (n % i == 0)
			return 0; /* no, perche' e' stato trovato */

	return 1;

}

int main() {

	clock_t start = clock();
	
	unsigned long long i,j=0,k,x;
 
	/*for(i=1;i<N;i+=1){
		f=0;
		f=isPrimo(i);
		if(f==1){
			array[j]=i;
			j++;
		}
	}*/
	
	for (i=0;i<N;i++)
	{
		array[i]=i;
	}
	
	for (i=0;i<N;i++)
	{
		for(x=i;x<N;x++)
		{
			if (array[i]==x)
			{
				//printf("io sto funzionando!!!!");
				for (j=2;j<N;j++)
				{
					k=i*j;
					array[k]=0;
					//printf("io sto funzionando!!!!2");
				}
			}
		}
		//printf("io sto funzionando!!!!");
	}
	printf("io sto funzionando!!!!!8");
	j=0;
	
	for (i=0;i<N;i++)
	{
		if (array[i]!=0)
		{
			j++;
		}
	}
	
	
	clock_t end = clock();
	double time_spend=(double) (end-start)/CLOCKS_PER_SEC;
		printf("il tempo di processo e' %fsecondi",time_spend);
		printf("\n il tempo di esecuzione e' %I64d",j);
	return 0;
}