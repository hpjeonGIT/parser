all: word_number


lex.yy.c: word_number.l
	flex word_number.l

word_number: lex.yy.c
	gcc -o word_number lex.yy.c -lfl

clean:
	rm word_number lex.yy.c
