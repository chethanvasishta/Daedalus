%option noyywrap
%{
//#include "codegen.h"
#include "y.tab.hh"
#include <stdio.h>
%}

%% 

"mov" return STMT;

[ \t]+ ;
%%

