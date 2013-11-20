#include<stdio.h>
#include<conio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

void gauss_seidel(int n,float **,float *,float *,int *status);

main()
{
	FILE *fp;
	char code[5],openfile[10];
	int *msg_id,num,**sub,i,j,k,size,cnt,status,min,temp;
	float **coeff,*b,*x,**st_coeff,*st_b,*st_x,rng;


	printf("enter the value of min :");
	scanf("%d",&min);

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

	printf("Enter the number of msgs to open:");
	scanf("%d",&num);

	printf("Enter the ids of the msgs:\n");

	msg_id=(int *)malloc(num*sizeof(int));
	sub=(int **)malloc(num*sizeof(int *));

	for(i=0;i<num;i++)
	{
		sub[i]=(int *)malloc(sizeof(int));
	}

	for(i=0;i<num;i++)
	{
		scanf("%d",&msg_id[i]);
		
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
		
		fp=fopen(openfile,"r");

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

		gauss_seidel(min,st_coeff,st_b,x,&status);
		if(status!=0)
		{
			//printf("\nSOLUTION VECTOR ARE RESPECTIVELY:");
			for(k=1;k<=min;k++)
			{
				//printf("hi-");
				temp=(int)x[k];
				rng=x[k]-(float)(temp);
				if(rng>0.5000)
					printf("%c",temp+1);
				else
					printf("%c",temp);
				//printf(" %10.6f",x[k]);
			//printf("\n");
			}
		}
		else
		{
			printf("\nSingular matrix, reorder equation.");
			break;
		}
	}

}


void gauss_seidel(int n,float **a,float *b,float *x,int *status)
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



		

		
