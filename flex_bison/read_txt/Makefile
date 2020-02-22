all: just_read


lex.yy.c: simple.l
	flex simple.l

just_read: lex.yy.c
	g++ -o just_read main.cpp lex.yy.c -lfl

clean:
	rm just_read lex.yy.c
