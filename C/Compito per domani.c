	float n = 1.234
	
	S EEEEEEEE MMMMMMMMMMMMMMMMMM
	
	//s * 1.m * 2^e
	
void encodeFloat(float n) {
	int s = ((unsigned int)n>>31?-1:+1);
	
	  = -2*((unsigned int)n>>31)+1; //metodo più compatto, non abbiamo controlli e salti.
	  
	
	 int e = (((unsigned int)n>>23) & 0xff;
	e = e - 127;
	
	
	unsigned int m = (unsigned int)n & 0x007FFFFF	;
	
	
	printf ("%d * 1.%u * 2^&d",s,e,m);
}

void decodeFloat(int s, int e, unsigned m); //finisci a casa