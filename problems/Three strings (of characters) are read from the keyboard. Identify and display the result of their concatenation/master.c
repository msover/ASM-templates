#include <stdio.h>

char* concatenate(char str1[], char str2[], char str3[]);


int main()
{
	char str1[100], str2[100], str3[100];
	printf("Enter three strings:\n");
	scanf("%s %s %s", str1, str2, str3);
	char* concatPtr = concatenate(str1, str2, str3);
	printf("Concatenated string: %s\n", concatPtr);
	return 0;
}
