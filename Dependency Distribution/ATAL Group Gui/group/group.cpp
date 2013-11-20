// group.cpp : Defines the entry point for the DLL application.
//

#include "StdAfx.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <conio.h>

BOOL APIENTRY DllMain( HANDLE hModule, 
                       DWORD  ul_reason_for_call, 
                       LPVOID lpReserved
					 )
{
    return TRUE;
}


void gauss1(int n,float **a,float *b,float *x,int *status)
{
		int i,j,k;
		float pivot,factor,sum;

		/*for(i=1;i<=n;i++)
		{
			for(j=1;j<=n;j++)
				printf(" %f",a[i][j]);
			printf("\n");
		}*/

		for(k=1;k<=n-1;k++)
		{
			
			
			pivot=a[k][k];
			if((pivot<0.00001)&& (pivot>-0.00001) )
			{
				*status=0;
				return;
			}
			*status=1;
			for(i=k+1;i<=n;i++)
			{
				factor=a[i][k]/pivot ;
				for(j=k+1;j<=n;j++)
				{
					a[i][j]=a[i][j]-factor*a[k][j];
				}
				b[i]=b[i]-factor*b[k];
			}

			/*for(i=1;i<=n;i++)
			{
			for(j=1;j<=n;j++)
				printf(" %f",a[i][j]);
			printf("\n");
			}*/
			//printf("\n");
		}
		x[n]=b[n]/a[n][n];
		for(k=n-1;k>=1;k--)
		{
			sum=0.0;
			for(j=k+1;j<=n;j++)
				sum=sum+a[k][j]*x[j];
			x[k]=(b[k]-sum)/a[k][k];
		}

		return;
}


int _stdcall divide(int m,int n, char  s1[], char s2[])
{

	FILE *fp;
	
	char str[1000000],c,filename[20],savefile[10],code[5],savu[300];
	int	**sub,**coeff,i,full_block,*cur_block,chk=0,j,k,l,cnt,len,min,div,sum,saved,max;

	//printf("Enter the string :");
	//scanf("%[^\n]s",str);

	
	if((fp=fopen(s1,"r"))==NULL)
	{
		return 0;
		//printf("File Doesnt Exist");
		//exit(0);
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


	/*printf("Enter the number of division:");
	scanf("%d",&div);

	printf("Enter the min required:");
	scanf("%d",&min);*/

	div=m;
	min=n;

	

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


	/*for(i=0;i<div;i++)
	{
		for(j=0;j<min;j++)
		{
			printf("%d ",coeff[i][j]);
		}
		printf("\n");
	}*/


	for(i=0;i<div;i++)
	{
		if(chk==0)
			max=full_block+1;
		else
			max=full_block;

		/*for(j=0;j<max;j++)
			printf("%d ",sub[i][j]);

		printf("\n");*/
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

		strcpy(savu,s2);
		strcat(savefile,".txt");
		
		strcat(savu,savefile);
		fp=fopen(savu,"w");

		for(j=0;j<max;j++)
		{
			fprintf(fp,"\n%d",sub[i][j]);
			fflush(fp);
		}
		
		fclose(fp);

	}

	return 1;
}


int _stdcall conq(int min, int num, char s[],char p[],char path[])
{

	FILE *fp,*fp1,*fp2;
	char code[5],openfile[10],t[100][1000],tmp[1000];
	int *msg_id,**sub,i,j,k,size,cnt,status,temp;
	float **coeff,*b,*x,**st_coeff,*st_b,*st_x,rng;


	/*printf("enter the value of min :");
	scanf("%d",&min);*/

	fp1=fopen(path,"w");
	//fp2=fopen("link.txt","w");

	coeff=(float**)malloc((min+1)*sizeof(float*));
	for(i=0;i<min+1;i++)
		coeff[i]=(float*)malloc((min+1)*sizeof(float));

	st_coeff=(float**)malloc((min+1)*sizeof(float*));
	for(i=0;i<min+1;i++)
		st_coeff[i]=(float*)malloc((min+1)*sizeof(float));

	b=(float*)malloc((min+1)*sizeof(float));
	st_b=(float*)malloc((min+1)*sizeof(float));
	
	x=(float*)malloc((min+1)*sizeof(float));
	st_x=(float*)malloc((min+1)*sizeof(float));

	/*printf("Enter the number of msgs to open:");
	scanf("%d",&num);*/

	//printf("Enter the ids of the msgs:\n");

	msg_id=(int *)malloc(num*sizeof(int));
	sub=(int **)malloc(num*sizeof(int *));

	for(i=0;i<num;i++)
	{
		sub[i]=(int *)malloc(sizeof(int));
	}

	i=0;j=0;k=0;
	while(s[i]!='\0')
	{
		if(s[i]!='?')
		{
			tmp[k]=s[i];
			k++;
		}
		else
		{
			tmp[k]='\0';
			msg_id[j]=atoi(tmp);
			j++;
			k=0;
		}	
		i++;	
	}

	i=0;j=0;k=0;
	while(p[i]!='\0')
	{
		if(p[i]!='?')
		{
			t[j][k]=p[i];
			k++;
		}
		else
		{
			t[j][k]='\0';
			j++;
			k=0;
		}	
		i++;	
	}	
	
	//for(i=0;i<num;i++)	
		//fprintf(fp2,"%d\n%s",msg_id[i],t[i]);

	for(i=0;i<num;i++)
	{
		/*scanf("%d",&msg_id[i]);
		
		cnt=0;
		j=msg_id[i];
		
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
			openfile[cnt]=code[j];
			cnt++;
		}

		openfile[cnt]='\0';
		strcat(openfile,".txt");
		
		fp=fopen(openfile,"r");*/

		fp=fopen(t[i],"r");


		j=0;

		while(!feof(fp))
		{
			fscanf(fp,"%d",&sub[i][j]);
			j++;
			sub[i]=(int *)realloc(sub[i],(j+1)*sizeof(int));
		}

		fclose(fp);

	}

	size=j;

	for(i=0;i<num;i++)
	{
		for(k=0;k<size;k++)
			printf("%d ",sub[i][k]);
		printf("\n");
	}


	for(i=1;i<=min;i++)
	{
		srand(msg_id[i-1]-1);

		for(j=1;j<=min;j++)
		{
			coeff[i][j]=(float)(rand()%100+1);
		}
	}


		for(i=1;i<=min;i++)
		{
			for(j=1;j<=min;j++)
				printf(" %f",coeff[i][j]);
			printf("\n");
		}

//	printf("ooo");
	for(i=0;i<size;i++)
	{
		for(j=1;j<=min;j++)
			b[j]=(float)sub[j-1][i];

		for(j=1;j<=min;j++)
			st_b[j]=b[j];

		for(k=1;k<=min;k++)
		{
			for(j=1;j<=min;j++)
				st_coeff[k][j]=coeff[k][j];
		
		}



	//	printf("pppp");

		gauss1(min,st_coeff,st_b,x,&status);
		if(status!=0)
		{
			//printf("\nSOLUTION VECTOR ARE RESPECTIVELY:");
			for(k=1;k<=min;k++)
			{
				//printf("hi-");
				temp=(int)x[k];
				rng=x[k]-(float)(temp);
				if(rng>0.5000)
					fprintf(fp1,"%c",temp+1);
				else
					fprintf(fp1,"%c",temp);
				//printf(" %10.6f",x[k]);
			//printf("\n");
			}
		}
		else
		{
			fprintf(fp1,"\nSingular matrix, reorder equation.");
			break;
		}
	}
	
	fclose(fp1);
	//fclose(fp2);

	return 1;
}


