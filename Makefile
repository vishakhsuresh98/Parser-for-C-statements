CC = g++ -std=c++11

all: y.tab.c lex.yy.c y.tab.h
	$(CC) y.tab.c lex.yy.c -ll -ly -o parser
lex.yy.c: program.l
	lex program.l
y.tab.c: program.y
	yacc -v -d program.y
clean:
	rm parser 
	rm y.tab.c 
	rm lex.yy.c 
	rm y.tab.h 
	rm y.output
