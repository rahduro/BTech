#include<stdio.h>
#include<string.h>
#include<conio.h>
#include<stdlib.h>
#include<math.h>

char charset[100],seq[100][100];
int gap,num_seq,score[100][100],num_clust,alive,visit[100];
float hamdist[100][100],dismat[100][100];


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
	alive = num_seq;
}

void init_ham()
	{
		int i,j,k,len,mismatch,count;
		char al1[100],al2[100];

		for(i=0;i<num_seq;i++)
			{
				for(j=0;j<num_seq;j++)
					{
						ned_wunz(seq[i],seq[j],al1,al2);
						
						//printf("%s\n%s\n",al1,al2);
						
						len = strlen(al1);
						mismatch = 0;
						count = 0;
						
						for(k=0;k<len;k++)
							{
								if(al1[k]=='-' || al2[k]=='-')
									continue;
								else if(al1[k]!=al2[k])
									mismatch++;
								count++;
							}
						//printf("%d %d : %d\t%d\n\n",i,j,mismatch,count);
						hamdist[i][j] = ((float)mismatch)/((float)count);
					}
			}
	}

void init_dist()
	{
		int i,j;
		float r[100];

		for(i=0;i<100;i++)
			r[i] = 0.0;

		for(i=0;i<num_clust;i++)
			{
				if(visit[i]==0)
					{
						for(j=0;j<num_seq;j++)
							if(visit[j]==0)
								r[i] += hamdist[i][j];
					}
			}
		for(i=0;i<num_clust;i++)
			{
				if(visit[i]==0)
				for(j=i+1;j<num_seq;j++)
					{
						if(visit[j]==0)
							dismat[i][j] = hamdist[i][j] - (r[i]+r[j])/(alive-2);
					}
			}	
	}

float calc_score(int x,int y,int i,int j)
	{
		int k,l;
		float sum=0.0;

		for(k=0;k<cluster[x].tot_seq;k++)
			{
			for(l=0;l<cluster[y].tot_seq;l++)
				{
					if(cluster[x].seq_list[k][i]=='X'||cluster[y].seq_list[l][j]=='X')
						continue;

					sum=sum+score[map(cluster[x].seq_list[k][i])][map(cluster[y].seq_list[l][j])];
				}
			}

		sum=sum/((cluster[x].tot_seq)*(cluster[y].tot_seq));

		return sum;

	}

float calc_gap(int x,int i)
	{
		int k,cnt=0;
		float GOP=(float)gap;

		for(k=0;k<cluster[x].tot_seq;k++)
			{
				if(cluster[x].seq_list[k][i]=='X')
					cnt++;
			}
		if(cnt!=0)
			GOP = GOP*0.3*((cluster[x].tot_seq-cnt)/cluster[x].tot_seq);

		return GOP;		
	}

void update_hammat(int x,int y)
	{
		int i;
		for(i=0;i<(num_clust-1);i++)
			if(visit[i]==0)
				{
					hamdist[i][num_clust] = (hamdist[i][x]+hamdist[i][y]-hamdist[x][y])/2;
					hamdist[num_clust][i] = hamdist[i][num_clust];
				}
	}

