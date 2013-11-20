#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<math.h>

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

struct rgb
{
unsigned char bl;
unsigned char gr;
unsigned char rd;
}info;

main()
{
	FILE *fp;
	int i,ht,wd,j,k,tot,max=0,val=0,ch,buff=0,*rand_pos,no_junk,l,chk,key,pos;
	float a;
	char p=1,*string;

	BITMAPFILEHEADER head;
	BITMAPINFOHEADER dib;

	fp=fopen("erer.bmp","rb");

	fread(&head,sizeof(head),1,fp);

	fread(&dib,sizeof(dib),1,fp);

	printf("enter key :");
	scanf("%d",&key);

	ht=dib.biHeight;
	wd=dib.biWidth;

	tot=ht*wd;
	l=tot;
	printf("lll");

	while(l>0)
	{
		l=l/2;
		max++;
	}
	printf("max=%d",max);

	if(wd%4!=0)
	  buff=4-((wd*3)%4);


rand_pos=(int*)malloc((max)*sizeof(int));

srand(key);

a=(float)tot/(float)RAND_MAX;
printf("\n%f",a);

j=0;
chk=0;
printf("neel");

for(i=0;i<max;i++)
{
	//printf("outer");
	
	do
	{
		if(a!=0)
			pos=(int)(rand()*a);
		else
			pos=rand()%tot;

		//printf("middle");
		for(k=0;k<j;k++)
		{
			if((rand_pos[k]==pos)||pos==1)
			{
				chk=1;
				break;
			}
			
			chk=0;
		}

	}while(chk==1);

	rand_pos[j]=pos;
	j++;
}
	printf("\n j=%d putush",j);
	printf("\nnum=%d",rand_pos[16]);
	printf("\n max=%d",max);

	//for(i=0;i<max;i++)
	//{	printf("\n%d ",i);
	//	printf("%d",rand_pos[i]);
	//}
	
	printf("opop");

	for(i=0;i<max;i++)
	{
	   // printf("lolo");
	    rewind(fp);

		if(rand_pos[i]%wd!=0)
			no_junk=(int)(rand_pos[i]/wd)*buff;
		else
			no_junk=(int)((rand_pos[i]-1)/wd)*buff;	
	
		fseek(fp,(54+3*(rand_pos[i]-1)+no_junk),SEEK_SET);
	    
		fread(&info,sizeof(info),1,fp);
		//printf("\n%d %d %d",info.bl,info.gr,info.rd);
		if(info.rd&p)
		val=val+(int)pow(2,max-(i)-1);
	    
	}
//printf("amrik");

	printf("val=%d",val);

	string=(char*)malloc((val/7+1)*sizeof(char));

	rand_pos=(int*)realloc(rand_pos,(val+max)*sizeof(int));

	
j=max;
chk=0;

	for(i=0;i<val;i++)
	{
		//printf("outer");
	
		do
		{
			if(a!=0)
				pos=(int)(rand()*a);
			else
				pos=rand()%tot;

			//printf("middle");
			for(k=0;k<j;k++)
			{
				if((rand_pos[k]==pos)||pos==1)
				{
					chk=1;
					break;
				}
			
				chk=0;
			}

		}while(chk==1);

		rand_pos[j]=pos;
		j++;
	}

	//for(i=0;i<val;i++)
		//printf("\n%d",rand_pos[i]);

	ch=0;
	k=6;
	j=0;
	//printf("lklk");
	for(i=0;i<val;i++)
	{
	    rewind(fp);

		if(rand_pos[i]%wd!=0)
			no_junk=(int)(rand_pos[i+max]/wd)*buff;
		else
			no_junk=(int)((rand_pos[i+max]-1)/wd)*buff;	
	
		fseek(fp,(54+3*(rand_pos[i+max]-1)+no_junk),SEEK_SET);
	      
		fread(&info,sizeof(info),1,fp);
		//printf("\n%d %d %d",info.bl,info.gr,info.rd);
		if(info.rd&p)
			ch=ch+(int)pow(2,k);

		k--;
		if((i+1)%7==0)
		{
			string[j]=ch;
			ch=0;
			j++;
			k=6;
		}

	      
	}
	string[j]='\0';

	fclose(fp);
	printf("\nThe encrypted Message:%s\n",string);
}

