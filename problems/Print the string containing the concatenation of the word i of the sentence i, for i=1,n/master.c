#include <stdio.h>

void concat(char str1[], char str2[]);


int main()
{
	char str1[100], str2[100];
	concat(str1, str2);
	printf("%s", str1);
	return 0;
}
