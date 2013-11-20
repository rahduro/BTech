#include <stdio.h>
#include <conio.h>
#include <stdlib.h>
#include<string.h>
#include <malloc.h>
#include <time.h>

typedef struct week WEEK;
typedef struct day DAY;
typedef struct period PERIOD;
typedef struct stream STREAM; //stream consideration
typedef struct node NODE;
typedef struct teacher TEACHER;
typedef struct syllabus SYLLABUS;
typedef struct class1 CLASS;
typedef struct nw NEW; //stream consideration
typedef struct subject SUB;
typedef struct link LINK;
typedef struct node1 DISEASED;
typedef struct node2 CLAS;
typedef struct node3 STRM; //stream
typedef struct prac PRAC;
typedef struct pracsub PRACSUB;
typedef struct week1 WEEK1;
typedef struct day1 DAY1;
typedef struct slot SLOT;
typedef struct year1 YEAR1;
typedef struct stream1 STREAM1;
typedef struct grp GRP;
typedef struct diseased1 DISEASED1;
typedef struct clas1 CLAS1;
typedef struct strm1 STRM1;



struct week {
	DAY **day;
	int w;
};

struct day {
	int d;
	PERIOD **prd;
	void *upLink;
};

 struct period {
	int p;
	NODE **year;
	DAY *upLink;
};

 struct node {
	 int y;
	 STREAM **stream;			
	 PERIOD *upLink;
 };
struct stream {
	int s;
	int check;
	//int inclu;
	int d;
	char sub[20];				//stream
	char teacher[10];
	NODE *upLink;
	int prac_avbl;
	int prac_prob;
	int no_grup;
	GRP** grup;
};

struct teacher {
	char teach[20];
	int th_weight;
	int pr_weight;
	PRACSUB **p_upLink;
	SUB **t_upLink;
};

TEACHER *prof;

struct syllabus {
	CLASS **clas;
};

struct class1 { 
	NEW **nw;
	SYLLABUS *upLink;
};

struct nw {
	int cl;
	char strm[10];			//stream
	int no_sub;
	SUB **subs;
	int max_sub;
	int total_th_prd;
	PRAC *prac;
	
	int *d_pr_cnt;
	CLASS *upLink;
};

struct subject {
	int *tch;
	char sub[20];
	int s_weight[6];
	int no_teacher;
	int sub_indx;
	int max_w_sub;
	int cr_pt;

	NEW *upLink;
	LINK **lnk;
};

struct link {
	STREAM *sidelink;
	int dy;
};

struct node1 {
    CLAS **clss;
    int degree;
};

struct node2 {
    STRM **stream;
};

struct node3 {
	int no_nd;
	STREAM **tchr;
};

struct prac
{
	NEW *uplink;
	int no_prac;
	int no_grp;
	int **prac_directive;
	int *pdb;
	PRACSUB **pracsub;
};

struct pracsub
{
	int *tch;
	int prc_index;
	char psub[20];
	int *p_weight;
	int no_teacher;
	
	PRAC *upLink;
	//LINK **lnk;
};

struct week1 {
	DAY1 ** day1;
	int w1;
};

struct day1 {
	SLOT **slot;
	WEEK1 *upLink;
	int d1;
};

struct slot {
	int sl;
	int *no_slot;
	YEAR1 **year;
	DAY1 *upLink;
};

struct year1 {
	int y;
	 STREAM1 **stream;			
	 SLOT *upLink;
 };

struct stream1 {
	int s;
	int avbl;
	int no_grp;
	//int inclu;
	int d;
	
	YEAR1 *upLink;
	GRP** group;
};

struct grp{
	
	STREAM1 *upLink;
	int group;
	int no_tch;
	char sub[20];
	char **teacher;
};

struct diseased1 {
    CLAS1 **clss;
    int degree;
};

struct clas1 {
    STRM1 **stream;
};

struct strm1 {
	int no_nd;
	STREAM1 **prac_prob;
};





int no_per, no_year;
int no_prof=0;
int no_strm;
int no_slot;
int cred;
char **strm;
int slotdb[10][10];


WEEK* creat_Tree ();
void creat_day (WEEK*, DAY*, int);
void creat_per (DAY *, PERIOD *, int);
void creat_node (PERIOD *, NODE *, int);
void creat_stream(NODE *, STREAM *, int);
void creat_prac(NEW *,PRAC*,int);
void creat_sub(NEW *,SUB *,char *,int);
void creat_pracsub(PRAC *,PRACSUB *,char *,int);
SYLLABUS* creat_syll ();
void creat_class(SYLLABUS *, CLASS *, int);
void creat_nw (CLASS *, NEW *);
int place_teacher(SUB*,char*);
int place_teacher1 (PRACSUB *,char *);
int prof_check(int *,char *);
void creat_teacher(TEACHER* ,SUB*,char *,int);
void creat_teacher1(TEACHER*,PRACSUB*,char *,int);
void initialize(WEEK*,SYLLABUS*);
void display_ (WEEK *);
void display(SYLLABUS*);
DISEASED **build_check_tree();
void check_teacher(DAY *,DISEASED *);
//void swap_check (DISEASED *);
//void display2(DISEASED * );
int node_check(STREAM *,STRM *);
int check1 (STREAM *,STREAM *, SYLLABUS *);
void change_check(DISEASED *,SYLLABUS *, int);
void change_replace(STREAM*,SYLLABUS*,int, int, int);
void leaf_count(DISEASED* );
void swap (STREAM *, STREAM *);
void sum_add (NEW *);
void overwrite (NEW *,int,int);
void week_check (SYLLABUS * );
void swap_check1 (DISEASED *, WEEK *, SYLLABUS *);
void refresh(WEEK *);
void cred_division (SYLLABUS *);
void show_cred (SYLLABUS *);

void creat_slotdb();
WEEK1* creat_Tree1 (SYLLABUS *);
void creat_day1 (WEEK1 *, DAY1 *, int ,SYLLABUS *) ;
void creat_year1(SLOT *, YEAR1 *, int,SYLLABUS * );
void creat_stream1 (YEAR1 *, STREAM1 *, int ,SYLLABUS *);
void creat_slot (DAY1 *, SLOT *, int ,SYLLABUS *);
void creat_grp (STREAM1 *, GRP *, int, SYLLABUS *);
void intlz_prac(WEEK1 *,SYLLABUS *);
void set_prac(WEEK1 *,SYLLABUS *);
void display3(WEEK1 *);
DISEASED1 **build_check_tree1();
void swap1 (STREAM1 *, STREAM1 *);
int check2(STREAM1 *, STREAM1 *, SYLLABUS *);
int node_check1(STREAM1 *,STRM1 *);
void swap_check2 (DISEASED1 *, WEEK1 *, SYLLABUS *);
void check_teacher1(DAY1 *,DISEASED1 *);
void set_prac_prob(WEEK *);
void prac_impose(WEEK *,WEEK1 *);
void check_teacher3(DAY *,DISEASED *);
void swap_check3 (DISEASED *, WEEK *, SYLLABUS *);
int check_th_pr(STREAM*,STREAM *, SYLLABUS *);
int check_pr_pr(STREAM*,STREAM *);
void swap_xtrm(STREAM *,STREAM *);









void main()
{

	//clrscr();
	int m,count=0,i,j,k;
	printf("Is there credit point system available?(0=NO, 1=YES):");
	scanf("%d",&cred);

	printf("enter the no of years :");
	scanf("%d",&no_year);

	printf("enter the no of periods :");
	scanf("%d",&no_per);

	printf("enter the no of streams:");
	scanf("%d",&no_strm);

	


	strm=(char **)malloc(no_strm*sizeof(char *));

	for (m=0;m<no_strm;m++) {
		fflush(stdin);
		strm[m]=(char *)malloc(10*sizeof(char));		//big problem
		//printf("hhh");
		printf("\ngive the stream %d:",m+1);
		gets(strm[m]);
		fflush(stdin);
	}

	printf("\nenter the no of slots for parctical in a day :");
	scanf("%d",&no_slot);

	creat_slotdb();

	WEEK* root;
	WEEK1* root2;
	DISEASED **root1;
	DISEASED1 **root3;
	
	root=creat_Tree();
	
	SYLLABUS *course;
	course=creat_syll();
	root2=creat_Tree1(course);

	cred_division(course);

	intlz_prac(root2,course);
	printf("klkll");
	display3(root2);

	root3=build_check_tree1();

	for ( k=0;k<6;k++)
			check_teacher1(root2->day1[k],root3[k]);
		//printf("loop no :%d", m+1);

	for (k=0;k<6;k++)
			swap_check2(root3[k], root2, course);

	display3(root2);
	getch();

	for(i=0;i<no_slot;i++)
	{
		for(j=0;j<10&&slotdb[i][j]!=-1;j++)
			printf("%d ",slotdb[i][j]);

		printf("\n");
	}







	
	printf("klkll");

	set_prac_prob(root);
	printf("after set");
	prac_impose(root,root2);
	printf("in the main");
	initialize (root,course);
	root1=build_check_tree();

		refresh(root);
		for ( k=0;k<6;k++)
			check_teacher(root->day[k],root1[k]);
		//printf("loop no :%d", m+1);

		display_(root);
		getch();

		count=0;
		for (k=0;k<6;k++)
			count+=root1[k]->degree;
		printf("\n\nno of leaf :%d\n\n",count);
		
		//display2(root1);
		for (k=0;k<6;k++)
			swap_check1(root1[k], root, course);
	

	for (m=0;m<50;m++) {
	
	/*	root1=build_check_tree();

		refresh(root);
		for (int k=0;k<6;k++)
			check_teacher(root->day[k],root1[k]);
		//printf("loop no :%d", m+1);

		display_(root);
		getch();

		count=0;
		for (k=0;k<6;k++)
			count+=root1[k]->degree;
		printf("\n\nno of leaf :%d\n\n",count);
		
		//display2(root1);
		for (k=0;k<6;k++)
			swap_check1(root1[k], root, course);*/




   
		root1=build_check_tree();

		refresh(root);
		for (k=0;k<6;k++)
			check_teacher3(root->day[k],root1[k]);
		//printf("loop no :%d", m+1);
		display_(root);

		getch();

		count=0;
		for (k=0;k<6;k++)
			count+=root1[k]->degree;
		printf("\n\nno of leaf :%d\n\n",count);

		for (k=0;k<6;k++)
			swap_check3(root1[k], root, course);
		/*root1=build_check_tree();

		refresh(root);
		for(k=0;k<6;k++)
			check_teacher(root->day[k],root1[k]);

		printf("\n\n");
		printf("loop no :%d", m+1);
		display_(root);


		count=0;
		for ( k=0;k<6;k++)
			count+=root1[k]->degree;
		printf("\n\nno of leaf :%d\n\n",count);*/
	/*

		//display2(root1);
		for(k=0;k<6;k++)
			change_check(root1[k],course,k);
		
		root1=build_check_tree();

		refresh(root);
		for(k=0;k<6;k++)
			check_teacher(root->day[k],root1[k]);

		printf("\n\n");
		//printf("loop no :%d", m+1);
		//display_(root);


		count=0;
		for ( k=0;k<6;k++)
			count+=root1[k]->degree;
		printf("\n\nno of leaf :%d\n\n",count);*/
		

		if (count==0)
			break;
	}
	printf("loop no :%d", m+1);
  display_(root);


	
    getch();
}


