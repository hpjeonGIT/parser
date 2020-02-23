all: just_parse


lex.yy.c: parser.l
	flex parser.l

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y


just_parse: lex.yy.c parser.tab.c
	g++ -o just_parse main.cpp lex.yy.c  parser.tab.c -lfl

clean:
	rm just_parse lex.yy.c parser.tab.c parser.tab.h
