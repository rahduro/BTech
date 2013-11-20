#include <stdio.h>
#include <stdlib.h>
#include <string.h>

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
	char s[50000]; 
	int i,m,j,k,length,*temp,*bitstring,tot,max=0,sec,pos1,pos,*rand_pos,cnt,chk,key,no_sec,bit_group;

	WAV_HEADER head;
	SAMPLE smpl;

	if((fp=fopen("Koi.wav","rb+"))==NULL)
	{
		printf("File open error");
		exit(0);
	}
	fread(&head,sizeof(head),1,fp);
	
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

	rand_pos=(int*)malloc((max+length)*sizeof(int));

	no_sec=(int)tot/(int)head.Sample_Rate;
	
	bit_group=10000;//(int)(max+length)/(int)no_sec+1;
	
	j=0;
	chk=0;

	for(i=0;i<max+length;i++) // the loop is used first to define the no of seconds
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

	//for(i=0;i<max+length;i++)
		//printf("\n%d",rand_pos[i]);

	for(i=0;i<max;i++)
	{
 
		rewind(fp);

	
		fseek(fp,(sizeof(head)+4*rand_pos[i]),SEEK_SET);
  
    		fread(&smpl,sizeof(smpl),1,fp);

    		if(temp[i]==0)
      			smpl.data=smpl.data&q;
    		else if(temp[i]==1)
      			smpl.data=smpl.data|p;
  
    		fseek(fp,-sizeof(smpl),SEEK_CUR);
    		fwrite(&smpl,sizeof(smpl),1,fp);
	
    		fseek(fp,-sizeof(smpl),SEEK_CUR);
    		fread(&smpl,sizeof(smpl),1,fp);
    
	}

	for(i=max;i<max+length;i++)
	{
		rewind(fp);

		
		fseek(fp,(sizeof(head)+4*rand_pos[i]),SEEK_SET);

		fread(&smpl,sizeof(smpl),1,fp);

    		if(bitstring[i-(max)]==0)
      			smpl.data=smpl.data&q;
    		else if(bitstring[i-(max)]==1)
      			smpl.data=smpl.data|p;

    		fseek(fp,-sizeof(smpl),SEEK_CUR);
    		fwrite(&smpl,sizeof(smpl),1,fp);

    		fseek(fp,-sizeof(smpl),SEEK_CUR);
    		fread(&smpl,sizeof(smpl),1,fp);

	}
	
	fclose(fp);
}
	
