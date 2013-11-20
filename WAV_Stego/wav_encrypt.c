#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
	short p=1,q=-2;
	char s[50000]; 
	int i,m,j,k,length,*temp,*bitstring,tot,max=0;
	WAV_HEADER head;
	SAMPLE smpl;

	if((fp=fopen("Koi.wav","rb+"))==NULL)
	{
		printf("File open error");
		exit(0);
	}
	fread(&head,sizeof(head),1,fp);

	printf("\nchunkid=%d",head.chunkid);
	printf("\nFile SIze=%d",head.File_Size);
	printf("\nAudio format=%d",head.Audio_Format);
	printf("\nNum channel=%d",head.num_channel);
	printf("\nSample_Rate=%d",head.Sample_Rate);
	printf("\nByte_Rate=%d",head.Byte_Rate);
	printf("\nBlock_Alignment=%d",head.Block_Alignment);
	printf("\nBit_Sample=%d",head.Bit_Sample);
	printf("\nSubChunk2_ID=%d",head.SubChunk2_ID);
	printf("\nData_Size=%d",head.Data_Size);
	
	
	printf("\nEnter Line of text to embed:");
	gets(s);

	bitstring=(int *)malloc(7*sizeof(int)*strlen(s));

	for(i=1;i<=strlen(s);i++)
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

	length=7*strlen(s);
	k=length;

	tot=head.Data_Size/4;

	while(tot>0)
	{
		tot=tot/2;
		max++;
	}

	temp=(int*)malloc(max*sizeof(int));

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

	for(i=0;i<max;i++)
	{
	    fread(&smpl,sizeof(smpl),1,fp);
		//printf("\n%d ",smpl.data);
	  
		if(temp[i]==0)
			smpl.data=smpl.data&q;
		else if(temp[i]==1)
			smpl.data=smpl.data|p;
  
		fseek(fp,-sizeof(smpl),SEEK_CUR);
		fwrite(&smpl,sizeof(smpl),1,fp);
	
		fseek(fp,-sizeof(smpl),SEEK_CUR);
		fread(&smpl,sizeof(smpl),1,fp);
		//printf("\t%d ",smpl.data);
  

	}

	for(i=0;i<length;i++)
	{
		
		fread(&smpl,sizeof(smpl),1,fp);
		//printf("\n%d ",smpl.data);

		if(bitstring[i]==0)
			smpl.data=smpl.data&q;
		else if(bitstring[i]==1)
			smpl.data=smpl.data|p;

		fseek(fp,-sizeof(smpl),SEEK_CUR);
		fwrite(&smpl,sizeof(smpl),1,fp);

		fseek(fp,-sizeof(smpl),SEEK_CUR);
		fread(&smpl,sizeof(smpl),1,fp);
		//printf("\t%d ",smpl.data);

	}

	fclose(fp);


}
