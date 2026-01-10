#include <stdio.h>
void restructure(char str[]);

void readstring(char str[])
{
	scanf("%s", str);
}

int main()
{
	char localstring[100];
	printf("Enter string:\n");
	readstring(localstring);
	restructure(localstring);
	printf("%s\n", localstring);

	return 0;
}