WEEK* creat_Tree ()
{
	WEEK *week;
	int i;
	DAY **temp;
	week = (WEEK *)malloc(sizeof(WEEK));

	temp=(DAY**)malloc(6*sizeof(DAY*));
	for (i=0;i<6;i++) {
	     temp[i]=(DAY*)malloc(sizeof(DAY));
	     creat_day(week,temp[i],i);
	     }
	week->day=temp;
	return week;
}

void creat_day (WEEK *week, DAY *day, int r) {
	int i;
	PERIOD **temp;
	day->d=r;
	day->upLink=week;


	temp=(PERIOD**)malloc(no_per*sizeof(PERIOD*));
	for (i=0;i<no_per;i++) {
	     temp[i]=(PERIOD*)malloc(sizeof(PERIOD));
	     creat_per(day,temp[i],i);
	     }
	day->prd=temp;
}


void creat_per (DAY *day, PERIOD *per, int s)
{
	int i;
	NODE **temp;
	per->p=s;
	per->upLink=day;


	temp=(NODE**)malloc(no_year*sizeof(NODE*));
	for (i=0;i<no_year;i++) {
	     temp[i]=(NODE*)malloc(sizeof(NODE));
	     creat_node(per,temp[i],i);
	     }
	per->year=temp;
}

void creat_node (PERIOD *per, NODE *node, int m)
{
	int i;
	STREAM **temp;
	node->y=m;
	node->upLink=per;


	temp=(STREAM**)malloc(no_strm*sizeof(STREAM*));
	for (i=0;i<no_strm;i++) {
	     temp[i]=(STREAM*)malloc(sizeof(STREAM));
	     creat_stream(node,temp[i],i);
	     }
	node->stream=temp;
}


void creat_stream (NODE *node, STREAM *stream, int n)
{
	stream->s=n;
	stream->upLink=node;
	stream->check=0;
	stream->grup=NULL;
	stream->prac_avbl=0;
	stream->prac_prob=0;
}

SYLLABUS* creat_syll ()
{
	SYLLABUS *syll;
	int i;
	CLASS **temp;
	syll = (SYLLABUS *)malloc(sizeof(SYLLABUS));

	temp=(CLASS**)malloc(no_year*sizeof(CLASS*));
	for (i=0;i<no_year;i++) {
	     temp[i]=(CLASS*)malloc(sizeof(CLASS));
	     creat_class(syll,temp[i],i);
	     }
	syll->clas=temp;
	return syll;
}

void creat_class (SYLLABUS *syll, CLASS *cls, int s)
{
	int i;
	
	cls->nw=(NEW **)malloc(no_strm*sizeof(NEW *));
	cls->upLink=syll;
	printf("\nYEAR %d:\n",s+1);
	for (i=0;i<no_strm;i++) {
		cls->nw[i]=(NEW *)malloc(sizeof(NEW));
		strcpy(cls->nw[i]->strm,strm[i]);
		creat_nw(cls, cls->nw[i]);
	}
}

void creat_nw (CLASS *cls, NEW *nw)
{
	int c=1,nog;
	char ch;
	char n[20];
	SUB **temp=NULL;
;
	//nw->cl=s;
	nw->upLink=cls;
	
	do{
		temp=(SUB**)realloc(temp,c*sizeof(SUB *));
		temp[c-1]=(SUB*)malloc(sizeof(SUB));
		printf("\nEnter subject %d of stream %s:",c,nw->strm);
		fflush(stdin);
		scanf("%s",n);
		creat_sub(nw,temp[c-1],n,c-1);
		printf("another subject(y/n):");
		fflush(stdin);
		ch=getchar();
		c++;
	}while(ch=='y');

	nw->no_sub=c-1;
	nw->subs=temp;
	nw->d_pr_cnt=(int *)malloc((c-1)*sizeof(int));
	for (int i=0;i<c-1;i++) {
		nw->d_pr_cnt[i]=0;
	}

	nw->prac=(PRAC*)malloc(1*sizeof(PRAC));
	printf("\nPRACTICAL");
	printf("enter the no group :");
	fflush(stdin);
	scanf("%d",&nog);

	creat_prac(nw,nw->prac,nog);
}

void creat_prac(NEW *nw,PRAC* p,int nog)
{
	int c=1,i;
	char n[20],ch;
	PRACSUB **temp=NULL;

	p->uplink=nw;
	p->no_grp=nog;
	do{
		temp=(PRACSUB**)realloc(temp,c*sizeof(PRACSUB *));
		temp[c-1]=(PRACSUB*)malloc(sizeof(SUB));
		printf("\nEnter practical %d of stream %s:",c,nw->strm);
		fflush(stdin);
		scanf("%s",n);
		creat_pracsub(p,temp[c-1],n,c-1);
		printf("another subject(y/n):");
		fflush(stdin);
		ch=getchar();
		c++;
	}while(ch=='y');

	p->no_prac=c-1;
	p->pracsub=temp;
	p->pdb=(int*)malloc((c-1)*sizeof(int));

	for(i=0;i<c-1;i++)
		p->pdb[i]=-1;

	p->prac_directive=(int**)malloc((c-1)*sizeof(int *));
	for(i=0;i<(p->no_grp+1);i++)
	{
		p->prac_directive[i]=(int*)malloc((p->no_grp+1)*sizeof(int));
		p->prac_directive[i][0]=0;
	}
}

void creat_pracsub(PRAC *p,PRACSUB *ps,char *s,int d)
{

	int c=1,i;
	char ch,ta[10];
	ps->prc_index=d;
	strcpy(ps->psub,s);
	ps->upLink=p;
	ps->p_weight=0;

	int *temp=NULL;

	do{
	temp=(int *)realloc(temp,c*sizeof(int));
		printf("\n\tEnter name of teacher %d for practical %s:",c,s);
		fflush(stdin);
		scanf("%s",ta);
		temp[c-1]=place_teacher1(ps,ta);
		printf("\tdo you have any more stuff for practical %s:(y/n)",s);
		fflush(stdin);
		ch=getchar();
		c++;
	}while(ch=='y');

  ps->tch=temp;
  ps->no_teacher=c-1;

  ps->p_weight=(int*)malloc(sizeof(int)*p->no_grp);

  for(i=0;i<p->no_grp;i++)
	  ps->p_weight[i]=0;

}


void creat_sub (NEW *nw, SUB *subj, char *s, int d)
{
  int i;
  int c=1;
  char ch,ta[10];
  subj->sub_indx=d;
  strcpy(subj->sub,s);
  subj->upLink=nw;
  for (i=0;i<6;i++) {
	subj->s_weight[i]=0;
  }

  int* temp=NULL;

  if(cred==1)
  {
	  printf("enter credit point");
	  scanf("%d",&subj->cr_pt);
  }
  else 
	  subj->cr_pt=1;


  do{
	temp=(int *)realloc(temp,c*sizeof(int));
		printf("\n\tEnter name of teacher %d for sub %s:",c,s);
		fflush(stdin);
		scanf("%s",ta);
		temp[c-1]=place_teacher(subj,ta);
		printf("\tdo you have any more stuff for sub %s:(y/n)",s);
		fflush(stdin);
		ch=getchar();
		c++;
	}while(ch=='y');

  subj->tch=temp;
  subj->no_teacher=c-1;
  subj->lnk=NULL;
}

int place_teacher (SUB *subj, char *ta)

{
	int indx;

	if(prof_check(&indx,ta))
	{
			creat_teacher(prof+indx,subj,ta,1);
		return (indx);
	}
	else
	{
		no_prof++;
		prof=(TEACHER*)realloc(prof,no_prof*sizeof(TEACHER));
		creat_teacher(prof+no_prof-1,subj,ta,0);
		return (no_prof-1);
	}


}

int place_teacher1 (PRACSUB *ps,char *ta)
{
	int indx;

	if(prof_check(&indx,ta))
	{
		creat_teacher1(prof+indx,ps,ta,1);
		return (indx);
	}
	else
	{
		no_prof++;
		prof=(TEACHER*)realloc(prof,no_prof*sizeof(TEACHER));
		creat_teacher1(prof+no_prof-1,ps,ta,0);
		return (no_prof-1);
	}
}



