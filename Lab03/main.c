/* main.c simple program to test assembler program */

#include <stdio.h>

//extern long long int test(long long int a, long long int b);
//extern long long int* lab03b();
extern long long int* lab03c();


int main(void)
{
    //long long int a = test(3, 5);
    //printf("Result of test(3, 5) = %lld\n", a);

	//printf("%d\n", *lab03b());
	long long int* my_array = lab03c();
	for (int i = 0; i < 10; i++) {
		printf("%d, ", my_array[i]);
	}
	printf("\n");

	return 0;
}
