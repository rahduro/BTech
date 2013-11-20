#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include<math.h>

#pragma pack(2)
typedef struct header
{

	int chunkid ;
	int	File_Size; 
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
	short p=1;
	char *string;
	int i,j,k,tot,max=0,val=0,ch;
	WAV_HEADER head;
	SAMPLE smpl;
	
	if((fp=fopen("Koi.wav","rb+"))==NULL)
	{
		printf("File open error");
		exit(0);
	}
	fread(&head,sizeof(head),1,fp);

	tot=head.Data_Size/4;

	while(tot>0)
	{
		tot=tot/2;
		max++;
	}

	printf("max=%d",max);

	for(i=0;i<max;i++)
	{
		fread(&smpl,sizeof(smpl),1,fp);
		//printf("\n%d ",smpl.data);
		if(smpl.data&p)
		val=val+(int)pow(2,max-i-1);
	    
	}

	printf("val=%d",val);

	string=(char*)malloc((val/7+1)*sizeof(char));
	
	ch=0;
	k=6;
	j=0;
	for(i=0;i<val;i++)
	{
		fread(&smpl,sizeof(smpl),1,fp);
		//printf("\n%d ",smpl.data);
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
