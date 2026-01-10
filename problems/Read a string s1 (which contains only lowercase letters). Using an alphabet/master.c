#include <stdio.h>
char* restructure(char str[]);

void readstring(char str[])
{
	scanf("%s", str);
}

int main()
{
	char localstring[100];
	printf("Enter string:\n");
	readstring(localstring);
	char* p;
	p = restructure(localstring);
	printf("%s", p);

	return 0;
}

