#include<stdio.h>



int a[100][100],fix[100][100];
int n,cnt=0,steps;
FILE *fp,*fo,*fc;
void solve(int x,int y)
{
	int i,j,m,l,chk;
	steps++;
	
	if(cnt>2)
		return;
		
	if(fix[x][y]==1)
	{
				if(x==n&&y==n)
				{
					for(m=1;m<=n;m++)
					{
						for(l=1;l<=n;l++)
							fprintf(fo,"%d ",a[m][l]);

						fprintf(fo,"\n");
					}

					cnt++;
					//fprintf(fo,"%d\n",cnt);

					fprintf(fo,"\n");

				}
				else
				{
					if(y<n)
						solve(x,y+1);
					else if(y==n)
						solve(x+1,1);
				}

	}
	else
	{

		for(i=1;i<=n;i++)
		{
			chk=0;
			for(j=1;j<=n;j++)
			{
				if(a[j][y]==i)
				{
					chk=1;
					break;
				}
			}

			for(j=1;j<=n;j++)
			{
				if(a[x][j]==i)
				{
					chk=1;
					break;
				}
			}

			if(chk==0)
			{
				a[x][y]=i;

				if(x==n&&y==n)
				{
					for(m=1;m<=n;m++)
					{
						for(l=1;l<=n
							;l++)
							fprintf(fo,"%d ",a[m][l]);

						fprintf(fo,"\n");
					}

					cnt++;
					//fprintf(fo,"%d\n",cnt);
				

					fprintf(fo,"\n");
				}
				else
				{
					if(y<n)
						solve(x,y+1);
					else if(y==n)
						solve(x+1,1);
				}
			}

		}

		a[x][y]=-1;
	}
}

int main ()
{
	int temp,i,j,k,tot=0,avg=0,max=-1,mc=-1;

	n=8;

	fp=fopen("state2.txt","r+");
	fo=fopen("output_ulti.txt","w+");
	fc=fopen("critical.txt","w+");

	if((fp==NULL)||(fo==NULL))
		printf("joghono");

	//printf("Enter matix :");

	for(k=0;k<5419006;k++)
	{
		fprintf(fo,"\n");
		for(i=1;i<=n;i++)
		{
			for(j=1;j<=n;j++)
			{
				fscanf(fp,"%d",&temp);
				fprintf(fo,"%d ",temp);
				if(temp!=0)
				{
					a[i][j]=temp;
					fix[i][j]=1;
				}
				else
				{
					a[i][j]=-1;
					fix[i][j]=0;
				}
			}
			fprintf(fo,"\n");
		}
		fprintf(fo,"\n");
			cnt=0;
			steps=0;
			solve(1,1);

			//printf("no :%d cnr :%d\n",k,cnt);
			fprintf(fo,"count :%d steps :%d",cnt,steps);

			if(steps>max)
				max=steps;

			if(cnt>mc)
				mc=cnt;

			tot+=steps;
			fprintf(fo,"\n");
			for(i=0;i<150;i++)
				fprintf(fo,"-");

			fprintf(fo,"\n");
			if(k%1000==0)
				printf("%d\n",k);
				
			if(cnt==1)
			{
				for(i=1;i<=n;i++)
				{
					for(j=1;j<=n;j++)
					{
						if(a[i][j]==-1)
							fprintf(fc,"0 ");
						else
							fprintf(fc,"%d ",a[i][j]);
							
					}
					fprintf(fc,"\n");
				}
				fprintf(fc,"\n\n");
				
			}
			
			//getch();
	}
printf("done");
printf("max :%d  tot :%d   avg:%d max_coun :%d\n",max,tot,tot/2126,mc);

		return 0;
}
