%{
  #include<iostream>
  using namespace std;
  int yylex();
  int yyerror(const char*);
%}

%token ID NUM 
%token PLUS MINUS MUL DIV LT LE GT GE EQ NE 
%token NOT OR AND TRUE FALSE
%token FOR DO WHILE 
%token INT FLOAT CHAR 
%token CONTINUE BREAK
%token MAIN OPEN CLOSE POPEN PCLOSE SCOLON COMMA

%left COMMA
%left OR AND
%left GT LT LE GE EQ NE
%left PLUS MINUS
%left MUL DIV
%right EXPO  
%nonassoc UMINUS
%left NOT

%%   

prog:
    MAIN POPEN PCLOSE comp_stmt 
    ;

comp_stmt:
    OPEN statements CLOSE
    ;

statements:
    statement statements
    |   
    ;

statement:
    decl SCOLON
    |   BREAK SCOLON 
    |   CONTINUE SCOLON
    |   iteration_statement
    |   assignment SCOLON 
    |   updation SCOLON 
    ;

decl:
    type id_list 
    ;

decls:
    decls decl
    |   decl
    |   assignments
    ;    

id_list:
    id_list COMMA ID
    |   ID
    ;

type:
    INT
    ;

assignment:
    id_list EQ expression
    |   updation
    ;

assignments:
    assignment COMMA assignments
    |   assignment
    ;

loop_body: 
    OPEN statements CLOSE
    |   statement
    ;  

expression:
    expression PLUS expression
    |   expression MINUS expression
    |   expression MUL expression
    |   expression DIV expression
    |   expression EXPO expression
    |   expression LT expression
    |   expression GT expression
    |   expression LE expression
    |   expression GE expression
    |   expression EQ EQ expression
    |   expression NE expression
    |   expression OR expression
    |   expression AND expression
    |   PLUS PLUS expression
    |   MINUS MINUS expression
    |   ID 
    |   NUM
    |   POPEN expression PCLOSE
    ;

updation:
    expression PLUS EQ expression
    |   expression MINUS EQ expression
    |   PLUS PLUS expression
    |   expression PLUS PLUS
    |   MINUS MINUS expression
    |   expression MINUS MINUS
    ;

condition:
    expression LT expression
    |   expression GT expression
    |   expression LE expression
    |   expression GE expression
    |   expression EQ EQ expression
    |   expression NE expression
    |   expression OR expression
    |   expression AND expression
    |   condition COMMA condition 
    |   TRUE
    |   FALSE
    ; 

iteration_statement: 
    WHILE POPEN condition PCLOSE loop_body 
    |    DO loop_body WHILE POPEN condition PCLOSE SCOLON
    |    FOR POPEN SCOLON SCOLON PCLOSE loop_body
    |    FOR POPEN SCOLON SCOLON assignments PCLOSE loop_body
    |    FOR POPEN SCOLON condition SCOLON PCLOSE loop_body
    |    FOR POPEN decls SCOLON SCOLON PCLOSE loop_body
    |    FOR POPEN SCOLON condition SCOLON assignments PCLOSE loop_body
    |    FOR POPEN decls SCOLON SCOLON assignments PCLOSE loop_body
    |    FOR POPEN decls SCOLON condition SCOLON PCLOSE loop_body
    |    FOR POPEN decls SCOLON condition SCOLON assignments PCLOSE loop_body
    ;

%%

int main(int argc, char* argv[]) 
{
	extern FILE *yyin;
    FILE *fh;
    yyin = fopen(argv[1], "r");
    yyparse();
    cout<<"0"<<endl;
    return 0;
} 

int yyerror(const char* s)
{ 
  cout<<"1"<<endl;
  exit(0);
}