void creat_teacher(TEACHER* p,SUB* subj,char *ta,int used)
{

	if(used==0)
	{
		p->th_weight=0;
		p->pr_weight=0;
		strcpy(p->teach,ta);
		p->t_upLink=NULL;
		p->p_upLink=NULL;
	}

	p->th_weight++;


	p->t_upLink=(SUB**)realloc(p->t_upLink,p->th_weight*sizeof(SUB*));

	p->t_upLink[p->th_weight-1]=subj;
}

void creat_teacher1(TEACHER* p,PRACSUB* ps,char *ta,int used)
{

	if(used==0)
	{
		p->th_weight=0;
		p->pr_weight=0;
		strcpy(p->teach,ta);
		p->t_upLink=NULL;
		p->p_upLink=NULL;
	}

	p->pr_weight++;


	p->p_upLink=(PRACSUB**)realloc(p->p_upLink,p->pr_weight*sizeof(SUB*));

	p->p_upLink[p->pr_weight-1]=ps;
}




int prof_check(int *in,char *t)
{

    int i;

    for(i=0;i<no_prof;i++)
	{
		*in=i;

		if(!(strcmp(prof[i].teach,t)))
			return 1;
	}

	return 0;
}


void initialize(WEEK* root,SYLLABUS* syl)
{
	int i,j,k,l,h,a,b,u,chk=0;
    long ltime;
    unsigned int stime;

    ltime=time(NULL);
    stime=(unsigned)ltime;

    srand(stime);

	for(i=0;i<no_year;i++) {
		for (j=0;j<no_strm;j++) {
			syl->clas[i]->nw[j]->max_sub = (no_per/(syl->clas[i]->nw[j]->no_sub))+1;
			//syl->clas[i]->nw[j]->max_w_sub=((6*no_per)/(syl->clas[i]->nw[j]->no_sub));
		}
	}
	
	
	

	for (h=0;h<6;h+=1) {
		for(i=0;i<no_per;i++) {
			for(j=0;j<no_year;j++) {
				for (u=0;u<no_strm;u++) {

					if(root->day[h]->prd[i]->year[j]->stream[u]->prac_avbl==1)
						continue;

					do{
						a=syl->clas[j]->nw[u]->no_sub;
						k=rand()%a;
						chk++;
						printf("%d  %d\n",j,chk);

					}while(((syl->clas[j]->nw[u]->subs[k]->s_weight[h])+1)>(syl->clas[j]->nw[u]->max_sub));
					printf("after selecting");

				b=syl->clas[j]->nw[u]->subs[k]->no_teacher;
				l=rand()%b;

				root->day[h]->prd[i]->year[j]->stream[u]->d=h;
				strcpy(root->day[h]->prd[i]->year[j]->stream[u]->sub,syl->clas[j]->nw[u]->subs[k]->sub);
				syl->clas[j]->nw[u]->subs[k]->s_weight[h]=syl->clas[j]->nw[u]->subs[k]->s_weight[h]+1;
				syl->clas[j]->nw[u]->d_pr_cnt[k]=syl->clas[j]->nw[u]->d_pr_cnt[k]+1;
				syl->clas[j]->nw[u]->subs[k]->lnk=(LINK **)realloc(syl->clas[j]->nw[u]->subs[k]->lnk,(syl->clas[j]->nw[u]->d_pr_cnt[k])*sizeof(LINK *));
				syl->clas[j]->nw[u]->subs[k]->lnk[syl->clas[j]->nw[u]->d_pr_cnt[k]-1]=(LINK *)malloc(sizeof(LINK));
				syl->clas[j]->nw[u]->subs[k]->lnk[syl->clas[j]->nw[u]->d_pr_cnt[k]-1]->sidelink=root->day[h]->prd[i]->year[j]->stream[u];
				syl->clas[j]->nw[u]->subs[k]->lnk[syl->clas[j]->nw[u]->d_pr_cnt[k]-1]->dy=h;
				strcpy(root->day[h]->prd[i]->year[j]->stream[u]->teacher,prof[syl->clas[j]->nw[u]->subs[k]->tch[l]].teach);
				}
			}
		}

	}
	
	
	week_check(syl);
}

void sum_add (NEW *temp) {
	for (int i=0;i<temp->no_sub;i++) {
		int sum = 0;
		for (int j=0;j<6;j++) {
			sum +=temp->subs[i]->s_weight[j];
		}
		temp->d_pr_cnt[i]=sum;
	}
}

void week_check (SYLLABUS * syl) {			//checks the maximum sub of week
	for (int i=0;i<no_year;i++) {
		for (int j=0;j<no_strm;j++) {
			int max=syl->clas[i]->nw[j]->no_sub;
			for(int k=0;k<max;k++) {
				if (syl->clas[i]->nw[j]->d_pr_cnt[k]>syl->clas[i]->nw[j]->subs[k]->max_w_sub) {
					for (int l=0;l<max;l++) {
						if (l==k) continue;

						if((syl->clas[i]->nw[j]->d_pr_cnt[l])<(syl->clas[i]->nw[j]->subs[l]->max_w_sub)) {
							overwrite(syl->clas[i]->nw[j],l,k);
						}

						if (syl->clas[i]->nw[j]->d_pr_cnt[k]<=syl->clas[i]->nw[j]->subs[k]->max_w_sub) break;
					}
				}
			}
		}
	}
}



void overwrite (NEW *strm,int l,int k)
{
	int i,max,d,z,a;

	
	max=strm->d_pr_cnt[k];

	for(i=0;i<max;i++)
	{
		d=strm->subs[k]->lnk[i]->dy;

		if((strm->d_pr_cnt[l]+1)>strm->subs[l]->max_w_sub)
			break;
		else if((strm->subs[l]->s_weight[d]+1)>(strm->max_sub))
			continue;
		else
		{
			strcpy(strm->subs[k]->lnk[i]->sidelink->sub,strm->subs[l]->sub);
			(strm->d_pr_cnt[k])--;
			(strm->d_pr_cnt[l])++;
			(strm->subs[k]->s_weight[d])--;
			(strm->subs[l]->s_weight[d])++;
			
			
			a=strm->subs[l]->no_teacher;
			z=rand()%a;

			strcpy(strm->subs[k]->lnk[i]->sidelink->teacher,prof[strm->subs[l]->tch[z]].teach);
		}

		
	}
}


					

void display_(WEEK *week)
{
    printf("hhh");
	int i,j,co,k,h,m,n;
    printf("\n\n\n\n\t\t\tSTANDARD ROUTINE PROTOCOL\n");
    for(i=0;i<80;i++)
    printf("-");
    printf("\n\n");

	for(h=0;h<6;h++)
	{
		printf("\nday %d\n\n",h);
	

		for(k=0;k<no_strm;k++)
		{

			printf("\n%s\n\n",strm[k]);


			for(i=0;i<no_year;i++)
				printf("\tYEAR %d\t",i+1);

			printf("\n");
			for (i=0;i<no_per;i++) {
				printf("PER %d\t",week->day[h]->prd[i]->p+1);
				for (j=0;j<no_year;j++) {
					if(week->day[h]->prd[i]->year[j]->stream[k]->prac_avbl==0)
					{
					
						co=  printf ("%s (%s)",week->day[h]->prd[i]->year[j]->stream[k]->sub,week->day[h]->prd[i]->year[j]->stream[k]->teacher);
						if(co<8)
							printf("\t\t");
						else
							printf("\t");
					}
					else
					{
						for(m=0;m<week->day[h]->prd[i]->year[j]->stream[k]->no_grup;m++)
						{
							printf("%s ",week->day[h]->prd[i]->year[j]->stream[k]->grup[m]->sub);
							for(n=0;n<week->day[h]->prd[i]->year[j]->stream[k]->grup[m]->no_tch;n++)
							{
								printf("%s ",week->day[h]->prd[i]->year[j]->stream[k]->grup[m]->teacher[n]);
							}
						}
					}

				
				}
				printf("\n");
			}
		}
	}
}



/*void display(SYLLABUS* syl)
{

   int i,j,k;
   for(i=0;i<no_year;i++) {
      printf("subjects of year %d",i+1);
	  printf("\n");
	  for(j=0;j<syl->clas[i]->no_sub;j++) {
		  printf("\t%d. %s: ",j+1,syl->clas[i]->subs[j]->sub);
		  printf("%d ",syl->clas[i]->subs[j]->no_teacher);
		  for(k=0;k<syl->clas[i]->subs[j]->no_teacher;k++)
			  printf(" %u %s ",syl->clas[i]->subs[j]->tch[k],prof[syl->clas[i]->subs[j]->tch[k]].teach);
		  printf("\n");
	  }
	  printf("\n");
   }
}

*/
DISEASED **build_check_tree()
{
	DISEASED **root;
	root=(DISEASED**)malloc(6*sizeof(DISEASED*));
	int i,j;
	for (int k=0;k<6;k++) {
		root[k]=(DISEASED *)malloc(sizeof(DISEASED));
		root[k]->clss=(CLAS **)malloc(no_year*sizeof(CLAS*));
	

	    printf("happy");

	    for (i=0;i<no_year;i++) {
			root[k]->clss[i]=(CLAS *)malloc(sizeof(CLAS));
			root[k]->clss[i]->stream=(STRM **)malloc(no_strm*sizeof(STRM *));
			for (j=0;j<no_strm;j++) {
				root[k]->clss[i]->stream[j]=(STRM *)malloc(sizeof(STRM));
				root[k]->clss[i]->stream[j]->tchr=NULL;
				root[k]->clss[i]->stream[j]->no_nd=0;
			}
		}
	}

	printf("piu");
	return root;
}