void clust_align(int x,int y)
	{
		int i,j,k,h,path[100][100],len;
		char tmp;
		float dp[100][100],t1,t2,t3;

		dp[0][0]=0;

		int ln1 = strlen(cluster[x].seq_list[0]);
		int ln2 = strlen(cluster[y].seq_list[0]);

		for(i=1;i<=ln1;i++)
		{
			dp[i][0] = (float)(gap)*i;
			path[i][0] = 1;
		}

		for(i=1;i<=ln2;i++)
		{
			dp[0][i] = (float)(gap)*i;
			path[0][i] = 2;
		}

		for(i=1;i<=ln1;i++)
			{
				for(j=1;j<=ln2;j++)
				{
					t1 = dp[i-1][j-1]+calc_score(x,y,i-1,j-1);
					t2 = dp[i-1][j] + calc_gap(x,i-1);
					t3 = dp[i][j-1] + calc_gap(y,j-1);

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
			}

		i=ln1;
		j=ln2;
		k = 0;
		while(i!=0 || j!=0)
		{
			if(path[i][j]==0)
			{
				for(h=0;h<cluster[x].tot_seq;h++)
				{
					cluster[num_clust].seq_list[h][k]=cluster[x].seq_list[h][i-1];
				}

				for(h=0;h<cluster[y].tot_seq;h++)
				{
					cluster[num_clust].seq_list[h+cluster[x].tot_seq][k]=cluster[y].seq_list[h][j-1];
				}

				i--;
				j--;

			}
			else if(path[i][j]==1)
			{
				for(h=0;h<cluster[x].tot_seq;h++)
				{
					cluster[num_clust].seq_list[h][k]=cluster[x].seq_list[h][i-1];
				}

				for(h=0;h<cluster[y].tot_seq;h++)
				{
					cluster[num_clust].seq_list[h+cluster[x].tot_seq][k]='-';
				}
				i--;
			}
			else
			{
				for(h=0;h<cluster[x].tot_seq;h++)
				{
					cluster[num_clust].seq_list[h][k]='-';
				}

				for(h=0;h<cluster[y].tot_seq;h++)
				{
					cluster[num_clust].seq_list[h+cluster[x].tot_seq][k]=cluster[y].seq_list[h][j-1];
				}

				j--;
			}
			k++;
		}

		cluster[num_clust].tot_seq = cluster[x].tot_seq + cluster[y].tot_seq;

		for(i=0;i<cluster[num_clust].tot_seq;i++)
			{
				cluster[num_clust].seq_list[i][k]='\0';
			}

		
		for(j=0;j<cluster[num_clust].tot_seq;j++)
			{
				for(i=0;i<k/2;i++)
				{
					tmp = cluster[num_clust].seq_list[j][i];
					cluster[num_clust].seq_list[j][i] = cluster[num_clust].seq_list[j][k-i-1];
					cluster[num_clust].seq_list[j][k-i-1] = tmp;

				}
			}

		for(i=0;i<cluster[num_clust].tot_seq;i++)
		{
			len = k;
			for(j=0;j<len;j++)
				if(cluster[num_clust].seq_list[i][j]=='-')
					cluster[num_clust].seq_list[i][j] = 'X';
		}


		num_clust++;
		alive--;

		visit[x] = 1;
		visit[y] = 1;

		update_hammat(x,y);
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
	len = strlen(charset);

	//printf("Enter Scoring Matrix :\n");
	
	for(i=0;i<len;i++)
		for(j=0;j<len;j++)
			fscanf(f,"%d",&score[i][j]);

	printf("Enter Gap Penalty:\n");
	scanf("%d",&gap);

	printf("Enter Number of Sequences :\n");
	scanf("%d",&num_seq);

	printf("Enter sequences :\n");

	for(i=0;i<num_seq;i++)
		scanf("%s",seq[i]);

	num_clust = num_seq;
	alive = num_clust;

	for(i=0;i<100;i++)
		visit[i] = 0;

	init_ham();
	
	/*for(i=0;i<num_seq;i++)
		{
			for(j=0;j<num_seq;j++)
			{
				printf("%f ",hamdist[i][j]);
			}
			printf("\n");
		}
	printf("---------------------------------------------\n");*/
	init_dist();

	/*for(i=0;i<num_seq;i++)
		{
			for(j=0;j<num_seq;j++)
			{
				if(j<=i)
					printf("          ");
				else
					printf("%f ",dismat[i][j]);
			}
			printf("\n");
		}*/


	init_clust();
	
	while(alive>2)
		{
			/*for(i=0;i<num_clust;i++)
				{
					printf("Cluster : %d\n",i+1);
					for(j=0;j<cluster[i].tot_seq;j++)
						printf("%s\n",cluster[i].seq_list[j]);
				}
			printf("\n#######################################\n\n");
			getch();*/
			init_dist();
			matrixmin(num_clust,&row,&col);
			clust_align(row,col);
		}
	
	matrixmin(num_clust,&row,&col);
	clust_align(row,col);
	
	len = strlen(cluster[num_clust-1].seq_list[0]);
	printf("\n\nFinal Output :\n\n");
	for(j=0;j<cluster[num_clust-1].tot_seq;j++)
	{
		for(i=0;i<len;i++)
			{
				if(cluster[num_clust-1].seq_list[j][i]=='X')
					printf("-");
				else
					printf("%c",cluster[num_clust-1].seq_list[j][i]);
			}
		printf("\n");
	}


	printf("\n\nFinal SP Score : %d",Make_SP());

	getch();
	return 0;
	}
