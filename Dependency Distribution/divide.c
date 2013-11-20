#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include<conio.h>

main()
{
	
	FILE *fp;
	
	char str[1000000],c,filename[20],savefile[10],code[5];
	int	**sub,**coeff,i,full_block,*cur_block,chk=0,j,k,l,cnt,len,min,div,sum,saved,max;

	//printf("Enter the string :");
	//scanf("%[^\n]s",str);

	printf("Enter the name of file:");
	scanf("%s",filename);

	if((fp=fopen(filename,"r"))==NULL)
	{
		printf("File Doesnt Exist");
		exit(0);
	}

	i=0;

	while(!feof(fp))
	{
		c=getc(fp);
		str[i]=c;
		i++;
	}
	fclose(fp);
	str[i]='\0';


	printf("Enter the number of division:");
	scanf("%d",&div);

	printf("Enter the min required:");
	scanf("%d",&min);

	

	len=strlen(str);

	full_block=len/min;
	
	if(len%min==0)
		chk=1;
	

	coeff=(int **)malloc(div*sizeof(int *));

	for(i=0;i<div;i++)
	{
		coeff[i]=(int *)malloc(min*sizeof(int));
	}



	sub=(int **)malloc(div*sizeof(int *));
	
	for(i=0;i<div;i++)
	{
		if(chk==0)
			sub[i]=(int *)malloc((full_block+1)*sizeof(int));
		else
			sub[i]=(int *)malloc((full_block)*sizeof(int));
	}

	cur_block=(int *)malloc(min*sizeof(int));

	
	for(i=0;i<div;i++)
	{
		srand(i);

		for(j=0;j<min;j++)
		{
			coeff[i][j]=(rand()%100+1);
		}
	}
	
	
	k=0;
	cnt=0;	

	for(j=0;j<full_block;j++)
	{
		
		for(i=0;i<min;i++)
		{
			cur_block[i]=(int)str[k];
			k++;
		}
		
		for(i=0;i<div;i++)
		{			
			sum=0;
			for(l=0;l<min;l++)
			{
				sum+=coeff[i][l]*(cur_block[l]);
			}
			sub[i][cnt]=sum;
		}

		cnt++;
	}

	
	if(chk==0)
	{
		for(i=k;i<len;i++)
		{
			cur_block[i-k]=str[i];
			saved=i-k;
		}

		for(i=saved+1;i<min;i++)
			cur_block[i]=-1;


		for(i=0;i<div;i++)
		{
			sum=0;
			for(l=0;l<min;l++)
			{
				sum+=(coeff[i][l])*(cur_block[l]);
			}
			sub[i][cnt]=sum;
		}
	}


	for(i=0;i<div;i++)
	{
		for(j=0;j<min;j++)
		{
			printf("%d ",coeff[i][j]);
		}
		printf("\n");
	}


	for(i=0;i<div;i++)
	{
		if(chk==0)
			max=full_block+1;
		else
			max=full_block;

		for(j=0;j<max;j++)
			printf("%d ",sub[i][j]);

		printf("\n");
	}

	for(i=0;i<div;i++)
	{
		if(chk==0)
			max=full_block+1;
		else
			max=full_block;
		
		cnt=0;
		j=i+1;
		while(j!=0)
		{
			code[cnt]=(char)(48+(j%10));
			j=j/10;
			cnt++;
		}
		code[cnt]='\0';
		cnt=0;

		for(j=strlen(code)-1;j>=0;j--)
		{
			savefile[cnt]=code[j];
			cnt++;
		}
		savefile[cnt]='\0';

		strcat(savefile,".txt");
		
		fp=fopen(savefile,"w");

		for(j=0;j<max;j++)
		{
			fprintf(fp," %d",sub[i][j]);
			fflush(fp);
		}
		
		fclose(fp);

	}
}












