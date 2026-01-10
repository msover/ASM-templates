#include <stdio.h>

void slave1fun(char str[]);
void slave2fun(char str[]);
char str[] = "Goodbye World!";


int main()
{
	char localstring[] = "Hello World!\n";
	slave1fun(localstring);
	printf("\n");
	slave2fun(localstring);
	return 0;
}

void readstring(char str[])
{
	scanf("%s", str);
}
