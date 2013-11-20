#include<stdio.h>
#include<string.h>
#include<conio.h>
#include<stdlib.h>
#include<math.h>

int score[100][100],gap,scmat[100][100],num_seq,num_clust,visit[100];
float dismat[200][200];
char charset[100],seq[100][100];

struct clust
{
	char seq_list[100][100];
	int tot_seq;
}cluster[200];

int map(char x)
{
	int len,i;

	len=strlen(charset);

	for(i=0;i<len;i++)
		if(x==charset[i])
			return i;
}

int ned_wunz(char s1[],char s2[],char al1[],char al2[])
{
	int dp[100][100],path[100][100],i,j,t1,t2,t3,x,y,tmp,k;
	int ln1 = strlen(s1),ln2 = strlen(s2);

	dp[0][0]=0;

	for(i=1;i<=ln1;i++)
	{
		dp[i][0] = gap*i;
		path[i][0] = 1;
	}
	for(i=1;i<=ln2;i++)
	{
		dp[0][i] = gap*i;
		path[0][i] = 2;
	}

	for(i=1;i<=ln1;i++)
		for(j=1;j<=ln2;j++)
		{
			if((s1[i-1]=='X')||(s2[j-1]=='X'))
			{
				t1 = dp[i-1][j-1];
				t2 = dp[i-1][j];
				t3 = dp[i][j-1];
			}
			else
			{
				t1 = dp[i-1][j-1]+score[map(s1[i-1])][map(s2[j-1])];
				t2 = dp[i-1][j] + gap;
				t3 = dp[i][j-1] + gap;
			}

			if(t1>=t2)
			{
				if(t1>=t3)
				{
					dp[i][j] = t1;
					path[i][j] = 0;
				}
				else
				{
					dp[i][j] = t3;
					path[i][j] = 2;
				}				
			}
			else
			{
				if(t2>=t3)
				{
					dp[i][j] = t2;
					path[i][j] = 1;
				}
				else
				{
					dp[i][j] = t3;
					path[i][j] = 2;
				}
			}
		}
		x=ln1;
		y=ln2;
		k = 0;
		while(x!=0 || y!=0)
		{
			if(path[x][y]==0)
			{
				al1[k] = s1[x-1];
				al2[k] = s2[y-1];
				x--;
				y--;
			}
			else if(path[x][y]==1)
			{
				al1[k] = s1[x-1];
				al2[k] = '-';
				x--;
			}
			else
			{
				al1[k] = '-';
				al2[k] = s2[ y-1];
				y--;
			}
			k++;
		}
		al1[k] = '\0';
		al2[k] = '\0';

		for(i=0;i<k/2;i++)
		{
			tmp = al1[i];
			al1[i] = al1[k-i-1];
			al1[k-i-1] = tmp;

			tmp = al2[i];
			al2[i] = al2[k-i-1];
			al2[k-i-1] = tmp;
		}

		return (dp[ln1][ln2]);
}

void gen_scmat()
{
	int i,j;
	char al1[100],al2[100];

	memset(scmat,0,100*100*sizeof(int));

	for(i=0;i<num_seq;i++)
		for(j=i;j<num_seq;j++)
		{
			scmat[i][j] = ned_wunz(seq[i],seq[j],al1,al2);
		}

}

int seq_rand(char s1[],char s2[])
{
	int ln1,lch,ln2,n,max,i;
	char al1[100],al2[100],a1[100],a2[100];

	ln1=strlen(s1);
	ln2=strlen(s2);
	lch=strlen(charset);

	for(i=0;i<ln1;i++)
	{
		n=rand()%lch;
		al1[i]=charset[n];
	}

	al1[ln1]='\0';

	for(i=0;i<ln2;i++)
	{
		n=rand()%lch;
		al2[i]=charset[n];
	}

	al2[ln2]='\0';

	max=ned_wunz(al1,al2,a1,a2);

	return max;
}

float find_dist(int i,int j,int l)
{
	float dil,djl,m;

	if(i>l)
		dil=dismat[l][i];
	else
		dil=dismat[i][l];

	if(j>l)
		djl=dismat[l][j];
	else
		djl=dismat[j][l];


	m=(dil*cluster[i].tot_seq+djl*cluster[j].tot_seq)/(cluster[i].tot_seq+cluster[j].tot_seq);

	return m;

}
void clust_align(int r,int l)
{
	int row,col,max = -9999999,len,h,k,i,j,nxt,temp;
	char al1[100],al2[100];

	

	for(i=0;i<cluster[r].tot_seq;i++)
	{
		for(j=0;j<cluster[l].tot_seq;j++)
		{
			temp = ned_wunz(cluster[r].seq_list[i],cluster[l].seq_list[j],al1,al2);
			if(temp>max)
			{
				max = temp;
				row = i;
				col = j;
			}
		}
	}

	
	ned_wunz(cluster[r].seq_list[row],cluster[l].seq_list[col],al1,al2);
	
	for(k=0;k<cluster[r].tot_seq;k++)
	{
		if(k==row)
			strcpy(cluster[num_clust].seq_list[k],al1);
		else
		{
			nxt =0;
			len =strlen(al1);
			for(h=0;h<len;h++)
			{
				if(al1[h]=='-')
					cluster[num_clust].seq_list[k][h]='-';
				else
				{
					cluster[num_clust].seq_list[k][h] = cluster[r].seq_list[k][nxt];
					nxt++;
				}
			}
			cluster[num_clust].seq_list[k][len]='\0';
		}
		
	}
	for(k=0;k<cluster[l].tot_seq;k++)
	{
		if(k==col)
			strcpy(cluster[num_clust].seq_list[k+cluster[r].tot_seq],al2);
		else
		{
			nxt =0;
			len =strlen(al2);
			for(h=0;h<len;h++)
			{
				if(al2[h]=='-')
					cluster[num_clust].seq_list[k+cluster[r].tot_seq][h]='-';
				else
				{
					cluster[num_clust].seq_list[k+cluster[r].tot_seq][h] = cluster[l].seq_list[k][nxt];
					nxt++;
				}
			}
			cluster[num_clust].seq_list[k+cluster[r].tot_seq][len]='\0';
		}
		
	}

	cluster[num_clust].tot_seq = cluster[l].tot_seq + cluster[r].tot_seq;

	

	for(i=0;i<cluster[num_clust].tot_seq;i++)
	{
		len = strlen(al1);
		for(j=0;j<len;j++)
			if(cluster[num_clust].seq_list[i][j]=='-')
				cluster[num_clust].seq_list[i][j] = 'X';
	}

	num_clust++;

	visit[r]=1;
	visit[l]=1;

	for(i=0;i<(num_clust-1);i++)
	{
		if(visit[i]!=1)
		{
			dismat[i][num_clust-1]=find_dist(r,l,i);
		}
	}
}

