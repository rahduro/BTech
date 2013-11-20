#include <stdio.h>
#include <string.h>

char str1[1000],str2[1000],trace[500][500];

int max(int a,int b,int c)
{
	if(a>b)
	{
		if(a>c)
		{
			return a;
		}
		else
		{
			return c;
		}
	}	
	else
	{	
		if(b>c)
		{
			return b;
		}
		else
		{
			return c;
		}
	}

}

void print_first(int x,int y)
{
	if(trace[x][y]=='d')
	{
		print_first(x-1,y-1);
		printf("%c",str1[y-1]);
	}
	else if(trace[x][y]=='l')
	{
		print_first(x,y-1);
		printf("%c",str1[y-1]);
	}		
	else if(trace[x][y]=='u')
	{
		print_first(x-1,y);
		printf("-");
	}
}		

void print_second(int x,int y)
{
	if(trace[x][y]=='d')
	{
		print_second(x-1,y-1);
		printf("%c",str2[x-1]);
	}
	else if(trace[x][y]=='l')
	{
		print_second(x,y-1);
		printf("-");
	}		
	else if(trace[x][y]=='u')
	{
		print_second(x-1,y);
		printf("%c",str2[x-1]);
	}
}		
	
		


int main()
{
	int n,i,j,k,gap,a,b,c,lena,lenb,m,ina,inb;
	int sub[80][80], score[80][80];
	char alph[1000],buff;
	
	printf("enter the no of elemets in character set :");
	scanf("%d",&n);

	printf("enter all the %d characters (one in each line):\n",n);
	
	for(i=1;i<=n;i++)
		scanf("%c%c",&buff,&alph[i]);

	for(i=1;i<=n;i++)
		printf("%c",alph[i]);	

	printf("\nEnter the (%d X %d) Substitution matrix\n",n,n);

	for(i=1;i<=n;i++)
		for(j=1;j<=n;j++)
			scanf("%d",&sub[i][j]);

	printf("enter gap penalty :");
	scanf("%d",&gap);

	printf("enter first string :");
	scanf("%s",str1);
	printf("enter second string :");
	scanf("%s",str2);

	lena=strlen(str1);
	lenb=strlen(str2);

	for(i=1;i<=lena;i++)
	{
		score[0][i]=i*gap;
		trace[0][i]='l';
	}

	for(i=1;i<=lenb;i++)
	{
		score[i][0]=i*gap;
		trace[i][0]='u';
	}

	score[0][0]=0;
	trace[0][0]='x';
	
	for(i=1;i<=lenb;i++)
		for(j=1;j<=lena;j++)
		{
			ina=0;
			inb=0;
			
			for(k=1;k<=n;k++)
				if(alph[k]==str1[j-1])
				{
					ina=k;
					break;
				}

			for(k=1;k<=n;k++)
				if(alph[k]==str2[i-1])
				{
					inb=k;
					break;
				}

			a=score[i-1][j-1]+sub[ina][inb];

			b=score[i-1][j]+gap;
			c=score[i][j-1]+gap;

			m=max(a,b,c);

			score[i][j]=m;
			
			if(m==a)
				trace[i][j]='d';
			else if(m==b)
				trace[i][j]='u';
			else if(m==c)
				trace[i][j]='l';

		}

		printf("final score %d\n\n",score[lenb][lena]);

		printf("score matrix :\n");
		for(i=0;i<=lenb;i++)
		{
			for(j=0;j<=lena;j++)
				printf("%d\t",score[i][j]);

			printf("\n");
		}

		printf("\n\ntrace matrix :\n");
		for(i=0;i<=lenb;i++)
		{
			for(j=0;j<=lena;j++)
				printf("%c\t",trace[i][j]);

			printf("\n");
		}

		printf("\n\n");
		print_first(lenb,lena);
		printf("\n");
		print_second(lenb,lena);
		printf("\n");
	return 0;
}
