#include<stdio.h>
#include<conio.h>
#include<string.h>

const int LatAb[8][8]={
						1,2,3,4,5,6,7,8,
						2,1,4,3,6,5,8,7,
						3,4,1,2,7,8,5,6,
						4,3,2,1,8,7,6,5,
						5,6,7,8,1,2,3,4,
						6,5,8,7,2,1,4,3,
						7,8,5,6,3,4,1,2,
						8,7,6,5,4,3,2,1
					};
int path[10],elcnt[10],state[8][8],Tot,critSet=0;;
FILE * fp,*fp1;

struct cycle
	{
	int a;
	int b;
	}cyc[5];

struct doublet
	{
	int a;
	int b;
	};

struct triplet
	{
	int a;
	int b;
	int c;
	};

struct quadruplet
	{
	int a;
	int b;
	int c;
	int d;
	};

void cycfind(int m,int n)
	{
	char chk[10];
	int cnt=0;
	
	memset(chk,0,10*sizeof(char));

	for(int i=0;i<8;i++)
		{
			if(chk[i]==1)
				continue;
			
			for(int j=0;j<8;j++)
				if(LatAb[m][i]==LatAb[n][j])
					{
						cyc[cnt].a=i;
						cyc[cnt].b=j;
						chk[i]=chk[j]=1;
						cnt++;
					}
		}
	Tot=cnt;
	}

