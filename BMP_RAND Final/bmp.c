#include<stdio.h>
#include<stdlib.h>
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

struct rgb
{
unsigned char bl;
unsigned char gr;
unsigned char rd;
}info;

main()
{

FILE *fp,*fp1;

unsigned char p=1,q=254;
char s[100000],c; 
int i,m,j,k,length,*temp,*bitstring,ht,wd,buff=0,tot,max=0,*rand_pos,pos,chk,key,no_junk,l;
float a;

BITMAPFILEHEADER head;
BITMAPINFOHEADER dib;

printf("\n%d %d",sizeof(BITMAPFILEHEADER),sizeof(BITMAPINFOHEADER));


if((fp1=fopen("Entry.txt","r"))==NULL)
		printf("\nError in fetching text");

	i=0;
	while(!feof(fp1))
	{
		c=getc(fp1);
		s[i]=c;
		i++;
	}
	fclose(fp1);
	s[i]='\0';


//printf("\nEnter Line of text to embed:");
//gets(s);

bitstring=(int *)malloc(7*sizeof(int)*strlen(s));

k=strlen(s);

for(i=1;i<=k;i++)
{
  m=(int)s[i-1];
  j=7*(i)-1;
  while(j>=7*(i-1))
  {
     if(m/2!=0 || m==1)
     {
      bitstring[j]=m%2;
      m=m/2;
     }
     else
      bitstring[j]=0;
     j--;
  }
}

printf("\nString Length=%d\n",strlen(s));

for(i=0;i<7*k;i++)
{
	//printf("%d",bitstring[i]);
}

length=7*k;
k=length;

printf("\n\nenter ur key(1-1000) :");
scanf("%d",&key);



fp=fopen("1.bmp","rb+");

//printf("\npos=%ld",ftell(fp));

fread(&head,sizeof(head),1,fp);
//printf("\npos=%ld",ftell(fp));

fread(&dib,sizeof(dib),1,fp);
//printf("\npos=%ld",ftell(fp));

//printf("%d\t%ld\t%d\t%d\t%ld\n",head.bfType,head.bfSize,head.bfReserved1,head.bfReserved2,head.bfOffBits);
printf("width=%ld height=%ld",dib.biWidth,dib.biHeight);

ht=dib.biHeight;
wd=dib.biWidth;

tot=ht*wd;
l=tot;

if(wd%4!=0)
	buff=4-((wd*3)%4);

while(l>0)
{
	l=l/2;
	max++;
}

temp=(int*)malloc(max*sizeof(int));
rand_pos=(int*)malloc((max+length)*sizeof(int));

srand(key);

a=(float)tot/(float)RAND_MAX;
printf("\n%f",a);

j=0;
chk=0;

for(i=0;i<max+length;i++)
{	
	do
	{
		if(a!=0)
			pos=(int)(rand()*a);
		else
			pos=rand()%tot;

	
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

//for(i=0;i<max+length;i++)
	//printf("\n%d",rand_pos[i]);

printf("\n chitro");
k=length;

i=max-1;
while(i>=0)
{
  if(k/2!=0 || k==1)
  {
  temp[i]=k%2;
  k=k/2;
  }
  else
    temp[i]=0;
  i--;
}
printf("\n");

for(i=0;i<max;i++)
{
	printf("%d",temp[i]);
}

//fseek(fp,3,SEEK_CUR);


for(i=0;i<max;i++)
{
 /* if((i)%wd==0&&buff!=0)
  {
	  fseek(fp,buff,SEEK_CUR);
  }*/

	rewind(fp);

	if(rand_pos[i]%wd!=0)
		no_junk=(int)(rand_pos[i]/wd)*buff;
	else
		no_junk=(int)((rand_pos[i]-1)/wd)*buff;	
	
	fseek(fp,(54+3*(rand_pos[i]-1)+no_junk),SEEK_SET);
  
    fread(&info,sizeof(info),1,fp);
    //printf("\n%d %d %d",info.bl,info.gr,info.rd);
  
    if(temp[i]==0)
      info.rd=info.rd&q;
    else if(temp[i]==1)
      info.rd=info.rd|p;
  
    fseek(fp,-sizeof(info),SEEK_CUR);
    fwrite(&info,sizeof(info),1,fp);
	
    fseek(fp,-sizeof(info),SEEK_CUR);
    fread(&info,sizeof(info),1,fp);
    //printf("\t%d %d %d",info.bl,info.gr,info.rd);
  

}

for(i=max;i<max+length;i++)
{
	rewind(fp);

	if(rand_pos[i]%wd!=0)
		no_junk=(int)(rand_pos[i]/wd)*buff;
	else
		no_junk=(int)((rand_pos[i]-1)/wd)*buff;	
	
	fseek(fp,(54+3*(rand_pos[i]-1)+no_junk),SEEK_SET);
    //printf("\n%d %d %d",info.bl,info.gr,info.rd);

	fread(&info,sizeof(info),1,fp);

    if(bitstring[i-(max)]==0)
      info.rd=info.rd&q;
    else if(bitstring[i-(max)]==1)
      info.rd=info.rd|p;

    fseek(fp,-sizeof(info),SEEK_CUR);
    fwrite(&info,sizeof(info),1,fp);

    fseek(fp,-sizeof(info),SEEK_CUR);
    fread(&info,sizeof(info),1,fp);
    //printf("\t%d %d %d",info.bl,info.gr,info.rd);

}
fclose(fp);
}

