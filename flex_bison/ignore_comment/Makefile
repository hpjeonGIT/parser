all: just_parse


lex.yy.c: simple.l
	flex simple.l

simple.tab.c simple.tab.h: simple.y
	bison -d simple.y


just_parse: lex.yy.c simple.tab.c
	g++ -o just_parse main.cpp lex.yy.c  simple.tab.c -lfl

clean:
	rm just_parse lex.yy.c simple.tab.c simple.tab.h
