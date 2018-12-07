# Parser-for-C-statements
This is a yacc program to parse C expressions and iterative statements.
.i.e. check if the inputted code snippet is syntactically correct or not

Input file
----------
The input.txt file contains the code snippet which have to be verified against the parser.

Output format
-------------
0 - Inputted snippet is syntactically correct
1 - Inputted snippet is syntactically incorrect
   
Running the tests
-----------------
To run the lex program
  
1. Go the directory where the file is present.
2. To build the lex program, type make into the terminal.
3. The lex program has now been built and the executable file parser is ready.
4. To run the executable file, type
   ./parser input.txt
5. To remove the unnecessary files, type make remove into the terminal.
