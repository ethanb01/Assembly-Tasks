#include <stdio.h>
#include <string.h>
#include <stdlib.h>

/*
int hex2dec(char c)
{
	if(c<='9' && c>='0')
		return (int)c-48;
	else if(c<='F' && c>='A')
		return (int)c -55;
	else {
		printf("ERROR\n");
		exit(1);}
}

char *descriptive_number(char *input, char *buffer)
{
	int y[16] = {0};
 	int len = strlen(input);
	for(int i = 0; i<len ; i++)
	{
		int index = hex2dec(input[0]);
		y[index]++;
		input++;
	}
	char y2return[16];
	for(int i =0; i<16; i++)
	{
		y2return[i] = y[i]+'0';
	}
	strcpy(buffer, y2return);
	
}

int main(){
	char *str = "1AF2345FF23B0001";
	char buf[32];
	descriptive_number(str, buf);
	printf("%s\n",buf);
}
*/