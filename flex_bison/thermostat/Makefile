all: thermo

therm.tab.c therm.tab.h: therm.y
	bison -d therm.y

lex.yy.c: therm.l therm.tab.h
	flex therm.l

thermo: lex.yy.c therm.tab.c therm.tab.h
	gcc -o thermo therm.tab.c lex.yy.c

clean:
	rm thermo therm.tab.c therm.tab.h lex.yy.c
