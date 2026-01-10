#include <stdio.h>

void printmythings(int str);
char str[] = "Goodbye World!";


int main()
{
	char localstring[] = "Hello World!\n";
	printmythings(localstring);
	return 0;
}

void readstring(int str)
{
	scanf("%s", str);
}