void check_teacher(DAY *day,DISEASED *root)
{
	
	int i,j,k,l,m,o;
	int n=0;
	int p=0;



	for (i=0;i<no_per;i++) {
		for (j=0;j<no_year;j++) {
			for (k=j;k<no_year;k++) {
				for (l=0;l<no_strm;l++) {

					if(day->prd[i]->year[j]->stream[l]->prac_avbl==1)
						continue;

					if(j==k)
						o=l+1;
					else
						o=0;

					for (m=o;m<no_strm;m++) {
						if (day->prd[i]->year[k]->stream[m]->prac_avbl==1) 
							continue;

					if (!strcmp(day->prd[i]->year[j]->stream[l]->teacher,day->prd[i]->year[k]->stream[m]->teacher)) { 
	
						if(node_check(day->prd[i]->year[j]->stream[l],root->clss[j]->stream[l])) 
						{
							root->clss[j]->stream[l]->no_nd++;
							p=root->clss[j]->stream[l]->no_nd;
							root->clss[j]->stream[l]->tchr=(STREAM **)realloc(root->clss[j]->stream[l]->tchr,(p)*sizeof(STREAM *));
							root->clss[j]->stream[l]->tchr[p-1]=day->prd[i]->year[j]->stream[l];
						}
	
	
						if(node_check(day->prd[i]->year[k]->stream[m],root->clss[k]->stream[m]))
						{
							root->clss[k]->stream[m]->no_nd++;
							n=root->clss[k]->stream[m]->no_nd;
							root->clss[k]->stream[m]->tchr=(STREAM **)realloc(root->clss[k]->stream[m]->tchr,(n)*sizeof(STREAM *));
							root->clss[k]->stream[m]->tchr[n-1]=day->prd[i]->year[k]->stream[m];
						}
					}
					}
				}
			}
		}
	}

	leaf_count(root);
}

void swap (STREAM *node1, STREAM *node2)
{
	STREAM *temp;
	temp=(STREAM *)malloc(sizeof(STREAM));

	temp->check=node1->check;				//copy(temp,node1);
	//temp->sibling=node1->sibling;
	strcpy(temp->sub,node1->sub);
	strcpy(temp->teacher,node1->teacher);
	temp->upLink=node1->upLink;
	temp->d=node1->d;
	//temp->y=node1->y;

	node1->check=node2->check;				//copy(node1,node2)
	//node1->sibling=node2->sibling;
	strcpy(node1->sub,node2->sub);
	strcpy(node1->teacher,node2->teacher);
	node1->upLink=node2->upLink;
	node1->d=node2->d;
	//node1->y=node2->y;

	node2->check=temp->check;				//copy(node2,temp)
	//node2->sibling=temp->sibling;
	strcpy(node2->sub,temp->sub);
	strcpy(node2->teacher,temp->teacher);
	node2->upLink=temp->upLink;
	node2->d=temp->d;
	//node2->y=temp->y;
}

					


/*void display2(DISEASED * root)
{

	int i,j,m;

	for(i=0;i<no_year;i++) {

		printf(" year %d\n",i+1);
		m=root->clss[i]->;
		printf("%d %d\n",i+1,m);

		for(j=0;j<m;j++)
		{

			printf("\n\t%d%s\n",j+1,root->clss[i]->tchr[j]->sub);
		}
	}
}*/



int node_check(STREAM *n,STRM *c)
{

	int m,i;

	m=c->no_nd;

	for(i=0;i<m;i++)
	{
	  if(c->tchr[i]==n)
	  {
		  return 0;
	  }
	}

	return 1;

}

int check1 (STREAM *node1, STREAM *node2, SYLLABUS *db)
{
	PERIOD *temp1, *temp2;
	int i,j;
	
	/*if (node1->check==1||node2->check==1)
		return 0;*/
	
	temp1=node1->upLink->upLink;
	temp2=node2->upLink->upLink;


	for (i=0;i<no_year;i++) {
		for (j=0;j<no_strm;j++) {
			if (!(strcmp(temp1->year[i]->stream[j]->teacher, node2->teacher)&&strcmp(temp2->year[i]->stream[j]->teacher,node1->teacher)))
				return 0;
		}
	}

	int year1 = node1->upLink->y;
	int year2 = node2->upLink->y;
	int strm1 = node1->s;
	int strm2 = node2->s;

	for(i=0;i<db->clas[year1]->nw[strm1]->no_sub;i++)
		if(!(strcmp(node1->sub,db->clas[year1]->nw[strm1]->subs[i]->sub)))
			break;

	int s1=i;



	for(i=0;i<db->clas[year2]->nw[strm2]->no_sub;i++)
		if(!(strcmp(node2->sub,db->clas[year2]->nw[strm2]->subs[i]->sub)))
		break;

    int s2=i;

	if(node1->d!=node2->d)
	{
		if((db->clas[year1]->nw[strm1]->subs[s2]->s_weight[node1->d]>=db->clas[year1]->nw[strm1]->max_sub)||(db->clas[year2]->nw[strm2]->subs[s1]->s_weight[node2->d]>=db->clas[year2]->nw[strm2]->max_sub))
			return 0;
	
		db->clas[year1]->nw[strm1]->subs[s2]->s_weight[node1->d]++;
		db->clas[year1]->nw[strm1]->subs[s1]->s_weight[node1->d]--;
		db->clas[year2]->nw[strm2]->subs[s1]->s_weight[node2->d]++;
		db->clas[year2]->nw[strm2]->subs[s2]->s_weight[node2->d]--;
	}


	return 1;
}


/*void change_check(DISEASED *root,SYLLABUS *db,int k)
{

	int i,j,l,cl,m,n;

	for(i=0;i<no_year;i++)
	{
		cl=i;
		for (l=0;l<no_strm;l++) {
			n=l;
			m=root->clss[i]->stream[l]->no_nd;

			for(j=0;j<m;j++)
			{
				//if(!(root->clss[i]->stream[l]->tchr[j]->check))
					change_replace(root->clss[i]->stream[l]->tchr[j],db,cl,n,k);
			}
		}
	}
}*/


/*void change_replace(STREAM* node1,SYLLABUS* db,int cl,int n, int s)
{

	int i,j,a,b,l,k,s_ind,t_ind;

	for(i=0;i<db->clas[cl]->nw[n]->no_sub;i++)
		if(!(strcmp(node1->sub,db->clas[cl]->nw[n]->subs[i]->sub)))
		{
			for(j=0;j<db->clas[cl]->nw[n]->subs[i]->no_teacher;j++)
			{
				if(!(strcmp(node1->teacher,prof[db->clas[cl]->nw[n]->subs[i]->tch[j]].teach)))
					break;
			}
			break;
		}

    s_ind=i;//index gulo paya gelo..pathetic
	t_ind=j;

	i=0;

	{
		
		do{	printf(" %d ",i);
			a=db->clas[cl]->nw[n]->no_sub;
			k=rand()%a;
			i++;

			if(i>50)
				goto neel;
		
			
		}while(((db->clas[cl]->nw[n]->subs[k]->s_weight[s])+1)>(db->clas[cl]->nw[n]->max_sub)||((db->clas[cl]->nw[n]->d_pr_cnt[k])+1)>(db->clas[cl]->nw[n]->max_w_sub));

		getch();
		b=db->clas[cl]->nw[n]->subs[k]->no_teacher;
		l=rand()%b;

		printf("%s",node1->sub);
		printf("%s",db->clas[cl]->nw[n]->subs[k]->sub);

		
		strcpy(node1->sub,db->clas[cl]->nw[n]->subs[k]->sub);
		strcpy(node1->teacher,prof[db->clas[cl]->nw[n]->subs[k]->tch[l]].teach);
		(db->clas[cl]->nw[n]->subs[k]->s_weight[s])++;
		(db->clas[cl]->nw[n]->d_pr_cnt[k])++;
		(db->clas[cl]->nw[n]->subs[s_ind]->s_weight[s])--;
		(db->clas[cl]->nw[n]->d_pr_cnt[s_ind])--;

		}
neel:;
}*/

void leaf_count(DISEASED* root)
{
	int i,j,sum=0;

	for(i=0;i<no_year;i++) {
		for (j=0;j<no_strm;j++) {
			sum+=root->clss[i]->stream[j]->no_nd;
		}
	}

	root->degree=sum;
}

/*void swap_check (DISEASED *root)
{

	STRM *temp;
	int i,j,k,l,len;
	for (i=0;i<no_year;i++) {
		for (j=0;j<no_strm;j++) {
			temp=root->clss[i]->stream[j];
			len=temp->no_nd;
			for (k=0;k<len;k++) 
			{
				for(l=k+1;l<len;l++) {
					if (check1(temp->tchr[k],temp->tchr[l])) {
						swap(temp->tchr[k],temp->tchr[l]);
						temp->tchr[l]->check=1;
						temp->tchr[k]->check=1;
					}
				}
			}
		}
	}
}*/

void swap_check1 (DISEASED *root, WEEK *root1, SYLLABUS *db) {
	STRM *temp;
	for (int i=0;i<no_year;i++) {
		for (int j=0;j<no_strm;j++) {
			printf("\n");
			temp=root->clss[i]->stream[j];
			int len = temp->no_nd;
			for (int l=0;l<len;l++) {
				int c=0,pr,da,st,yr;


				st=temp->tchr[l]->s;
				yr=temp->tchr[l]->upLink->y;

				pr=temp->tchr[l]->upLink->upLink->p;
				da=temp->tchr[l]->d;
				for(int m=0;m<no_year;m++)
					for(int n=0;n<no_strm;n++)
					{
						if((!(yr==m&&st==n))&&(root1->day[da]->prd[pr]->year[m]->stream[n]->prac_avbl!=1))
						{
					
							if(!strcmp(root1->day[da]->prd[pr]->year[m]->stream[n]->teacher,temp->tchr[l]->teacher))
							c=1;
						}
					}


				if(c==1)
				{


				
					for (int e=0;e<6;e++) {

						for (int k=0;k<no_per;k++) {
							if(root1->day[e]->prd[k]->year[i]->stream[j]->prac_avbl==1)
								continue;

								printf("%d %d\t",root->clss[i]->stream[j]->tchr[l]->d,e);
								if (check1(temp->tchr[l], root1->day[e]->prd[k]->year[i]->stream[j], db)) {
									printf("lll");
									getch();
									swap(temp->tchr[l], root1->day[e]->prd[k]->year[i]->stream[j]);
									temp->tchr[l]->check=1;
									root1->day[e]->prd[k]->year[i]->stream[j]->check=1;
									goto a;
							}
						}
					}
				}
a:;
			}
		}
	}
}

