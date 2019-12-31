%{
#include<stdio.h>
int c=0;
%}

%s newstate
%%
\".*\" {ECHO;}

"/*"                    {yymore();BEGIN newstate;}
 <newstate>.      {yymore();BEGIN newstate;}
 <newstate>\n       {yymore();BEGIN newstate;}
 <newstate>"*/"  {c++;fprintf(yyout," ");BEGIN 0;}
<INITIAL>"//".*    {c++; fprintf(yyout," ");}
%%
main()
{
	yyin = fopen("in.c","r");
	yyout = fopen("out.c","w");
	yylex();
	printf("No.of Comments=%d \n",c);

}