void recLat(int row)
	{
	struct cycle unres_cyc[50];
	struct doublet ar3[100];
	struct triplet ar1[100];
	struct quadruplet ar2[100];
	int cnt=0,comb_cnt=0,bit[10],chk;

		for(int i=0;i<row;i++)
			{
				cycfind(path[row],path[i]);
				for(int j=0;j<Tot;j++)
					if(state[path[i]][cyc[j].a]!=1 && state[path[i]][cyc[j].b]!=1)
						{
							unres_cyc[cnt]=cyc[j];
							cnt++;
						}

			}
		if(elcnt[path[row]]==2)
			{
				for(int i=0;i<8;i++)
					for(int j=i+1;j<8;j++)
							{
							ar3[comb_cnt].a=i;
							ar3[comb_cnt].b=j;
							comb_cnt++;
							}
				for(int i=0;i<comb_cnt;i++)
					{
						chk=0;
						memset(bit,0,10*sizeof(int));
						bit[ar3[i].a]=1;
						bit[ar3[i].b]=1;
						for(int j=0;j<cnt;j++)
							{
							if(bit[unres_cyc[j].a]!=1 && bit[unres_cyc[j].b]!=1)
								{
									chk=1;
									break;
								}
							}
						if(!chk && row<7)
							{
								//memset(state[path[row]],0,8*sizeof(int));
								for(int x=0;x<8;x++)
									state[path[row]][x]=0;

								state[path[row]][ar3[i].a]=1;
								state[path[row]][ar3[i].b]=1;
								recLat(row+1);
							}
						else if(!chk && row==7)
							{
								for(int x=0;x<8;x++)
									state[path[row]][x]=0;

								state[path[row]][ar3[i].a]=1;
								state[path[row]][ar3[i].b]=1;
								for(int m=0;m<8;m++)
									{
										for(int x=0;x<8;x++)
											{
												if(state[m][x]==1)
													fprintf(fp,"%d ",LatAb[m][x]);
												else
													fprintf(fp,"0 ");
											}
										fprintf(fp,"\n");
									}
								fprintf(fp,"\n\n");
								critSet++;
								//getch();
							}
					}

			}
		else if(elcnt[path[row]]==3)
			{
				for(int i=0;i<8;i++)
					for(int j=i+1;j<8;j++)
						for(int k=j+1;k<8;k++)
							{
							ar1[comb_cnt].a=i;
							ar1[comb_cnt].b=j;
							ar1[comb_cnt].c=k;
							comb_cnt++;
							}
				for(int i=0;i<comb_cnt;i++)
					{
						chk=0;
						memset(bit,0,10*sizeof(int));
						bit[ar1[i].a]=1;
						bit[ar1[i].b]=1;
						bit[ar1[i].c]=1;
						for(int j=0;j<cnt;j++)
							{
							if(bit[unres_cyc[j].a]!=1 && bit[unres_cyc[j].b]!=1)
								{
									chk=1;
									break;
								}
							}
						if(!chk && row<7)
							{
								//memset(state[path[row]],0,8*sizeof(int));
								for(int x=0;x<8;x++)
									state[path[row]][x]=0;

								state[path[row]][ar1[i].a]=1;
								state[path[row]][ar1[i].b]=1;
								state[path[row]][ar1[i].c]=1;
								recLat(row+1);
							}
						else if(!chk && row==7)
							{
								for(int x=0;x<8;x++)
									state[path[row]][x]=0;

								state[path[row]][ar1[i].a]=1;
								state[path[row]][ar1[i].b]=1;
								state[path[row]][ar1[i].c]=1;
								for(int m=0;m<8;m++)
									{
										for(int x=0;x<8;x++)
											{
												if(state[m][x]==1)
													fprintf(fp,"%d ",LatAb[m][x]);
												else
													fprintf(fp,"0 ");
											}
										fprintf(fp,"\n");
									}
								fprintf(fp,"\n\n");
								critSet++;
								//getch();
							}
					}

			}
		else if(elcnt[path[row]]==4)
			{
				for(int i=0;i<8;i++)
					for(int j=i+1;j<8;j++)
						for(int k=j+1;k<8;k++)
							for(int l=k+1;l<8;l++)
							{
							ar2[comb_cnt].a=i;
							ar2[comb_cnt].b=j;
							ar2[comb_cnt].c=k;
							ar2[comb_cnt].d=l;
							comb_cnt++;
							}
				for(int i=0;i<comb_cnt;i++)
					{
						chk=0;
						memset(bit,0,10*sizeof(int));
						bit[ar2[i].a]=1;
						bit[ar2[i].b]=1;
						bit[ar2[i].c]=1;
						bit[ar2[i].d]=1;
						for(int j=0;j<cnt;j++)
							{
							if(bit[unres_cyc[j].a]!=1 && bit[unres_cyc[j].b]!=1)
								{
									chk=1;
									break;
								}
							}
						if(!chk && row<7)
							{
								//memset(state[path[row]],0,8*sizeof(int));
								for(int x=0;x<8;x++)
									state[path[row]][x]=0;

								state[path[row]][ar2[i].a]=1;
								state[path[row]][ar2[i].b]=1;
								state[path[row]][ar2[i].c]=1;
								state[path[row]][ar2[i].d]=1;
								recLat(row+1);
							}
						else if(!chk && row==7)
							{
								for(int x=0;x<8;x++)
									state[path[row]][x]=0;

								state[path[row]][ar2[i].a]=1;
								state[path[row]][ar2[i].b]=1;
								state[path[row]][ar2[i].c]=1;
								state[path[row]][ar2[i].d]=1;
								for(int m=0;m<8;m++)
									{
										for(int x=0;x<8;x++)
											{
												if(state[m][x]==1)
													fprintf(fp,"%d ",LatAb[m][x]);
												else
													fprintf(fp,"0 ");
											}
										fprintf(fp,"\n");
									}
								fprintf(fp,"\n\n");
								critSet++;
								//getch();
							}
					}


			}

	}

int main()
{
	int temp=0;
	printf("Enter Iteration Vector :");
	for(int i=0;i<8;i++)
		scanf("%d",&path[i]);
	
	fp=fopen("state2.txt","w");
	fp1=fopen("perm.txt","r");

	//printf("Enter Number of Elements to Keep in 8 rows respectively :");

		for(int i=0;i<8;i++)
		{
			fscanf(fp1,"%d",&elcnt[i]);	
		}
	
		/*for(int i=0;i<8;i++)
			for(int j=0;j<i;j++)
				{
					cycfind(i,j);
					printf("\n%d,%d :",j,i);
					for(int k=0;k<Tot;k++)
						printf("%d/%d\t",cyc[k].a,cyc[k].b);
				}*/
		memset(state,0,8*8*sizeof(int));
		//state[0][0]=1;
		recLat(0);
		//printf("\nCount %d	:	%d",j,(critSet-temp));
		//temp=critSet;
	
	printf("\nCount :%d",critSet);
	fclose(fp);
	fclose(fp1);
	getch();
	return 0;
}