void gen_dismat()
{
	int i,j;
	float s_obs,s_rand,s_max;

	for(i=0;i<200;i++)
		for(j=0;j<200;j++)
			dismat[i][j] = 0;
	
	for(i=0;i<num_seq;i++)
		for(j=i+1;j<num_seq;j++)
		{
			s_obs=(float)scmat[i][j];			
			s_max=((float)(scmat[i][i]+scmat[j][j]))/2;
			s_rand = s_obs;
			while(s_rand>=s_obs || s_rand>=s_max)
				s_rand=seq_rand(seq[i],seq[j]);
			dismat[i][j]=-log((s_obs-s_rand)/(s_max-s_rand));
		}
}

void matrixmin(int n,int *row,int *col)
{
	float min = 99999999999.0;

	for(int i=0;i<n;i++)
	{
		if(visit[i]==1)
			continue;
		for(int j=i+1;j<n;j++)
		{
			if(visit[j]==1)
				continue;

			if(min>dismat[i][j])
			{
				min = dismat[i][j];
				*row = i;
				*col =j;
			}
		}
	}
}

void init_clust()
{
	for(int i=0;i<num_seq;i++)
	{
		cluster[i].seq_list[0][0]='\0';
		strcpy(cluster[i].seq_list[0],seq[i]);
		cluster[i].tot_seq = 1;
	}
	num_clust = num_seq;
}

int Make_SP()
	{
		int i,j,k,sum=0;
		int len = strlen(cluster[num_clust-1].seq_list[0]);
		for(i=0;i<len;i++)
			{
				for(j=0;j<(num_seq-1);j++)
					{
						for(k=j+1;k<num_seq;k++)
							{
								if(cluster[num_clust-1].seq_list[j][i]=='X' || cluster[num_clust-1].seq_list[k][i]=='X')
									continue;
								
								sum += score[map(cluster[num_clust-1].seq_list[j][i])][map(cluster[num_clust-1].seq_list[k][i])];
							}
					}
			}
		return sum;
	}

int main()
{
	FILE *f;

	char s1[100],s2[100],al1[300],al2[300];
	int i,j,len,max,row,col,ch;
	srand(123456789);

	printf("Enter rype of sequence :\n");
	printf("1.Protein sequence\n");
	printf("2.Nucleotide sequence\n");
	scanf("%d",&ch);

	if(ch==1)
		f=fopen("blosum62.txt","r");
	else
		f=fopen("iub.txt","r");

	//printf("Enter the CharacterSet :\n");
	fscanf(f,"%s",charset);

	//printf("Enter Scoring Matrix :\n");
	len = strlen(charset);
	for(i=0;i<len;i++)
		for(j=0;j<len;j++)
			fscanf(f,"%d",&score[i][j]);

	printf("Enter Gap Penalty:\n");
	scanf("%d",&gap);

	printf("Enter Number of Sequences :\n");
	scanf("%d",&num_seq);

	for(i=0;i<num_seq;i++)
		scanf("%s",seq[i]);

	gen_scmat();
	init_clust();

	for(i=0;i<100;i++)
		visit[i]=0;

	while(1)
	{

		int chk=0;
		for(i=0;i<(num_clust-1);i++)
		{
			if(visit[i]==0)
			{
				chk=1;
				break;
			}
		}

		if(chk==0)
			break;

		matrixmin(num_clust,&row,&col);
		clust_align(row,col);
	}

	printf("\n\nFINAL :\n");
	for(i=0;i<cluster[num_clust-1].tot_seq;i++)
	{
		len=strlen(cluster[num_clust-1].seq_list[i]);

		for(j=0;j<len;j++)
		{
			if(cluster[num_clust-1].seq_list[i][j]=='X')
				printf("-");
			else
				printf("%c",cluster[num_clust-1].seq_list[i][j]);
		}

		printf("\n");
	}

	printf("\n\nFinal SP Score : %d",Make_SP());
	getch();
	return 0;
}