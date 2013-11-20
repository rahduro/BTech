#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<ctype.h>
#include<dirent.h>
#include<malloc.h>

struct info
{
char nam[100];
char telno[9];
char address[200];
};
typedef struct info info;


void create_folder(info,int,int);
void search_tel(char *);
void search_name(char *);
void delete_tel(char *,int,int,int);
void part_show(char *,int);
void delete_name(char *,char *,int,int);
void del_addr(char *);
int checkinput(char *,char *);
int check_existence(char *);
void search_address(char *);
int string_match(char *,char *);
void rewrite();
void stress_input();


main()
{
int i,j,c,k,checker;
char cushion,name[100],num[9],addr[200];
info client;
	printf("\nDo u want automated input:(0/1)");
	scanf("%d",&k);
	if(k==1)
		stress_input();
    while(1)
    {
	printf("\nENTER YOUR CHOICE");
	printf("\n\tenter 1: FOR ENTRY");
	printf("\n\tenter 2: FOR SEARCHING");
	printf("\n\tenter 3: FOR DELETION");
	printf("\n\tenter 4: FOR ADDRESS SEARCH");
	printf("\n\tenter 5: FOR EXIT");
	printf("\n\tenter 6: FOR EDITING\n");
	scanf("%d",&k);
	scanf("%c",&cushion);
	while(k<1 || k>6)
	{
		printf("\n PLZ ENTER THE CORRECT CHOICE \n ");
		continue;
	}
	system("clear");
	switch(k)
	{
	case 1:	
	{
		printf("\nDo U really Want to Enter:(0/1):");
		scanf("%d",&k);
		scanf("%c",&cushion);
		if(k==1)
		{	printf("Enter The Tel No:");
			scanf("%s",client.telno);
			scanf("%c",&cushion);
				i=0;
				while(i<strlen(client.telno))
				{
					if(isdigit(client.telno[i])==0 || strlen(client.telno)!=8)
					{
					printf("Plz Enter The Tel no. again:");
					scanf("%[^\n]s",client.telno);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
				}
			printf("Enter The Name of The subscriber:(Dont Exceed 100 chars):");
			scanf("%[^\n]s",client.nam);
			scanf("%c",&cushion);
			i=0;
				while(i<strlen(client.nam))
				{
					//if(isdigit(name[i])!=0 || strlen(name)>100 || ispunct(name[i])!=0)
					if(isprint(client.nam[i])==0 || strlen(client.nam)>100 || isdigit(client.nam[i])!=0)
					{
					printf("Plz Enter The Name of Subscriber again:");
					scanf("%[^\n]s",client.nam);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
				}
			
			printf("Enter The Address of The subscriber:(Dont Exceed 200 chars):");
			scanf("%[^\n]s",client.address);
			scanf("%c",&cushion);
			i=0;
				while(i<strlen(client.address))
				{
					//if(isdigit(name[i])!=0 || strlen(name)>100 || ispunct(name[i])!=0)
					if(isprint(client.address[i])==0 || strlen(client.address)>200)
					{
					printf("Plz Enter The Address of Subscriber again:");
					scanf("%[^\n]s",client.address);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
				}
			create_folder(client,0,0);
			break;
		}
		else if(k==0)
		break;
	}
	case 2:
	{
		printf("\nDo U Wanna Search:\n\t0:For Search with Numbers:\n\t1:For Search with Names  :\n\t2:For Arbitrary Listing of TEL nos:\n\t3:To Exit Searching:");
		scanf("%d",&j);
		//scanf("%c",&cushion);
		while(j!=0 && j!=1 && j!=2 && j!=3)
		{
			printf("Plz Enter The Correct Option:");
			scanf("%d",&j);
		}
		if(j==0)
		{
			scanf("%c",&cushion);
			printf("Enter The Tel No:");
			scanf("%s",num);
			scanf("%c",&cushion);
				i=0;
				while(i<strlen(num))
				{
					if(isdigit(num[i])==0 || strlen(num)!=8)
					{
					printf("Plz Enter The Tel no. again:");
					scanf("%[^\n]s",num);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
				}
			search_tel(num);
		}
		else if(j==1)
		{
			scanf("%c",&cushion);
			printf("Enter The Name of The subscriber:");
			scanf("%[^\n]s",name);
			scanf("%c",&cushion);
				i=0;
				while(i<strlen(name))
				{
					//if(isdigit(name[i])!=0 || strlen(name)>100 || ispunct(name[i])!=0)
					if(isprint(name[i])==0 || strlen(name)>100 || isdigit(name[i])!=0)
					{
					printf("Plz Enter The Name of Subscriber again:");
					scanf("%[^\n]s",name);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
				}
			search_name(name);
		}
		else if(j==2)
		{
			scanf("%c",&cushion);
			printf("Enter The Tel No:");
			scanf("%[^\n]s",num);
			scanf("%c",&cushion);
				i=0;
				while(i<strlen(num))
				{
					if(isdigit(num[i])==0 || strlen(num)>8)
					{
					printf("Plz Enter The Tel no. again:");
					scanf("%[^\n]s",num);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
				}
			search_tel(num);
		}
		else if(j==3)
			break;
		break;
	}
	case 3:
	{
		printf("\nDo U wanna delete some::\n\t0:Exit,\n\t1:Deletion of Number:\n\t2:Deletion of Name:");
		scanf("%d",&j);
		scanf("%c",&cushion);
		if(j==1)
		{
			printf("Enter The Tel no to be deleted:");
			scanf("%s",num);
			scanf("%c",&cushion);
			
				i=0;
				while(i<strlen(num))
				{
					if(isdigit(num[i])==0 || strlen(num)!=8)
					{
					printf("Plz Enter The Tel no. again:");
					scanf("%[^\n]s",num);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
			    }
			checker=check_existence(num);
			if(checker==0)
			delete_tel(num,0,0,1);
			else
				printf("Number Does Not Exist");
		}
		else if(j==2)
		{
			printf("Enter The Name of the subscriber to be deleted:");
			scanf("%[^\n]s",name);
			scanf("%c",&cushion);
				while(i<strlen(name))
				{
					//if(isdigit(name[i])!=0 || strlen(name)>100 || ispunct(name[i])!=0)
					if(isprint(name[i])==0 || strlen(name)>100 || isdigit(name[i])!=0)
					{
					printf("Plz Enter The Name of Subscriber again:");
					scanf("%[^\n]s",name);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
				}
			checker=check_existence(name);
			if(checker==0)
			delete_name(name,"love",0,0);
			else
				printf("Subscriber Does Not Exist");
		}
		else if(j==0)
		break;
	break;
	}
	case 4:
	{	
		printf("\n Enter the address u need to find:");
		scanf("%[^\n]s",addr);
			scanf("%c",&cushion);
			i=0;
				while(i<strlen(addr))
				{
					//if(isdigit(name[i])!=0 || strlen(name)>100 || ispunct(name[i])!=0)
					if(isprint(addr[i])==0 || strlen(addr)>200)
					{
					printf("Plz Enter The Address of Subscriber again:");
					scanf("%[^\n]s",addr);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
				}
		search_address(addr);
		break;
	}
	case 5:
	exit(1);
	case 6:
		rewrite();
	}
}
}
void create_folder(info sub,int ref,int notifier)
{
	int i,j,p=0,opt,calc=0;
	FILE *fp,*fp1;
	DIR *dp;
	char str1[200]="mkdir Directory1",ch[3],entry[5]=".txt",str2[150]="Directory1",filename[9],copy1[150],copy2[150],copy3[150],copy4[150],check_presence[11]="/check.txt",status[150],letter;
	char c1[35]="The Telephone Number:",c2[150]="The Name Of Subscriber:",c3[150]="The Address of Subscriber:";
	for(i=0;i<strlen(sub.telno);i++)
	{
		if(i==0)
		{
		strcpy(copy3,str1);
		strcpy(copy4,str2);
		if((dp=opendir(str2))==NULL)
		system(str1);
		else
		closedir(dp);
		}
		ch[0]='/';
		ch[1]=sub.telno[i];
		ch[2]='\0';
		filename[i]=sub.telno[i];
		strcat(copy4,ch);
		strcat(copy3,ch);
		if((dp=opendir(copy4))==NULL)
		system(copy3);
	}
		filename[8]='\0';
	strcat(copy4,"/");
	strcat(copy4,filename);
	strcat(copy4,entry);
	//printf("%s",str2);
	if((fp=fopen(copy4,"r"))!=NULL && ref==0)
	{
		calc=1;
		printf("\nAlready Some Entry want to edit(0/1):");
		scanf("%d",&opt);
		if(opt==0)
			return;
		else
			rewrite();
			return;
	}
	else
	{
		if(fp)
			fclose(fp);
		fp=fopen(copy4,"w");
		strcat(c1,sub.telno);
		strcat(c2,sub.nam);
		strcat(c3,sub.address);
		fprintf(fp,"%s\n%s\n%s\n",c2,c1,c3);
		fclose(fp);
		if(notifier==0)
		{
			fp1=fopen("Directory1/addresslist.txt","a+");
			fprintf(fp1,"%s#%s\n",sub.address,sub.telno);
			fclose(fp1);
		}
	}
	if(calc!=1)
{
	for(i=0;i<strlen(sub.nam);i++)
	{
		if(i==0)
		{
		strcpy(copy1,str1);
		strcpy(copy2,str2);
		}
		if(sub.nam[i]!=' ' && sub.nam[i]!='\t')
		{
			ch[0]='/';
			ch[1]=tolower(sub.nam[i]);
			ch[2]='\0';
			strcat(copy2,ch);
			strcat(copy1,ch);
			if((dp=opendir(copy2))==NULL)
			system(copy1);
		}
	}
	strcpy(status,copy2);
	strcat(status,check_presence);
	strcat(copy2,"/");
	strcat(copy2,filename);
	strcat(copy2,entry);

		fp=fopen(copy2,"w");
		fprintf(fp,"%s\n%s\n%s\n",c2,c1,c3);
		fclose(fp);
	if((fp=fopen(status,"a"))!=NULL)
	{
		fprintf(fp,"%s\n",filename);
		fclose(fp);
	}
	else
	{	
		fp=fopen(status,"w");
		fprintf(fp,"%s\n",filename);
		fclose(fp);
	}
}
}

void search_tel(char *tel)
{
	int i,j=0;
	FILE *fp;
	DIR *dp;
	char str1[200]="cd ",str2[100]="Directory1",filename[10],ch[3],letter,ext[5]=".txt",past[150],test[100];
	for(i=0;i<strlen(tel);i++)
	{
		if(i==0)
		filename[i]='/';
		ch[0]='/';
		ch[1]=tel[i];
		ch[2]='\0';
		filename[i+1]=tel[i];
		strcpy(past,str2);
		strcat(str2,ch);
		if((dp=opendir(str2))==NULL)
			{
				if(strcmp(past,"Directory1")!=0)
				part_show(past,0);
				else
				printf("\nNo Such Tel No. exists..");
				//printf("No Such Match Found\n");
				j=1;
				break;
			}
		else if(i==strlen(tel)-1 && j==0)
		{
			strcpy(test,str2);
			strcpy(past,test);
			filename[9]='\0';
			strcat(test,filename);
			strcat(test,ext);
			if((fp=fopen(test,"r"))==NULL)
			{
				part_show(past,0);
				j=1;
			}
		}
	}
	if(j==0)
	{
		//strcat(str2,filename);
		//strcat(str2,ext);
		//printf("%s\n",str2);
		fp=fopen(test,"r");
		if(fp==NULL)
		{
			printf("Number Does Not Exist\n");
			exit(1);
		}
		system("clear");
		while((letter=getc(fp))!=EOF)
		printf("%c",letter);
		fclose(fp);
		printf("\n");
	}
}

void search_name(char *man)
{
	int i,j=0;
	FILE *fp;
	DIR *dp;
	char str1[150]="cd ",str2[100]="Directory1",ch[3],letter,filename[10],ext[5]=".txt",check_presence[11]="/check.txt",q[10]=" && ls",tel_number[9],preserve[150],new[150],past[100];
	for(i=0;i<strlen(man);i++)
	{
		if(man[i]!=' ' && man[i]!='\t')
		{
			ch[0]='/';
			ch[1]=tolower(man[i]);
			ch[2]='\0';
			strcpy(past,str2);
			strcat(str2,ch);
			if((dp=opendir(str2))==NULL)
			{	
				if(strcmp(past,"Directory1")!=0)
				part_show(past,1);
				else
				printf("\nNo Such Subscriber Exists..");
				//printf("There Is No Such Subscriber\n");
				j=1;
				break;
			}
			if(i==strlen(man)-1 && j==0)
			{
				strcpy(preserve,str2);
				strcpy(past,preserve);
				strcat(preserve,check_presence);
				if((fp=fopen(preserve,"r"))==NULL)
				{
					part_show(past,1);
					j=1;
				}
			}
		}
	}
	if(j==0)
	{
		if(fp)
		{
			printf("The Telephone Numbers of the Subscribers with this name:\n");
			while((letter=getc(fp))!=EOF)
			printf("%c",letter);
			printf("\n");
			fclose(fp);
			//strcat(str1,q);
			//printf("%s\n",str1);
			//system(str1);
			while(1)
			{
				printf("Do U Want to see the details of the following numbers:(0/1)");
				scanf("%d",&i);
				if(i==1)
				{
					printf("Enter the specific desired number:(Just Enter 8 digits):");
					scanf("%s",tel_number);
					strcpy(new,str2);
					strcat(new,"/");
					strcat(new,tel_number);
					strcat(new,ext);
					//printf("\n%s",preserve);
					fp=fopen(new,"r");
					if(!fp)
					printf("Wrong Number input");
					else
					{
						system("clear");
						while((letter=getc(fp))!=EOF)
						printf("%c",letter);
						printf("\n");
					}
				}
			else
			break;
			}
		}
		else
		printf("No Such Subscriber Exists");
	}
}
void delete_tel(char *phone,int flag,int ask,int addr_refresh)
{
char ptr[3],str1[]="cd ",str2[]="Directory1",str3[100],str9[100]="rm -r ",buf[2],temp[100];
char *phone1,string[5],file_seek[150],hash[10]="#";
static char name_pull[50];
FILE *fp;
int i,j,c;//val;
	if(addr_refresh==1)
	{
	strcat(hash,phone);
	printf("\n%s",hash);
	del_addr(hash);
	}
	strcpy(str3,str1);
	strcpy(temp,str2);
	strcpy(file_seek,str2);
	strcat(str3,str2);
	strcat(str9,str2);
	//printf("\n%s",phone);
	for(i=0;i<strlen(phone)-1;i++)
	{
		ptr[0]='/';
		ptr[1]=phone[i];
		ptr[2]='\0';
		strcat(str3,ptr);
		strcat(temp,ptr);
		strcat(file_seek,ptr);
		strcat(str9,ptr);
	}
	ptr[0]='/';ptr[1]=phone[strlen(phone)-1];ptr[2]='\0';
	strcat(str9,ptr);strcat(file_seek,ptr);
	printf("\n%s",str9);
	printf("\n%s",file_seek);
	strcat(str3," && ls -1B|wc -l > /temp.txt");
	printf("\n%s",str3);
	system(str3);
	//printf("\nEnter the value u have seen:");
	//scanf("%d",&val);
	//printf("%d",val);
	fp=fopen("/temp.txt","r");
	i=0;
	while(fgets(buf,2,fp)!=NULL)
	{
		if(i==0)
		strcpy(string,buf);
		else
		strcat(string,buf);
		i++;
	}
	fclose(fp);
	printf("\n%s",string);
	if((strcmp(string,"1\n")!=0) || (strcmp(temp,"Directory1")==0))
		system(str9);
	else
	{
		if(flag==0 && ask==0)
		{
		strcat(file_seek,"/");
		strcat(file_seek,phone);
		strcat(file_seek,".txt");
		printf("\n%s",file_seek);
		printf("\n%d",flag);
		fp=fopen(file_seek,"r");
		fseek(fp,23,SEEK_SET);
		j=0;
		while((c=fgetc(fp))!='\n')
		{
			name_pull[j]=c;
			j++;
		}
		name_pull[j]='\0';fclose(fp);
		printf("%s",name_pull);
		delete_name(name_pull,"love",0,1);
		}
		i=strlen(phone)-1;
		if(i>0)
		{
			phone1=(char *)malloc((i+1)*sizeof(char));
			strncpy(phone1,phone,i);
			//printf("\n%s",phone1);
			delete_tel(phone1,1,ask,0);
		}
	}
}

void delete_name(char *person,char *prev,int flag,int respond)
{
	FILE *fp1,*fp2;
	int c,i,j,z;
	static char ch3[10];
	//static int flag=0;
	char ptr[3],str1[]="cd ",str2[150]="Directory1",str3[150],str4[100]="rm ",str9[150]="rm -r ",folder_check[150],files_check[150],temp[100],number_draw[9],buf[2],ch1[10],ch2[10],cushion;
	char person1[50];
	strcpy(str3,str1);
	strcat(str3,str2);
	//strcat(str9,str2);
	for(i=0;i<strlen(person);i++)
	{
		if(person[i]!=' ')
		{
			ptr[0]='/';
			ptr[1]=person[i];
			ptr[2]='\0';
			strcat(str2,ptr);
			strcat(str3,ptr);
			//strcat(str9,ptr);
		}
	}
	printf("\n%s",str2);
	printf("\n%s",str3);
	//printf("\n%s",str9);
	strcpy(folder_check,str3);
	strcpy(files_check,str3);
	strcat(folder_check," && ls -1pB|grep /|wc -l > /folcount.txt");
	strcat(files_check," && ls -1B|grep .txt|wc -l > /filcount.txt");
	//printf("\n%s",files_check);
	//printf("\n%s",folder_check);
	system(files_check);
	system(folder_check);
	fp1=fopen("/folcount.txt","r");
	fp2=fopen("/filcount.txt","r");
	i=0;
	while((c=fgetc(fp1))!=EOF)
	{
		ch1[i]=c;i++;
	}
	ch1[i]='\0';
	i=0;
	while((c=fgetc(fp2))!=EOF)
	{
		ch2[i]=c;i++;
	}
	ch2[i]='\0';
	fclose(fp1);fclose(fp2);
	system("rm /filcount.txt");system("rm /folcount.txt");
	printf("\n%s%s",ch1,ch2);
	if((strcmp(ch1,"0\n")!=0) && (strcmp(ch2,"2\n")==0))
	{
		if(flag==0)
        	{
		strcpy(temp,str2);
		strcat(temp,"/check.txt");
		fp1=fopen(temp,"r");
		printf("\n%s",temp);
		i=0;
		while((c=fgetc(fp1))!='\n')
		{
			ch2[i]=c;i++;
		}
		ch2[i]='\0';printf("\n%s",ch2);
		strcpy(temp,str3);
		strcat(temp," && rm *.txt");
		printf("\n%s",temp);
		system(temp);
		if(respond==0)
		delete_tel(ch2,0,1,1);
		}
		else
		{
			strcat(str9,prev);
			printf("\n%s",str9);
			system(str9);
		}
	}
	else if((strcmp(ch1,"0\n")!=0) && (strcmp(ch2,"2\n")!=0))
	{
		if(flag==0)
		{
			if(strcmp(ch2,"0\n")==0)
				printf("\nNo Such Subscriber Exists");
			else
			{
				strcpy(temp,str2);
				strcat(temp,"/check.txt");
				fp1=fopen(temp,"r");
				printf("\nHere's a list of all numbers for this User:\n");
				while((c=fgetc(fp1))!=EOF)
					putchar(c);
				fclose(fp1);

					printf("\nChoose The Tel Number to delete:");
					scanf("%s",number_draw);
					//printf("%s",number_draw);
				scanf("%c",&cushion);
				i=0;
				while(i<strlen(number_draw))
				{
					if(isdigit(number_draw[i])==0 || strlen(number_draw)!=8)
					{
					printf("Plz Enter The Tel no. again:");
					scanf("%[^\n]s",number_draw);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
				}
                  		//z=checkinput(temp,number_draw);
				z=diffcheck_input(temp,number_draw);
                  		if(z==1)
                  		{
                  			//delete_tel(number_draw);
					strcpy(temp,str2);
					strcat(temp,"/");
					strcat(temp,number_draw);
					strcat(temp,".txt");
					strcat(str4,temp);
					printf("%s",str4);
					system(str4);
					strcpy(temp,str3);strcat(temp," && ls -1B|grep .txt|grep -v check.txt|tr -d .txt > check.txt");
					printf("%s",temp);
					system(temp);
					if(respond==0)
				   		delete_tel(number_draw,0,1,1);
				}
				else
					printf("\n YOUR ENTRY IS WRONG ");
			}
		}				
		else if(flag==1)
		{
			if(strcmp(ch1,"1\n")==0)
			{
				if(strcmp(ch2,"0\n")==0)
				{
					printf("\n%s",person);
    					i=strlen(person);
    					if(i>0)
    					{
   						//person1=(char *)malloc(i*sizeof(char));
						for(j=0;j<(i-1);j++)
							person1[j]=person[j];
						person1[i-1]='\0';
    						//strncpy(person1,person,(i-1));
						printf("\n%s",person1);
    						delete_name(person1,str2,1,respond);
    					}
				}
				else
				{
					strcat(str9,prev);
					printf("\n%s",str9);
					system(str9);
				}
			}
			else
			{
				printf("\n%s",prev);
				strcat(str9,prev);
				printf("\n%s",str9);
				system(str9);
			}
		}
	}
	else if((strcmp(ch1,"0\n")==0) && (strcmp(ch2,"2\n")!=0))
	{
		if(flag==0)
		{
			if(strcmp(ch2,"0\n")!=0)
			{
				strcpy(temp,str2);
				strcat(temp,"/check.txt");
				fp1=fopen(temp,"r");
				printf("\nHere's a list of all numbers for this User:\n");
				while((c=fgetc(fp1))!=EOF)
					putchar(c);
				fclose(fp1);

				printf("\nChoose The Tel Number to delete:");
    				scanf("%s",number_draw);
				printf("%s",number_draw);
				//scanf("%c",&cushion);
				i=0;
				while(i<strlen(number_draw))
				{
					if(isdigit(number_draw[i])==0 || strlen(number_draw)!=8)
					{
					printf("Plz Enter The Tel no. again:");
					scanf("%[^\n]s",number_draw);
					scanf("%c",&cushion);
					i=0;
					}
					else
					i++;
				}
   				//delete_tel(number_draw);
   				//z=checkinput(temp,number_draw);
				z=diffcheck_input(temp,number_draw);
                     	if(z==1)
                     	{
                 		strcpy(temp,str2);
    				strcat(temp,"/");
				strcat(temp,number_draw);
    				strcat(temp,".txt");
   				strcat(str4,temp);
   				system(str4);
    				strcpy(temp,str3);
    				strcat(temp," && ls -1B|grep .txt|grep -v check.txt|tr -d .txt > check.txt");
    				printf("%s",temp);
    				system(temp);
				if(respond==0)
				delete_tel(number_draw,0,1,1);
			}
			else
				printf("\n THERE IS NO SUCH ENTRY ");
			}
			else
				printf("No Such Subscriber Exists");
    		}	
	}
    	else if((strcmp(ch1,"0\n")==0) && (strcmp(ch2,"2\n")==0))
    	{
		strcpy(temp,str2);
		strcat(temp,"/check.txt");
		fp1=fopen(temp,"r");
		i=0;
		while((c=fgetc(fp1))!='\n')
		{
			ch3[i]=c;i++;
		}
		ch3[i]='\0';printf("\n%s",ch3);
		//delete_tel(ch3);
		printf("\n%s",person);
    		i=strlen(person);
		printf("\n%d",i);
    		if(i>0)
    		{
   			//person1=(char *)malloc(i*sizeof(char));
			for(j=0;j<(i-1);j++)
				person1[j]=person[j];
			person1[i-1]='\0';
    			//strncpy(person1,person,(i-1));
			printf("\n%s",person1);
    			delete_name(person1,str2,1,respond);
    		}
		if(respond==0)
		delete_tel(ch3,0,1,1);
    	}
}

void part_show(char *input,int token)
{
FILE *fp1;FILE *fp2;
int c,count=0,i;
long *pos,length,temp;
char **strset;
char seek[200]="find ",cushion,name[101],tel[9];
	//printf("%s\n",input);
	strcat(seek,input);
	strcat(seek," -name \"*????????.txt\" > /list.txt");
	//printf("%s",seek);
	system(seek);
	fp1=fopen("/list.txt","r");
	pos=(long *)malloc(sizeof(long));
	pos[0]=0;
	while((c=fgetc(fp1))!=EOF)
	{	if(c=='\n')
		{	count++;
			pos=(long *)realloc(pos,(count+1)*sizeof(long));
			pos[count]=ftell(fp1);
		}
	}
	fclose(fp1);
	//printf("\nThe Number of Lines=%d\n",count);
	strset=(char **)malloc(count*sizeof(char *));	
	for(i=0;i<count;i++)
	{
		fp1=fopen("/list.txt","r");
		//printf(":position(%d) = %ld ",i,pos[i]);
		length=pos[i+1]-pos[i];
		//printf("\n%ld",length);
		strset[i]=(char *)malloc(length*sizeof(char));
		fseek(fp1,pos[i],SEEK_SET);
		fgets(strset[i],(length),fp1);
		fclose(fp1);
		//printf("\n%s",strset[i]);
		fp1=fopen(strset[i],"r");
	if(token==0)
	{
		while((c=fgetc(fp1))!=EOF)
		{
			if(c=='\n')
			{
				temp=ftell(fp1);
				break;
			}			//required for tel no..coz name has been taken to the first line
		}
		fseek(fp1,21,SEEK_CUR);
	}
		else if(token==1)
		fseek(fp1,23,SEEK_SET);
		fp2=fopen("/display.txt","a");
	while((c=fgetc(fp1))!='\n')
		fputc(c,fp2);
		fputc('\n',fp2);
		fclose(fp1);fclose(fp2);
	}
	system("rm /list.txt");
	system("clear");
	printf("\nExact Match Not Found...\nThe Closest Available Entries Are:\n");
	fp1=fopen("/display.txt","r");
	while((c=fgetc(fp1))!=EOF)
	putchar(c);
	fclose(fp1);
	while(1)
	{
		printf("Do U Wanna Check Some Entries 4m above:(0/1)");
		scanf("%d",&temp);
		if(temp!=0 && temp!=1)
		{
			printf("\nU have enterred a wrong option Plz Enter again:");
			continue;
		}
		scanf("%c",&cushion);
		if(temp==1)
		{
			printf("Plz enter the entry:");
			if(token==1)
			{
				scanf("%[^\n]s",name);
				scanf("%c",&cushion);
				search_name(name);
			}
			else if(token==0)
			{
				scanf("%[^\n]s",tel);
				scanf("%c",&cushion);
				search_tel(tel);
			}
		}
		else if(temp==0)
		{
			system("rm /display.txt");
			break;
		}
	}
}

int diffcheck_input(char *str1,char *name)
{
FILE *fp;
char ch[20];
int c,i,flag=0,shut=0;
	fp=fopen(str1,"r");
	i=0;
	while((c=fgetc(fp))!=EOF)
	{
		ch[i]=c;flag=0;
		if(c=='\n')	
		{
			ch[i]='\0';i=-1;flag=1;
		}
		i++;
		if(flag==1)
		{
			if(strcmp(name,ch)==0)
			{
				fclose(fp);shut=1;return 1;
			}
		}
	}
	if(shut==0)
	{fclose(fp);
	return 0;}	
}

int check_existence(char *supply)
{
DIR *dp;
int i,flag=0;
char str1[]="Directory1",temp[100],ptr[3];	
	strcpy(temp,str1);
	for(i=0;i<strlen(supply);i++)
	{
		ptr[0]='/';ptr[1]=supply[i];ptr[2]='\0';
		strcat(temp,ptr);
		if((dp=opendir(temp))==NULL)
		{
			flag=1;break;
		}
	}
	if(flag==1)
		return 1;
	else
		return 0;
}

int string_match(char *line,char *input)
{
int i,k,m,n,flag=0,count=0;
	
	//printf("\n%s",line);
	//printf("\n%s",input);

	for(i=0;i<strlen(line);i++)
	{
		if(line[i]==input[0])
		{
			k=i;m=1,n=k+1;
			while(m<strlen(input) && n<k+strlen(input))
			{
				if(line[n]==input[m])
				{
					m++;n++;flag=1;
				}
				else
				{flag=0;break;}
			}
			if(flag==1)
				count++;//return 1;
		}
	}
	if(count==0)//if(flag==0)
		return 0;
	else
	{
		//printf("\n%d",count);
		return 1;
	}
}

void search_address(char *sent)
{
FILE *fp;
int z,m=0,l,flag=0,j,c,temp;
long int i;
char line_read[220],**match_address,ch,call[9],cushion;
	fp=fopen("Directory1/addresslist.txt","r");
	i=0;
	while((c=fgetc(fp))!=EOF)
	{
		line_read[i]=c;
		if(c=='\n')
		{
			line_read[i]='\0';
			i=-1;
			z=string_match(line_read,sent);
			if(z==1)
			{
				l=strlen(line_read);
				flag=1;
				if(m==0)
				{
					match_address=(char **)malloc((m+1)*sizeof(char *));
					match_address[m]=(char *)malloc(l*sizeof(char));
					for(j=0;j<=l;j++)
						match_address[m][j]=line_read[j];
					m++;
				}
				else
				{
					match_address=(char **)realloc(match_address,(m+1)*sizeof(char *));
					match_address[m]=(char *)malloc(l*sizeof(char));
					for(j=0;j<=l;j++)
						match_address[m][j]=line_read[j];
					m++;
				}
			}
		}
		i++;
	}
	if(flag==0)
		printf("\nNo match Found");
	else
	{
	printf("\nThe addresses are:");
	for(i=0;i<m;i++)
		printf("\n\n\t%d: %s",i,match_address[i]);
	fclose(fp);
	while(1)
	{
		printf("\n\tEnter any from the above:(just the index)\n\tTo quit press(n):");
		if((ch=getchar())!='n' && ((j=(int)ch)<48 || j>=48+m))
		{
			printf("\nWrong Option %d",j);
			scanf("%c",&cushion);
			continue;
		}
		else if(ch=='n')
			return;
		scanf("%c",&cushion);
		temp=((int)ch -48);
		j=0;
		for(i=strlen(match_address[temp])-8;i<strlen(match_address[temp]);i++)
		{
			call[j]=match_address[temp][i];
			j++;
		}
		call[j]='\0';
		//printf("%s",call);
		search_tel(call);
	}
	}
}
void del_addr(char *remove)
{
	FILE *fp1,*fp2;
	long int i;
	int z;
	char line_read[220],ch;
	fp1=fopen("Directory1/addresslist.txt","r");
	fp2=fopen("Directory1/temp.txt","w");
	i=0;
	while((ch=fgetc(fp1))!=EOF)
	{
		line_read[i]=ch;
		if(ch=='\n')
		{
			line_read[i]='\0';
			i=-1;
			z=string_match(line_read,remove);
			if(z==0)
			{
				printf("\n%s",line_read);
				fprintf(fp2,"%s\n",line_read);
			}
		}i++;
	}
	fclose(fp1);fclose(fp2);
	system("mv Directory1/temp.txt Directory1/addresslist.txt");
}
void rewrite()
{
	FILE *fp;
	DIR *dp;
	info user;
	int i,j,k,flag=0,x;
	char cushion,tel[9], name[100], addr[200], ptr[3], entry[5]=".txt", str1[150]="Directory1", copy1[150], copy2[150], check_presence[11]="/check.txt", status[150], letter, temp[10]="#";


	printf("\nAccessing Previous Entries:(1/2/3)\n\t1. By Subscriber:\n\t2. By telephone no:\n\t3. Exit:");
	scanf("%d",&k);
	while(1)
	{
		if(k>0&&k<4)
			break;
		else
		{
			printf("\nEnter the proper option:");scanf("%d",&k);continue;
		}
	}
	if(k==1)
	{
		printf("Enter The Subscriber:");
		scanf("%s",user.nam);
		scanf("%c",&cushion);
		i=0;
		while(i<strlen(user.nam))
		{
			//if(isdigit(name[i])!=0 || strlen(name)>100 || ispunct(name[i])!=0)
			if(isprint(user.nam[i])==0 || strlen(user.nam)>100 || isdigit(user.nam[i])!=0)
			{
				printf("Plz Enter The Name of Subscriber again:");
				scanf("%[^\n]s",user.nam);
				scanf("%c",&cushion);
				i=0;
			}
				else
				i++;
		}
		strcpy(copy1,str1);
		for(i=0;i<strlen(user.nam);i++)
		{
			if(user.nam[i]!=' ' && user.nam[i]!='\t')
			{
				ptr[0]='/';ptr[1]=tolower(user.nam[i]);ptr[2]='\0';
				strcat(copy1,ptr);
				if((dp=opendir(copy1))==NULL)
				{
					flag=1;break;
				}
				closedir(dp);
			}
		}
		if(flag==1)
		{
			printf("\nThers's no such previous Entry");return;
		}
		else
		{
			strcat(copy1,"/");
			strcpy(copy2,copy1);
			strcat(copy2,check_presence);
			if(fp=fopen(copy2,"r"))
			{
				system("clear");
				printf("\nThe tel nos of this subscriber:\n");
				while((letter=fgetc(fp))!=EOF)
					printf("%c",letter);
				fclose(fp);
				printf("\n Enter the number u wanna edit:");
				scanf("%[^\n]s",tel);
				while(1)
				{
				x=diffcheck_input(copy2,tel);
				if(x==1)
					break;
				else
				{
					printf("\nWrong input,Enter again from the list:");
					scanf("%[^\n]s",tel);
					continue;
				}
				}
			strcat(copy1,tel);
			strcat(copy1,entry);
			}
		}
	}
	else if(k==2)
	{
		printf("Enter The Phone Number:");
		scanf("%s",user.telno);
		scanf("%c",&cushion);
		i=0;
			while(i<strlen(user.telno))
			{
				if(isdigit(user.telno[i])==0 || strlen(user.telno)!=8)
				{
				printf("Plz Enter The Tel no. again:");
				scanf("%[^\n]s",user.telno);
				scanf("%c",&cushion);
				i=0;
				}
				else
				i++;
			}
		strcpy(copy1,str1);
		for(i=0;i<strlen(user.telno);i++)
		{
			ptr[0]='/';ptr[1]=user.telno[i];ptr[2]='\0';
			strcat(copy1,ptr);
			if((dp=opendir(copy1))==NULL)
			{
				flag=1;break;
			}
			closedir(dp);
		}
		if(flag==1)
		{
			printf("\nThers's no such previous Entry");return;
		}
		else
		{
			strcat(copy1,"/");
			strcat(copy1,user.telno);
			strcat(copy1,entry);
		}
	}
	else if(k==3)
		return;
		if(fp=fopen(copy1,"r"))
		{
				printf("\n\t1. To Check:\n\t2. To change Subscriber name:\n\t3. To change address:\n\t4. To change tel:\n\t5. To exit:");
				scanf("%d",&k);
				scanf("%c",&cushion);
				while(1)
				{
					if(k>0&&k<6)
					break;
					else
					{
						printf("\nEnter the proper option:");scanf("%d",&k);scanf("%c",&cushion);continue;
					}
				}
				if(k==1)
				{
					system("clear");
					while((letter=fgetc(fp))!=EOF)
							printf("%c",letter);
				}
				else if(k==2)
				{
					fseek(fp,23,SEEK_SET);
					i=0;
					while((letter=fgetc(fp))!='\n')
					{	
						name[i]=letter;i++;
					}name[i]='\0';
					while((letter=fgetc(fp))!=EOF)
					{
						if(letter=='\n')
						{
							fseek(fp,26,SEEK_CUR);break;
						}
					}
					fscanf(fp,"%[^\n]s",user.address);
					fclose(fp);
					printf("\n%s",name);
					printf("\n%s",user.address);
					printf("\nEnter the new Subscriber name:");
					scanf("%[^\n]s",user.nam);
					scanf("%c",&cushion);
					i=0;
					while(i<strlen(user.nam))
					{
						//if(isdigit(name[i])!=0 || strlen(name)>100 || ispunct(name[i])!=0)
						if(isprint(user.nam[i])==0 || strlen(user.nam)>100 || isdigit(user.nam[i])!=0)
						{
						printf("Plz Enter The Name of Subscriber again:");
						scanf("%[^\n]s",user.nam);
						scanf("%c",&cushion);
						i=0;
						}
						else
						i++;
					}
					delete_name(name,"love",0,0);
					create_folder(user,1,0);
				}
				else if(k==3)
				{
					fseek(fp,23,SEEK_SET);
					i=0;
					while((letter=fgetc(fp))!='\n')
					{	
						user.nam[i]=letter;i++;
					}user.nam[i]='\0';
					fseek(fp,21,SEEK_CUR);
					fscanf(fp,"%[^\n]s",user.telno);
					strcat(temp,user.telno);
					fseek(fp,27,SEEK_CUR);
					fscanf(fp,"%[^\n]s",addr);
					fclose(fp);
					printf("\n%s",user.nam);
					printf("\n%s",user.telno);
					printf("\n%s",addr);
					printf("\nEnter the new address:");
					scanf("%[^\n]s",user.address);
					scanf("%c",&cushion);
					i=0;
					while(i<strlen(user.address))
					{
					//if(isdigit(name[i])!=0 || strlen(name)>100 || ispunct(name[i])!=0)
					if(isprint(user.address[i])==0 || strlen(user.address)>200)
					{
						printf("Plz Enter the Address again:");
						scanf("%[^\n]s",user.address);
						scanf("%c",&cushion);
						i=0;
					}
					else
					i++;
					}
					//del_addr(temp);
					delete_tel(user.telno,0,0,1);
					create_folder(user,1,0);
				}
				else if(k==4)
				{
					fseek(fp,23,SEEK_SET);
					i=0;
					while((letter=fgetc(fp))!='\n')
					{	
						user.nam[i]=letter;i++;
					}user.nam[i]='\0';
					fseek(fp,21,SEEK_CUR);
					fscanf(fp,"%[^\n]s",tel);
					strcat(temp,tel);
					fseek(fp,27,SEEK_CUR);
					fscanf(fp,"%[^\n]s",user.address);
					fclose(fp);
					printf("\n%s",user.nam);
					printf("\n%s",tel);
					printf("\n%s",user.address);
					printf("\nEnter The new Tel No:");
					scanf("%s",user.telno);
					scanf("%c",&cushion);
					i=0;
					while(i<strlen(user.telno))
					{
						if(isdigit(user.telno[i])==0 || strlen(user.telno)!=8)
						{
							printf("Plz Enter The Tel no. again:");
							scanf("%[^\n]s",user.telno);
							scanf("%c",&cushion);
							i=0;
						}
						else
						i++;
					}
					delete_tel(tel,0,0,1);
					create_folder(user,1,0);
				}
				else if(k==5)
				{
					fclose(fp);return;
				}
				return;
		}
		else
			printf("\nHihiiii U r fooled...No Entry");
}

void stress_input()
{
	FILE *fp;
	info people;
	int i,j=0;
	char ch;
	fp=fopen("data.txt","r");
	if(fp)
	{
	while((ch=fgetc(fp))!=EOF)
	{	
		if(ch=='\n')
		j++;
	}
	rewind(fp);
	}
	printf("\n%d",j);
	for(i=1;i<j;i++)
	{
		fscanf(fp,"%[^#]s %[^#]s#%[^\n]s",people.nam,people.telno,people.address);
		//printf("\n%s\n%s\n%s",people.nam,people.telno,people.address);
		fseek(fp,1,SEEK_CUR);
		create_folder(people,1,0);
	}
}
