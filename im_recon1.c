#include<stdio.h>
#include<stdlib.h>
#include<math.h>
#include<string.h>

#pragma pack(2)

typedef struct tagBITMAPFILEHEADER
{ 
  unsigned short int bfType;
  unsigned long bfSize;
  unsigned short int bfReserved1;
  unsigned short int bfReserved2;
  unsigned long bfOffBits;  
} BITMAPFILEHEADER;

typedef struct tagBITMAPINFOHEADER
{
    unsigned long biSize;
    long biWidth;
    long biHeight;
    unsigned short int biPlanes;
    unsigned short int biBitCount;
    unsigned long biCompression;
    unsigned long biSizeImage;
    long biXPelsPerMeter;
    long biYPelsPerMeter;
    unsigned long biClrUsed;
    unsigned long biClrImportant;
} BITMAPINFOHEADER;

typedef struct rgb
{
unsigned char bl;
unsigned char gr;
unsigned char rd;
}pixel;

int pix_to_int(pixel data)
{
	return (((data.bl*256)+data.gr)*256+data.rd);
}


void gauss1(int n,float **a,float *b,float *x,int *status)
{
		int i,j,k;
		float pivot,factor,sum;

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



int main()
{
	FILE *fp;
	BITMAPFILEHEADER head,sh_head;
	BITMAPINFOHEADER info,sh_info;
	pixel data;
	char bogus,code[5],openfile[10],out[50];
	unsigned char junkdata=0;
	int *msg_id,num,**sub,i,j,k,size,cnt,status,min,temp,h,w,*serial,*str,sh,sw,sh_junk,junk,in,m,p,out_size;
	float **coeff,*b,*x,**st_coeff,*st_b,*st_x,rng;



	printf("Enter the number of Image-Shares to open:");
	scanf("%d",&num);

	printf("Enter the IDs of the Shares:\n");

	msg_id=(int *)malloc(num*sizeof(int));
	serial=(int *)malloc(num*sizeof(int));
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
		strcat(openfile,".bmp");
		
		if((fp=fopen(openfile,"rb"))==NULL)
		{
			printf("File Doesn't Exist");
			exit(0);
		}
		if(i==0)
		{
			fread(&sh_head,sizeof(sh_head),1,fp);
			fread(&sh_info,sizeof(sh_info),1,fp);

			sh=sh_info.biHeight;
			sw=sh_info.biWidth;

			sh_junk=4-((sw*3)%4);

			if(sh_junk==4)
				sh_junk=0;

			
			fread(&data,sizeof(data),1,fp);
			h=pix_to_int(data);

			fread(&data,sizeof(data),1,fp);
			w=pix_to_int(data);

			fread(&data,sizeof(data),1,fp);
			min=pix_to_int(data);
		}
		else
			fseek(fp,63,SEEK_SET);
		
		fread(&data,sizeof(data),1,fp);
		serial[i]=pix_to_int(data);

		k=0;
		for(j=1;j<=sh;j++)
		{
			if(j==1)
				in=5;
			else
				in=1;

			for(m=in;m<=sw;m++)
			{
				fread(&data,sizeof(data),1,fp);
				sub[i][k]=pix_to_int(data);
				k++;
				sub[i]=(int *)realloc(sub[i],(k+1)*sizeof(int));	
			}
			if(sh_junk)
			{
				fseek(fp,sh_junk,SEEK_CUR);
			}
		}

		fclose(fp);

	}
	scanf("%c",&bogus);
	printf("Enter the Name or the Path of the Decrypted Image file:\n");
	scanf("%s",out);

	if(k==sh*sw-4)
		printf("DONE");
	size=k;

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

	str=(int*)malloc((size*min)*sizeof(int));

	for(i=1;i<=min;i++)
	{
		srand(serial[i-1]-1);

		for(j=1;j<=min;j++)
		{
			coeff[i][j]=(float)(rand()%256+1);
		}
	}


	/*for(i=1;i<=min;i++)
	{
		for(j=1;j<=min;j++)
			printf(" %f",coeff[i][j]);
		
		printf("\n");
	}*/

	cnt=0;
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

		gauss1(min,st_coeff,st_b,x,&status);
		if(status!=0)
		{
			for(k=1;k<=min;k++)
			{
				temp=(int)x[k];
				rng=x[k]-(float)(temp);
				
				if(rng>0.5000)
					str[cnt]=temp+1;
				else
					str[cnt]=temp;
				
				cnt++;
			}
		}
		else
		{
			printf("\nSingular matrix, Required Distinct Shares not found");
			exit(0);
		}
	}

	strcat(out,".bmp");

	fp=fopen(out,"wb");

	junk=4-((w*3)%4);
	if(junk==4)
		junk=0;
	out_size=(h*w*3)+(h*junk);
	head=sh_head;
	info=sh_info;
	head.bfSize=out_size+54;
	info.biWidth=w;
	info.biHeight=h;
	info.biSizeImage=out_size;

	fwrite(&head,sizeof(head),1,fp);
	fwrite(&info,sizeof(info),1,fp);

	k=0;
	
	srand(200);

	//printf("%d",junk);

	for(i=0;i<h;i++)
	{
		for(j=0;j<w;j++)
		{
			temp=(str[k]-(rand()%256+1));
			
			if(temp==256)
				temp=255;
			if(temp==-1)
				temp=0;
			data.bl=(unsigned char)(temp);
			
			temp=(str[k+1]-(rand()%256+1));
			
			if(temp==256)
				temp=255;
			if(temp==-1)
				temp=0;

			data.gr=(unsigned char)(temp);

			temp=(str[k+2]-(rand()%256+1));
			
			if(temp==256)
				temp=255;
			if(temp==-1)
				temp=0;
			data.rd=(unsigned char)(temp);
			k=k+3;
			fwrite(&data,sizeof(data),1,fp);
		}
		if(junk)
		{
			for(p=1;p<=junk;p++)
					fwrite(&junkdata,sizeof(junkdata),1,fp);
		}
	}
	fclose(fp);
	return 0;
}


