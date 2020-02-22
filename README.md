Ref: https://stackoverflow.com/questions/5975741/what-is-the-difference-between-ll-and-lr-parsing
Ref: https://web.stanford.edu/class/archive/cs/cs143/cs143.1128/
Ref: https://www.joinc.co.kr/w/Site/Development/Env/Yacc

## Hierarchy or steps
- Lexical analysis (lex, flex, ...)
    - Reads the source code, and generates tokens
    - Each token may have attributes - property like int
    - Regular expression will be converted to NFA then DFA
- Syntax analysis (yacc, bison, ...)
    - Or parsing
    - Build structure using tokens
    - Report errors encoding structures
    - Top down vs Bottom up
- Semantic analysis
- IR generation
- IR optimization
- Code generation
- Optimization


## Parsing
- TOP Down (LL)
    - Begins with just the start symbo
    - Need to guess
- Bottom-up (LR)


## lex or flex file
- Has an extension of *.l (elle), as from lex
```
%{
/* Defintion section
- Variable declaration
- header file here 
*/
%}
%%
/* Rules section
Pattern action
*/
%%
/*
User code may be here
*/
```

## yacc or bison file
- Has an extension of *.y, as from yacc
```
%{
/* C declaration
- Variable declaration
- header file here 
*/
%}
// Bison declaration
%%
/* Bison grammar
Pattern action
*/
%%
/*
User code may be here
*/
```

## Sample flex
- flex is for Lexical analysis
- Ex: Number or word
    - Save as ex2.l
```
%{
#include <stdio.h>
%}

%%
[0123456789]+           printf("NUMBER\n");
[a-zA-Z][a-zA-Z0-9]*    printf("WORD\n");
%%
```
    - Compile as `flex ex2.l; gcc lex.yy.c -o ex2 -lfl`
```
$ ./ex2
abc
WORD

123
NUMBER

abc 123
WORD
 NUMBER

ctr+D
```

