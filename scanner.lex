%{
#include "output.hpp"
#include "parser.tab.hpp"
using namespace output;
%}

%option yylineno
%option noyywrap

%%

void                        return VOID;
int                         return INT;
byte                        return BYTE;
b                           return B;
bool                        return BOOL;
const                       return CONST;
and                         return AND;
or                          return OR;
not                         return NOT;
true                        return TRUE;
false                       return FALSE;
return                      return RETURN;
if                          return IF;
else                        return ELSE;
while                       return WHILE;
break                       return BREAK;
continue                    return CONTINUE;
;                           return SC;
,                           return COMMA;
\(                          return LPAREN;
\)                          return RPAREN;
\{                          return LBRACE;
\}                          return RBRACE;
=                           return ASSIGN;
==|!=|\<|\>|\<=|\>=         return RELOP;
\+|\-|\*|\/                 return BINOP;
[a-zA-Z][a-zA-Z0-9]*        return ID;
0|[1-9][0-9]*               return NUM;
"([^\n\r\"\\]|\\[rnt"\\])+" return STRING;

/* Whitespaces */
[\t\r\n ]                   ;
\/\/[^\r\n]*(\r|\n|\r\n)?   ;

/* Error */
.                           {errorLex(yylineno); exit(1);}

%%
