all: just_parse


lex.yy.c: parser.l
	flex parser.l

parser.tab.c parser.tab.h: parser.y
	bison -d parser.y


just_parse: lex.yy.c parser.tab.c
	sed -i '1i #include <vector>' parser.tab.h
	sed -i '2i #include <string>' parser.tab.h
	g++ -g -std=c++14 -o just_parse main.cpp lex.yy.c  parser.tab.c -lfl

clean:
	rm just_parse lex.yy.c parser.tab.c parser.tab.h