void refresh(WEEK *root)
{
	int i,j,k,l;

	for(i=0;i<6;i++)
		for(j=0;j<no_per;j++)
			for(k=0;k<no_year;k++)
				for(l=0;l<no_strm;l++)
					root->day[i]->prd[j]->year[k]->stream[l]->check=0;
}

void cred_division (SYLLABUS *db) {

	
	int i,j,l,c=0;
	int sum;

	/*calculate the no of per in each slot*/
	for(i=0;i<10&&slotdb[0][i]!=-1;i++)
		c++;

	for(i=0;i<no_year;i++)
		for(j=0;j<no_strm;j++)
		{
			db->clas[i]->nw[j]->total_th_prd=(6*no_per)-c*(db->clas[i]->nw[j]->prac->no_prac);
		}

	for (i=0;i<no_year;i++) {
		for (j=0;j<no_strm;j++) {
			int cr_tot=0;
			for (l=0;l<db->clas[i]->nw[j]->no_sub;l++) {
				cr_tot+=db->clas[i]->nw[j]->subs[l]->cr_pt;
			}

			for(l=0;l<db->clas[i]->nw[j]->no_sub;l++) {
				db->clas[i]->nw[j]->subs[l]->max_w_sub=(db->clas[i]->nw[j]->subs[l]->cr_pt)*(db->clas[i]->nw[j]->total_th_prd)/(cr_tot);
			}
		}
	}
	
	for (i=0;i<no_year;i++) {
		for (j=0;j<no_strm;j++) {
			sum=0;
			for (l=0;l<db->clas[i]->nw[j]->no_sub;l++) {
				sum+=db->clas[i]->nw[j]->subs[l]->max_w_sub;
			}
			if (sum<db->clas[i]->nw[j]->total_th_prd) {
				int less=db->clas[i]->nw[j]->total_th_prd-sum;
				for (int l=0;l<db->clas[i]->nw[j]->no_sub&&less>0;l++,less--) 
					db->clas[i]->nw[j]->subs[l]->max_w_sub++;
			}

			
		}
	}

	/*if (sum<total) {
		int less=total-sum;
		for (int i=0;i<no_year;i++) {
			for (int j=0;j<no_strm;j++) {
				for (int l=0;l<db->clas[i]->nw[j]->no_sub&&less>0;l++,less--) {
					db->clas[i]->nw[j]->subs[l]->max_w_sub++;
				}
			}
		}
	}*/

	show_cred(db);
	getch();

}

void show_cred (SYLLABUS *db) {

	printf("\n\nthe period assigned on the basis of given credit point\n\n");

	for (int i=0;i<no_year;i++) {
		printf("YEAR %d\n",i+1);
		for (int j=0;j<no_strm;j++) {
			printf("%s\n",strm[j]);
			for (int l=0;l<db->clas[i]->nw[j]->no_sub;l++) {
				printf("%s %d\t",db->clas[i]->nw[j]->subs[l]->sub,db->clas[i]->nw[j]->subs[l]->max_w_sub);
			}
		}
	}
	
	//printf("want to change it(y/n)")
}

void creat_slotdb()
{
	int i,j,k,l=0;
	int c=0;


	char s[10][10];



	for(i=0;i<10;i++){
		for(j=0;j<10;j++){
			slotdb[i][j]=-1;
		}
	}

	for(i=0;i<no_slot;i++)
	{
		printf("\nenter the periods for slot%d(1,2,3..|1,2,3 denoting period no)",i);
		scanf("%s",s[i]);
	}

	for (i=0;i<no_slot;i++) {

		k=0;
		for (j=0;j<10;j++) {
			if (s[i][j]=='\0'||s[i][j]==',')
			{
				slotdb[i][k]=c;
				k++;
				c=0;
				l=0;
				if(s[i][j]=='\0')
					break;
			}
			else 
			{
				c=c*10+(s[i][j]-48);
				l++;
			}
		}
	}
}

/* ~~~~~~~~~~~~~~~~~~~ PRACTICAL ~~~~~~~~~~~~*/
WEEK1* creat_Tree1 (SYLLABUS *db)
{
	WEEK1 *week;
	int i;
	DAY1 **temp;
	week = (WEEK1 *)malloc(sizeof(WEEK1));

	temp=(DAY1**)malloc(6*sizeof(DAY1*));
	for (i=0;i<6;i++) {
	     temp[i]=(DAY1*)malloc(sizeof(DAY1));
	     creat_day1(week,temp[i],i,db);
	     }
	week->day1=temp;
	return week;
}


void creat_day1 (WEEK1 *week, DAY1 *day, int r, SYLLABUS *db) {
	int i;
	SLOT **temp;
	day->d1=r;
	day->upLink=week;


	temp=(SLOT**)malloc(no_slot*sizeof(SLOT*));
	for (i=0;i<no_slot;i++) {
	     temp[i]=(SLOT*)malloc(sizeof(SLOT));
	     creat_slot(day,temp[i],i, db);
	     }
	day->slot=temp;
}

void creat_slot (DAY1 *day, SLOT *slot, int s,SYLLABUS *db )
{
	int i,c=1,*temp1;
	YEAR1 **temp;
	slot->sl=s;
	slot->upLink=day;


	temp=(YEAR1**)malloc(no_year*sizeof(YEAR1*));
	for (i=0;i<no_year;i++) {
	     temp[i]=(YEAR1*)malloc(sizeof(YEAR1));
	     creat_year1(slot,temp[i],i, db);
	}
	slot->year=temp;

	temp1=NULL;

	for(i=0;i<10&&slotdb[s][i]!=-1;i++)
	{
		temp1=(int*)realloc(temp1,(i+1)*sizeof(int));
		temp1[i]=slotdb[s][i]-1;
	}

}

void creat_year1(SLOT *slot, YEAR1 *node, int m, SYLLABUS *db)
{
	int i;
	STREAM1 **temp;
	node->y=m;
	node->upLink=slot;


	temp=(STREAM1**)malloc(no_strm*sizeof(STREAM1*));
	for (i=0;i<no_strm;i++) {
	     temp[i]=(STREAM1*)malloc(sizeof(STREAM1));
	     creat_stream1(node,temp[i],i, db);
	     }
	node->stream=temp;
}


void creat_stream1 (YEAR1 *node, STREAM1 *stream, int n, SYLLABUS *db)
{
	int i;
	GRP **temp;
	stream->s=n;
	stream->upLink=node;
	stream->avbl=0;
	stream->no_grp=db->clas[node->y]->nw[n]->prac->no_grp;

	temp=(GRP **)malloc(stream->no_grp*sizeof(GRP *));

	for (i=0;i<stream->no_grp;i++) {
	     temp[i]=(GRP*)malloc(sizeof(GRP));
	     creat_grp(stream,temp[i],i, db);
	     }
	stream->group=temp;
}

void creat_grp (STREAM1 *stream, GRP *grp, int n, SYLLABUS *db) 
{
	
	grp->group=n;
	grp->upLink=stream;
}

void intlz_prac(WEEK1 *root,SYLLABUS *db)
{
	int i,j,k,c,d,l;
	printf("into intz_prac");
	/*long ltime;
    unsigned int stime;


	ltime=time(NULL);
    stime=(unsigned)ltime;

    srand(stime);*/


	for(i=0;i<no_year;i++)
	{
		for(j=0;j<no_strm;j++)
		{
			for(k=0;k<(db->clas[i]->nw[j]->prac->no_prac);k++)
			{
				
				do{
					c=0;

					d=rand()%(no_slot*6);

					for(l=0;l<(db->clas[i]->nw[j]->prac->no_prac);l++)
					{
						if(db->clas[i]->nw[j]->prac->pdb[l]==d)
							c=1;
					}
				}while(c==1);

				db->clas[i]->nw[j]->prac->pdb[k]=d;
			}

			for(k=0;k<(db->clas[i]->nw[j]->prac->no_prac);k++)
			{
				for(l=1;l<(db->clas[i]->nw[j]->prac->no_grp+1);l++)
				{
					if(k==0)
					{
						db->clas[i]->nw[j]->prac->prac_directive[k][l]=(l-1);
					}
					else
					{
						if(db->clas[i]->nw[j]->prac->prac_directive[k-1][l]==0)
						{
							db->clas[i]->nw[j]->prac->prac_directive[k][l]=(db->clas[i]->nw[j]->prac->no_prac-1);
						}
						else
						{
							db->clas[i]->nw[j]->prac->prac_directive[k][l]=(db->clas[i]->nw[j]->prac->prac_directive[k-1][l]-1);
						}
					}
				}
			}

			for(k=0;k<(db->clas[i]->nw[j]->prac->no_prac);k++)
			{
				for(l=1;l<(db->clas[i]->nw[j]->prac->no_grp+1);l++)
				{ 
					printf("%d ",db->clas[i]->nw[j]->prac->prac_directive[k][l]);
				}
				printf("\n");
			}
			getch();





		}
	}

	set_prac(root,db);
}

