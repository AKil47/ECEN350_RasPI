/* main.c simple program to test assembler program */

#include <stdio.h>

extern long long int my_mul(long long int a, long long int b);
extern long long int factorial(long long int n);

int main(void)
{
	long long int a = my_mul(3, 5);
	printf("Result of my_mul(3, 5) = %lld\n", a);

	long long int result = factorial(5);
	printf("Result of factorial(3) = %lld\n", result);

    return 0;
}
