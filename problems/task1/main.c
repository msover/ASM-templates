#include <stdio.h>

int getsum(char str[]);
int perfectsquare(char str[]);

int isSquareRoot(int n)
{
	int i = 1;
	while (i * i <= n)
	{
		if (i * i == n)
			return 1;
		i++;
	}
	return 0;
}

int main()
{
	int n;
	char str[100];
	printf("Enter a number: ");
	scanf("%d", &n);
	printf("Enter the string: \n", n);
	for (int i = 0; i < n; i++)
	{
		scanf("%s", &str[i]);
	}
	int sum = getsum(str);
	sum += perfectsquare(str);
	printf("The sum is: %d\n", sum);
}