void set_prac(WEEK1 *root,SYLLABUS *db)
{
	int i,j,k,l,q,r,no,m,d,x,y;
	STREAM1 *temp;

	for(i=0;i<no_year;i++)
	{
		for(j=0;j<no_strm;j++)
		{
			printf("into 2nd loop of set_prac");
			for(k=0;k<db->clas[i]->nw[j]->prac->no_prac;k++)
			{
				m=db->clas[i]->nw[j]->prac->pdb[k];

				q=m/no_slot;
				r=m%no_slot;
				printf("%d %d",q,r);

				temp=root->day1[q]->slot[r]->year[i]->stream[j];
				temp->avbl=1;
				
				do{
					y=rand()%(db->clas[i]->nw[j]->prac->no_prac);
				}while(db->clas[i]->nw[j]->prac->prac_directive[y][0]!=0);

				db->clas[i]->nw[j]->prac->prac_directive[y][0]=1;


				for(l=0;l<db->clas[i]->nw[j]->prac->no_grp;l++)
				{
					d=db->clas[i]->nw[j]->prac->prac_directive[y][l+1];

					strcpy(temp->group[l]->sub,db->clas[i]->nw[j]->prac->pracsub[d]->psub);

					no=db->clas[i]->nw[j]->prac->pracsub[d]->no_teacher;
					temp->group[l]->no_tch=no;

					temp->group[l]->teacher=(char**)malloc(no*sizeof(char*));

					for(x=0;x<no;x++)
					{
						temp->group[l]->teacher[x]=(char*)malloc(10*sizeof(char));
						printf("%s",prof[db->clas[i]->nw[j]->prac->pracsub[d]->tch[x]].teach);
						strcpy(temp->group[l]->teacher[x],prof[db->clas[i]->nw[j]->prac->pracsub[d]->tch[x]].teach);
						printf("   %s",temp->group[l]->teacher[x]);
					}

				}
			}
		}
	}
}

void display3(WEEK1 *root)
{
	int i,j,k,l,m,n;

	for(i=0;i<6;i++){
		printf("DAY %d",i);
		printf("\n");

		for(j=0;j<no_year;j++){

			printf("%year %d",j);
			printf("\n");

			for(k=0;k<no_strm;k++){

				printf("strm %d",k);
				printf("\n");

				for(l=0;l<no_slot;l++)
				{
					if(root->day1[i]->slot[l]->year[j]->stream[k]->avbl==1)
					{
						printf("SLOT%d \n",l);

						for(m=0;m<root->day1[i]->slot[l]->year[j]->stream[k]->no_grp;m++)
						{
							printf("%s  ",root->day1[i]->slot[l]->year[j]->stream[k]->group[m]->sub);

							for(n=0;n<root->day1[i]->slot[l]->year[j]->stream[k]->group[m]->no_tch;n++)
							{
								printf("in the for");
								printf("%s ",root->day1[i]->slot[l]->year[j]->stream[k]->group[m]->teacher[n]);
							}

							printf("\n");
						}
					}
				}
			}
		}
	}
}

DISEASED1 **build_check_tree1()
{
	DISEASED1 **root;
	root=(DISEASED1**)malloc(6*sizeof(DISEASED1*));
	int i,j;
	for (int k=0;k<6;k++) {
		root[k]=(DISEASED1 *)malloc(sizeof(DISEASED1));
		root[k]->clss=(CLAS1 **)malloc(no_year*sizeof(CLAS1*));
	

	    printf("happy");

	    for (i=0;i<no_year;i++) {
			root[k]->clss[i]=(CLAS1 *)malloc(sizeof(CLAS1));
			root[k]->clss[i]->stream=(STRM1 **)malloc(no_strm*sizeof(STRM1 *));
			for (j=0;j<no_strm;j++) {
				root[k]->clss[i]->stream[j]=(STRM1 *)malloc(sizeof(STRM1));
				root[k]->clss[i]->stream[j]->prac_prob=NULL;
				root[k]->clss[i]->stream[j]->no_nd=0;
			}
		}
	}
	printf("piu");
	return root;
}

void check_teacher1(DAY1 *day,DISEASED1 *root)
{
	
	int i,j,k,l,m,o,c=0,w,x,y,z;
	int n=0;
	int p=0;



	for (i=0;i<no_slot;i++) {
		printf("jack ");
		for (j=0;j<no_year;j++) {
			for (k=j;k<no_year;k++) {
				for (l=0;l<no_strm;l++) {
					if(j==k)
						o=l+1;
					else
						o=0;

					if(day->slot[i]->year[j]->stream[l]->avbl==0)
						continue;

					for (m=o;m<no_strm;m++) {
						if ((j==k&&l==m)||(day->slot[i]->year[k]->stream[m]->avbl==0)) 
							continue;

						c=0;

						for(w=0;w<day->slot[i]->year[j]->stream[l]->no_grp;w++)
							for(x=0;x<day->slot[i]->year[j]->stream[l]->group[w]->no_tch;x++)
								for(y=0;y<day->slot[i]->year[k]->stream[m]->no_grp;y++)
									for(z=0;z<day->slot[i]->year[k]->stream[m]->group[y]->no_tch;z++)
										if(!strcmp(day->slot[i]->year[j]->stream[l]->group[w]->teacher[x],day->slot[i]->year[k]->stream[m]->group[y]->teacher[z]))
											c=1;
						
										


						if (c==1) { 
							printf("ioi");
	
							if(node_check1(day->slot[i]->year[j]->stream[l],root->clss[j]->stream[l])) 
							{
								root->clss[j]->stream[l]->no_nd++;
								p=root->clss[j]->stream[l]->no_nd;
								root->clss[j]->stream[l]->prac_prob=(STREAM1 **)realloc(root->clss[j]->stream[l]->prac_prob,(p)*sizeof(STREAM1 *));
								root->clss[j]->stream[l]->prac_prob[p-1]=day->slot[i]->year[j]->stream[l];
							}
	
	
							if(node_check1(day->slot[i]->year[k]->stream[m],root->clss[k]->stream[m]))
							{
								root->clss[k]->stream[m]->no_nd++;
								n=root->clss[k]->stream[m]->no_nd;
								root->clss[k]->stream[m]->prac_prob=(STREAM1 **)realloc(root->clss[k]->stream[m]->prac_prob,(n)*sizeof(STREAM1 *));
								root->clss[k]->stream[m]->prac_prob[n-1]=day->slot[i]->year[k]->stream[m];
							}
						}
					}
				}
			}
		}
	}

	//leaf_count(root);
	printf("neel");
}

int node_check1(STREAM1 *n,STRM1 *c)
{

	int m,i;
	printf("rum ");

	m=c->no_nd;

	for(i=0;i<m;i++)
	{
	  if(c->prac_prob[i]==n)
	  {
		  return 0;
	  }
	}

	return 1;

}

void swap_check2 (DISEASED1 *root, WEEK1 *root1, SYLLABUS *db) {
	STRM1 *temp;
	for (int i=0;i<no_year;i++) {
		for (int j=0;j<no_strm;j++) {
			printf("\n");
			temp=root->clss[i]->stream[j];
			int len = temp->no_nd;
			for (int l=0;l<len;l++) {
				int c=0,sl,da,st,yr;


				st=temp->prac_prob[l]->s;
				yr=temp->prac_prob[l]->upLink->y;

				sl=temp->prac_prob[l]->upLink->upLink->sl;
				da=temp->prac_prob[l]->upLink->upLink->upLink->d1;
				/*for(int m=0;m<no_year;m++)
					for(int n=0;n<no_strm;n++)
					{
						if(!(yr==m&&st==n))
						{
					
							if(!strcmp(root1->day[da]->prd[pr]->year[m]->stream[n]->teacher,temp->tchr[l]->teacher))
							c=1;
						}
					}


				if(c==1)*/
				{


				
					for (int e=0;e<6;e++) {

						for (int k=0;k<no_slot;k++) {

							
							if (check2(temp->prac_prob[l], root1->day1[e]->slot[k]->year[i]->stream[j], db)) {
								printf("lll");
								getch();
								swap1(temp->prac_prob[l], root1->day1[e]->slot[k]->year[i]->stream[j]);
								//temp->tchr[l]->check=1;
								//root1->day[e]->prd[k]->year[i]->stream[j]->check=1;
								goto a;
							}
						}
					}
				}
a:;
			}
		}
	}
}

int check2(STREAM1 *node1, STREAM1 *node2, SYLLABUS *db)
{
	SLOT *temp1, *temp2;
	int i,j,m,n,o,p;
	
	
	
	temp1=node1->upLink->upLink;
	temp2=node2->upLink->upLink;

	printf(" in check 2");


	

	for(i=0;i<node1->no_grp;i++)
		for(j=0;j<node1->group[i]->no_tch;j++)
			for(m=0;m<no_year;m++)
				for(n=0;n<no_strm;n++)
				{
					if(temp2->year[m]->stream[n]->avbl==0)
						continue;
					else
					{
						for(o=0;o<temp2->year[m]->stream[n]->no_grp;o++)
							for(p=0;p<temp2->year[m]->stream[n]->group[o]->no_tch;p++)
							{
								if(!strcmp(node1->group[i]->teacher[j],temp2->year[m]->stream[n]->group[o]->teacher[p]))
									return 0;
							}
					}
				}
	
	
	for(i=0;i<node2->no_grp;i++)
		for(j=0;j<node2->group[i]->no_tch;j++)
			for(m=0;m<no_year;m++)
				for(n=0;n<no_strm;n++)
				{
					if(temp1->year[m]->stream[n]->avbl==0)
						continue;
					else
					{
						for(o=0;o<temp1->year[m]->stream[n]->no_grp;o++)
							for(p=0;p<temp1->year[m]->stream[n]->group[o]->no_tch;p++)
							{
								if(!strcmp(node2->group[i]->teacher[j],temp1->year[m]->stream[n]->group[o]->teacher[p]))
									return 0;
							}
					}
				}

	


	return 1;
}

