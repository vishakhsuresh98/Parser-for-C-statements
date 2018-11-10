%{
   #include<iostream>
   using namespace std;
   #include "y.tab.h"
%}

ALPHA [A-Za-z]

DIGIT [0-9]

US "_"

SPACE " "

PREPROCESSOR "#"|"#line"|"#undef"|"#error"|"#elif"|"#else"|"#endif"|"#if"|"#define"|"#include"|"#pragma"|"#ifndef"|"#ifdef"

%%

{PREPROCESSOR}.*"\n" ;

"/*"[^*]*"*/""\n"|"/*"[^/]*"*/""\n" {   
        /* Handles those multiline comments that end on a line with no valid c command after "/" */
		//cin.ignore();
    }

"/*"[^*]*"*/"|"/*"[^/]*"*/" {   
        /* Handles those multiline comments that end on a line with valid c command after "/". 
 		Then we do not ignore the rest of the line after / */
		//cin.ignore();
    }

\/\/.*"\n"  {   
        /* Handles single line comments. There can be no valid c statement after // */
		//cin.ignore();
    }

{SPACE} {yytext=NULL;}	/* ignore white space */
"\n" {}

"int main"|"void main"  return MAIN;

"int" return INT;
"float" return FLOAT;
"char" return CHAR;

"for" return FOR;
"while" return WHILE;
"do" return DO;

"{" return OPEN;
"}" return CLOSE;
"(" return POPEN;
")" return PCLOSE;
"," return COMMA;
";" return SCOLON;
"break" return BREAK;
"continue" return CONTINUE;

"+" return PLUS;
"-" return MINUS;
"*" return MUL;
"/" return DIV;
"^" return EXPO;
"<" return LT;
"<=" return LE;
">" return GT;
">=" return GE;
"!=" return NE;
"=" return EQ;

"||" return OR;
"&&" return AND;
"!" return NOT;
"true" return TRUE;
"false" return FALSE;

[-]?{DIGIT}+  return NUM;
({ALPHA}|{US})({ALPHA}|{DIGIT}|{US})*  return ID;

. {}

%%
