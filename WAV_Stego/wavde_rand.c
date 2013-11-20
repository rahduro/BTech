#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include<math.h>

#pragma pack(2)
typedef struct header
{

	int chunkid ;
	int File_Size; 
	int File_Format;
	int SubChunk1_ID;
	int SubChunk1_Size;
	short Audio_Format; 
	short num_channel;
	int Sample_Rate;
	int Byte_Rate;
	short Block_Alignment;
	short Bit_Sample;
	int SubChunk2_ID;
	int Data_Size;
} WAV_HEADER;

typedef struct sample
{
	short data;
}SAMPLE;

void main()
{
	FILE *fp;

	short p=1,q=-2;
	char *string; 
	int i,m,j,k,length,*temp,*bitstring,tot,max=0,sec,pos1,pos,*rand_pos,cnt,chk,key,no_sec,bit_group,val=0,ch;

	WAV_HEADER head;
	SAMPLE smpl;

	if((fp=fopen("Koi.wav","rb+"))==NULL)
	{
		printf("File open error");
		exit(0);
	}
	fread(&head,sizeof(head),1,fp);
	printf("\n\nenter ur key(1-9999) :");
	scanf("%d",&key);
	
	srand(key);

	tot=(int)head.Data_Size/4;
	i=tot;

	while(i>0)
	{
		i=i/2;
		max++;
	}

	printf("%d",max);

	rand_pos=(int*)malloc((max)*sizeof(int));

	no_sec=(int)tot/(int)head.Sample_Rate;
	
	bit_group=10000;//(int)(max+length)/(int)no_sec+1;
	
	j=0;
	chk=0;

	for(i=0;i<max;i++) // the loop is used first to define the no of seconds
	{
	
		do
		{
			sec=rand()%no_sec;

			pos=rand()%head.Sample_Rate;
			pos1=sec*head.Sample_Rate+pos;

			cnt=0;

			for(k=0;k<j;k++)
			{
				if(rand_pos[k]==pos1)
				{
					chk=1;
					break;
				}

				if((int)(rand_pos[k]/head.Sample_Rate)==sec)
				{
					cnt++;
				}
				if(cnt>bit_group)
				{
					chk=1;
					break;
				}
				
			
				chk=0;
			}

		}while(chk==1);

		rand_pos[j]=pos1;
		j++;	
	}

	for(i=0;i<max;i++)
	{
	    	rewind(fp);

		fseek(fp,(sizeof(head)+4*rand_pos[i]),SEEK_SET);
	    
		fread(&smpl,sizeof(smpl),1,fp);
		
		if(smpl.data&p)
		 val=val+(int)pow(2,max-(i)-1);
	    
	}

	printf("\n%d\n",val);

	string=(char*)malloc((val/7+1)*sizeof(char));

	rand_pos=(int*)realloc(rand_pos,(val+max)*sizeof(int));

	j=max;
	chk=0;

	//bit_group=(int)(max+val)/(int)no_sec+1;

	for(i=0;i<val;i++) // the loop is used first to define the no of seconds
	{
	
		do
		{
			sec=rand()%no_sec;

			pos=rand()%head.Sample_Rate;
			pos1=sec*head.Sample_Rate+pos;

			cnt=0;

			for(k=0;k<j;k++)
			{
				if(rand_pos[k]==pos1)
				{
					chk=1;
					break;
				}

				if((int)(rand_pos[k]/head.Sample_Rate)==sec)
				{
					cnt++;
				}
				if(cnt>bit_group)
				{
					chk=1;
					break;
				}
				
			
				chk=0;
			}

		}while(chk==1);

		rand_pos[j]=pos1;
		j++;	
	}

	//for(i=0;i<max+val;i++)
		//printf("\n%d",rand_pos[i]);

	ch=0;
	k=6;
	j=0;

	for(i=0;i<val;i++)
	{
	    	rewind(fp);
	
		fseek(fp,(sizeof(head)+4*rand_pos[i+max]),SEEK_SET);
	      
		fread(&smpl,sizeof(smpl),1,fp);
		
		if(smpl.data&p)
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

	