void swap1 (STREAM1 *node1, STREAM1 *node2)
{
	STREAM1 *temp;
	temp=(STREAM1 *)malloc(sizeof(STREAM1));

	temp->avbl=node1->avbl;				//copy(temp,node1);
	//temp->sibling=node1->sibling;
	//strcpy(temp->sub,node1->sub);
	//strcpy(temp->teacher,node1->teacher);
	temp->upLink=node1->upLink;
	temp->group=node1->group;
	//temp->y=node1->y;

	node1->avbl=node2->avbl;				//copy(node1,node2)
	//node1->sibling=node2->sibling;
	//strcpy(node1->sub,node2->sub);
	//strcpy(node1->teacher,node2->teacher);
	node1->upLink=node2->upLink;
	node1->group=node2->group;
	//node1->y=node2->y;

	node2->avbl=temp->avbl;				//copy(node2,temp)
	//node2->sibling=temp->sibling;
	//strcpy(node2->sub,temp->sub);
	//strcpy(node2->teacher,temp->teacher);
	node2->upLink=temp->upLink;
	node2->group=temp->group;
	//node2->y=temp->y;
}

void set_prac_prob(WEEK *root)
{
	int i,j,k,l,e;
	
	for(i=0;i<no_slot;i++)
		for(j=0;j<10&&slotdb[i][j]!=-1;j++)
		{
			for(e=0;e<6;e++)
				for(k=0;k<no_year;k++)
					for(l=0;l<no_strm;l++)
					{	
						root->day[e]->prd[slotdb[i][j]-1]->year[k]->stream[l]->prac_prob=1;
					}
		}
}

void prac_impose(WEEK *root,WEEK1 *root1)
{
	int i,j,k,l,m;

	for(i=0;i<6;i++)
		for(j=0;j<no_slot;j++)
			for(k=0;k<no_year;k++)
				for(l=0;l<no_strm;l++)
				{
					for(m=0;m<10&&slotdb[j][m]!=-1;m++)
					{
						if(root1->day1[i]->slot[j]->year[k]->stream[l]->avbl==1)
						{
							root->day[i]->prd[slotdb[j][m]-1]->year[k]->stream[l]->prac_avbl=1;
							root->day[i]->prd[slotdb[j][m]-1]->year[k]->stream[l]->d=i;
							root->day[i]->prd[slotdb[j][m]-1]->year[k]->stream[l]->grup=root1->day1[i]->slot[j]->year[k]->stream[l]->group;
							root->day[i]->prd[slotdb[j][m]-1]->year[k]->stream[l]->no_grup=root1->day1[i]->slot[j]->year[k]->stream[l]->no_grp;
						}	
					}
				}
}

void check_teacher3(DAY *day,DISEASED *root)
{
	
	int i,j,k,l,m,o,w,x,y,z,c;
	int n=0;
	int p=0;
	STREAM* node1,*node2;
	




	for (i=0;i<no_per;i++) {
		for (j=0;j<no_year;j++) {
			for (k=j;k<no_year;k++) {
				for (l=0;l<no_strm;l++) {

					

					if(j==k)
						o=l+1;
					else
						o=0;

					for (m=o;m<no_strm;m++) {

						node1=day->prd[i]->year[j]->stream[l];
						node2=day->prd[i]->year[k]->stream[m];
						c=0;

						if(node1->prac_avbl==0 && node2->prac_avbl==0)
						{
							if(!strcmp(node1->teacher,node2->teacher))
								c=1;
						}
						else if(node1->prac_avbl==0&&node2->prac_avbl==1)
						{
							for(w=0;w<node2->no_grup;w++)
								for(x=0;x<node2->grup[w]->no_tch;x++)
									if(!strcmp(node1->teacher,node2->grup[w]->teacher[x]))
										c=1;
						}
						else if(node1->prac_avbl==1 && node2->prac_avbl==0)
						{
							for(w=0;w<node1->no_grup;w++)
								for(x=0;x<node1->grup[w]->no_tch;x++)
									if(!strcmp(node1->grup[w]->teacher[x],node2->teacher))
										c=1;
						}
						else if(node1->prac_avbl==1 && node2->prac_avbl==1)
						{
							for(w=0;w<node1->no_grup;w++)
								for(x=0;x<node1->grup[w]->no_tch;x++)
									for(y=0;y<node2->no_grup;y++)
										for(z=0;z<node2->grup[y]->no_tch;z++)
											if(!strcmp(node1->grup[w]->teacher[x],node2->grup[y]->teacher[z]))
												c=1;
						}

						

						if (c==1){
	
							if(node_check(day->prd[i]->year[j]->stream[l],root->clss[j]->stream[l])) 
							{
								root->clss[j]->stream[l]->no_nd++;
								p=root->clss[j]->stream[l]->no_nd;
								root->clss[j]->stream[l]->tchr=(STREAM **)realloc(root->clss[j]->stream[l]->tchr,(p)*sizeof(STREAM *));
								root->clss[j]->stream[l]->tchr[p-1]=day->prd[i]->year[j]->stream[l];
							}
	
	
							if(node_check(day->prd[i]->year[k]->stream[m],root->clss[k]->stream[m]))
							{
								root->clss[k]->stream[m]->no_nd++;
								n=root->clss[k]->stream[m]->no_nd;
								root->clss[k]->stream[m]->tchr=(STREAM **)realloc(root->clss[k]->stream[m]->tchr,(n)*sizeof(STREAM *));
								root->clss[k]->stream[m]->tchr[n-1]=day->prd[i]->year[k]->stream[m];
							}
						}
					}
				}
			}
		}
	}

	leaf_count(root);
	printf("in the check teacher");
}

void swap_check3 (DISEASED *root, WEEK *root1, SYLLABUS *db) {
	STRM *temp;
	STREAM *node;int w,x,y,z,e;
	for (int i=0;i<no_year;i++) {
		for (int j=0;j<no_strm;j++) {
			printf("\n");
			temp=root->clss[i]->stream[j];
			int len = temp->no_nd;
			for (int l=0;l<len;l++) {

				printf("new node ");
				int c=0,pr,da,st,yr;

				st=temp->tchr[l]->s;
				yr=temp->tchr[l]->upLink->y;

				pr=temp->tchr[l]->upLink->upLink->p;
				da=temp->tchr[l]->d;
				for(int m=0;m<no_year;m++)
					for(int n=0;n<no_strm;n++)
					{
						if(!(yr==m&&st==n))
						{
							c=0;
							node=root1->day[da]->prd[pr]->year[m]->stream[n];
							
							if(temp->tchr[l]->prac_avbl==0)
							{
								if(node->prac_avbl==0)
								{
									if(!strcmp(root1->day[da]->prd[pr]->year[m]->stream[n]->teacher,temp->tchr[l]->teacher))
										c=1;
								}
								else if(node->prac_avbl==1)
								{
									for(w=0;w<node->no_grup;w++)
										for(x=0;x<node->grup[w]->no_tch;x++)
											if(!strcmp(node->grup[w]->teacher[x],temp->tchr[l]->teacher))
												c=1;
								}
							}
							else if(temp->tchr[l]->prac_avbl==1)
							{
								if(node->prac_avbl==0)
								{
									for(w=0;w<temp->tchr[l]->no_grup;w++)
										for(x=0;x<temp->tchr[l]->grup[w]->no_tch;x++)
											if(!strcmp(node->teacher,temp->tchr[l]->grup[w]->teacher[x]))
												c=1;
								}
								else if(node->prac_avbl==1)
								{
									for(w=0;w<temp->tchr[l]->no_grup;w++)
										for(x=0;x<temp->tchr[l]->grup[w]->no_tch;x++)
											for(y=0;y<node->no_grup;y++)
												for(z=0;z<node->grup[y]->no_tch;z++)
													if(!strcmp(node->grup[y]->teacher[z],temp->tchr[l]->grup[w]->teacher[x]))
														c=1;
								}
							}												
						}
					}


				if(c==1)
				{


				
					for (int e=0;e<6;e++) {

						for (int k=0;k<no_per;k++) {
							c=0;
							//if(root1->day[e]->prd[k]->year[i]->stream[j]->prac_prob=0)
							//continue;

								printf("%d %d\t",root->clss[i]->stream[j]->tchr[l]->d,e);
								node=root1->day[e]->prd[k]->year[i]->stream[j];

								if(temp->tchr[l]->prac_avbl==0)
								{
									if(node->prac_avbl==0)
										c=check1(temp->tchr[l],node,db);
									else if(node->prac_avbl==1)
										c=check_th_pr(temp->tchr[l],node,db);
								}
								else if(temp->tchr[l]->prac_avbl==1)
								{
									if(node->prac_avbl==0)
										c=check_th_pr(node,temp->tchr[l],db);
									else
										c=check_pr_pr(node,temp->tchr[l]);
								}


								if (c==1) {
									printf("lll");
									getch();

									if(node->prac_avbl==0&&temp->tchr[l]->prac_avbl)
										swap(temp->tchr[l], root1->day[e]->prd[k]->year[i]->stream[j]);
									else
										swap_xtrm(temp->tchr[l],root1->day[e]->prd[k]->year[i]->stream[j]);

									//temp->tchr[l]->check=1;
									//root1->day[e]->prd[k]->year[i]->stream[j]->check=1;
									goto a;
							}
						}
					}
				}
a:;
			}
		}
	}
}

