%{
#include <cstdio>
#include <iostream>
#include <vector>
#include <string>
//#include "codegen.h"
#include <FlexLexer.h>
#include <fstream>
#include <list>
using namespace std;

int yylex(void);
extern void yyerror(string);


extern "C" FILE *yyin;

//debug definitions
static void trace(string,int);
#define DEBUG 1
#if DEBUG
static int debugLevel = 3;
#endif 

#define trace1(s) trace(s, 1)
#define trace2(s) trace(s, 2)

//globals
yyFlexLexer lexer; //this is our lexer
%}

%token STMT

%union
{
    char*	string;
    int 	integer;
}

%start program

%%
//we support just lines of instructions as of now. Lets support functions and macros later
program: program statementList 
	|
	;
statementList: STMT;
%%

void yyerror(string s) {
    fprintf(stderr, "%s\n", s.c_str());
}

int yywrap (void ) {
	return 1;
}


static void trace(string s, int level){
#if DEBUG
	if(level >= debugLevel)
		printf("%s",s.c_str());
#endif
}

int yylex(void){
	return lexer.yylex();
}

int ParseFile(char *filename){ //This should some datastructure which can be emitted to a binary code
	ifstream fp;
	fp.open(filename, ios::in);
	lexer.yyrestart(&fp);
	yyparse();
	return 1;
}