int check_th_pr(STREAM* node1,STREAM *node2, SYLLABUS *db)
{
	int pr1,pr2, slt1, slt2,d1,d2,y1,y2,strm1,strm2,i,j,k,m,l,n,o;
	DAY *temp1, *temp2;
	slt1=slt2=0;

	temp1=node1->upLink->upLink->upLink;
	temp2=node2->upLink->upLink->upLink;
	
	if(node1->prac_prob==0)
		return 0;

	pr1=node1->upLink->upLink->p;
	pr2=node2->upLink->upLink->p;

	d1=node1->upLink->upLink->upLink->d;
	d2=node2->upLink->upLink->upLink->d;

	y1=node1->upLink->y;
	y2=node2->upLink->y;

	strm1=node1->s;
	strm2=node2->s;


	for(i=0;i<no_slot;i++) {
		for(j=0;j<10&&slotdb[i][j]!=-1;j++) {
			if(slotdb[i][j]==(pr1+1))
				slt1=i;
		}
	}

	for(i=0;i<no_slot;i++) {
		for(j=0;j<10&&slotdb[i][j]!=-1;j++) {
			if(slotdb[i][j]==(pr2+1))
				slt2=i;
		}
	}

	



	for(i=0;i<10&&slotdb[slt2][i]!=-1;i++)
	{
		for(j=0;j<no_year;j++)
		{
			for(k=0;k<no_strm;k++)
			{
				if(temp2->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->prac_avbl==0)
				{
					if(!strcmp(temp2->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->teacher,temp1->prd[slotdb[slt1][i]-1]->year[y1]->stream[strm1]->teacher))
						return 0;
				}
				else if(temp2->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->prac_avbl==1)
				{
					for(l=0;l<temp2->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->no_grup;l++)
						for(m=0;m<temp2->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->grup[l]->no_tch;m++)
						{
							if(!strcmp(temp2->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->grup[l]->teacher[m],temp1->prd[slotdb[slt1][i]-1]->year[y1]->stream[strm1]->teacher))
								return 0;
						}
				}
			}
		}
	}

	for (i=0;i<10&&slotdb[slt1][i]!=-1;i++) {
		for(j=0;j<no_year;j++)
		{
			for(k=0;k<no_strm;k++)
			{
				if(temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->prac_avbl==0)
				{
					for(l=0;l<temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->no_grup;l++)
						for(m=0;m<temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->grup[l]->no_tch;m++)
						{
							if(!strcmp(temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->teacher,temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->grup[l]->teacher[m]))
								return 0;
						}
				}
				else if(temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->prac_avbl==1)
				{
					for(l=0;l<temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->no_grup;l++)
						for(m=0;m<temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->grup[l]->no_tch;m++)
							for(n=0;n<temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->no_grup;n++)
								for(o=0;o<temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->grup[n]->no_tch;o++)
								{
									if (!strcmp(temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->grup[n]->teacher[o],temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->grup[l]->teacher[m]))
										return 0;
								}
				}
			}
		}
	}

	for(i=0;i<db->clas[y1]->nw[strm1]->no_sub;i++)
		if(!(strcmp(node1->sub,db->clas[y1]->nw[strm1]->subs[i]->sub)))
			break;

	int s1=i;

	if(node1->d!=node2->d)
	{
		if(db->clas[y2]->nw[strm2]->subs[s1]->s_weight[node2->d]>=db->clas[y2]->nw[strm2]->max_sub)
			return 0;
	
		
		db->clas[y1]->nw[strm1]->subs[s1]->s_weight[node1->d]--;
		db->clas[y2]->nw[strm2]->subs[s1]->s_weight[node2->d]++;
	
	}


	return 1;
}

int check_pr_pr(STREAM* node1,STREAM *node2)
{
	int pr1,pr2, slt1, slt2,d1,d2,y1,y2,strm1,strm2,i,j,k,m,l,n,o;
	DAY *temp1, *temp2;
	slt1=slt2=0;

	temp1=node1->upLink->upLink->upLink;
	temp2=node2->upLink->upLink->upLink;
	
	if(node1->prac_prob==0)
		return 0;

	pr1=node1->upLink->upLink->p;
	pr2=node2->upLink->upLink->p;

	d1=node1->upLink->upLink->upLink->d;
	d2=node2->upLink->upLink->upLink->d;

	y1=node1->upLink->y;
	y2=node2->upLink->y;

	strm1=node1->s;
	strm2=node2->s;


	for(i=0;i<no_slot;i++) {
		for(j=0;j<10&&slotdb[i][j]!=-1;j++) {
			if(slotdb[i][j]==(pr1+1))
				slt1=i;
		}
	}

	for(i=0;i<no_slot;i++) {
		for(j=0;j<10&&slotdb[i][j]!=-1;j++) {
			if(slotdb[i][j]==(pr2+1))
				slt2=i;
		}
	}

	for (i=0;i<10&&slotdb[slt1][i]!=-1;i++) {
		for(j=0;j<no_year;j++)
		{
			for(k=0;k<no_strm;k++)
			{
				if(temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->prac_avbl==0)
				{
					for(l=0;l<temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->no_grup;l++)
						for(m=0;m<temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->grup[l]->no_tch;m++)
						{
							if(!strcmp(temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->teacher,temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->grup[l]->teacher[m]))
								return 0;
						}
				}
				else if(temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->prac_avbl==1)
				{
					for(l=0;l<temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->no_grup;l++)
						for(m=0;m<temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->grup[l]->no_tch;m++)
							for(n=0;n<temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->no_grup;n++)
								for(o=0;o<temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->grup[n]->no_tch;o++)
								{
									if (!strcmp(temp1->prd[slotdb[slt1][i]-1]->year[j]->stream[k]->grup[n]->teacher[o],temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2]->grup[l]->teacher[m]))
										return 0;
								}
				}
			}
		}
	}

	for (i=0;i<10&&slotdb[slt2][i]!=-1;i++) {
		for(j=0;j<no_year;j++)
		{
			for(k=0;k<no_strm;k++)
			{
				if(temp1->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->prac_avbl==0)
				{
					for(l=0;l<temp2->prd[slotdb[slt1][i]-1]->year[y2]->stream[strm2]->no_grup;l++)
						for(m=0;m<temp2->prd[slotdb[slt1][i]-1]->year[y2]->stream[strm2]->grup[l]->no_tch;m++)
						{
							if(!strcmp(temp1->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->teacher,temp2->prd[slotdb[slt1][i]-1]->year[y2]->stream[strm2]->grup[l]->teacher[m]))
								return 0;
						}
				}
				else if(temp1->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->prac_avbl==1)
				{
					for(l=0;l<temp2->prd[slotdb[slt1][i]-1]->year[y2]->stream[strm2]->no_grup;l++)
						for(m=0;m<temp2->prd[slotdb[slt1][i]-1]->year[y2]->stream[strm2]->grup[l]->no_tch;m++)
							for(n=0;n<temp1->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->no_grup;n++)
								for(o=0;o<temp1->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->grup[n]->no_tch;o++)
								{
									if (!strcmp(temp1->prd[slotdb[slt2][i]-1]->year[j]->stream[k]->grup[n]->teacher[o],temp2->prd[slotdb[slt1][i]-1]->year[y2]->stream[strm2]->grup[l]->teacher[m]))
										return 0;
								}
				}
			}
		}
	}

	return 1;
}


void swap_xtrm(STREAM *node1,STREAM *node2)
{
	int pr1,pr2,slt1, slt2,d1,d2,y1,y2,strm1,strm2,i,j;
	DAY *temp1, *temp2;
	STREAM *nd1,*nd2,*nd3;
	slt1=slt2=0;

	temp1=node1->upLink->upLink->upLink;
	temp2=node2->upLink->upLink->upLink;
	
	/*if(node1->prac_prob==0)
		return*/

	pr1=node1->upLink->upLink->p;
	pr2=node2->upLink->upLink->p;

	d1=node1->upLink->upLink->upLink->d;
	d2=node2->upLink->upLink->upLink->d;

	y1=node1->upLink->y;
	y2=node2->upLink->y;

	strm1=node1->s;
	strm2=node2->s;

	nd3=(STREAM*)malloc(sizeof(STREAM));


	for(i=0;i<no_slot;i++) {
		for(j=0;j<10&&slotdb[i][j]!=-1;j++) {
			if(slotdb[i][j]==(pr1+1))
				slt1=i;
		}
	}

	for(i=0;i<no_slot;i++) {
		for(j=0;j<10&&slotdb[i][j]!=-1;j++) {
			if(slotdb[i][j]==(pr2+1))
				slt2=i;
		}
	}

	for(i=0;i<10&&slotdb[slt1][i]!=-1;i++)
	{
		nd1=temp1->prd[slotdb[slt1][i]-1]->year[y1]->stream[strm1];
		nd2=temp2->prd[slotdb[slt2][i]-1]->year[y2]->stream[strm2];

		nd3->d=nd1->d;
		nd3->grup=nd1->grup;
		nd3->no_grup=nd1->no_grup;
		nd3->prac_avbl=nd1->prac_avbl;
		strcpy(nd3->sub,nd1->sub);
		strcpy(nd3->teacher,nd1->teacher);

		nd1->d=nd2->d;
		nd1->grup=nd2->grup;
		nd1->no_grup=nd2->no_grup;
		nd1->prac_avbl=nd2->prac_avbl;
		strcpy(nd1->sub,nd2->sub);
		strcpy(nd1->teacher,nd2->teacher);


		nd2->d=nd3->d;
		nd2->grup=nd3->grup;
		nd2->no_grup=nd3->no_grup;
		nd2->prac_avbl=nd3->prac_avbl;
		strcpy(nd2->sub,nd3->sub);
		strcpy(nd2->teacher,nd3->teacher);
	}
}


























						












	












