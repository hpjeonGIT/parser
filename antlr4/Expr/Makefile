.SUFFIXES: .o .cpp

all: calc

OBJS = ExprBaseListener.o ExprLexer.o ExprListener.o ExprParser.o
SRCS = ExprBaseListener.cpp ExprBaseListener.h ExprLexer.cpp ExprLexer.h \
	ExprLexer.interp ExprLexer.tokens ExprListener.cpp ExprListener.h \
	ExprParser.cpp ExprParser.h Expr.tokens Expr.interp

ExprBaseListener.cpp: Expr.g4
	java -Xmx500M -cp /home/hpjeon/sw_local/antlr4/antlr-4.8-complete.jar \
         org.antlr.v4.Tool -Dlanguage=Cpp Expr.g4 

ExprBaseListener.o: ExprBaseListener.cpp
	g++ -std=c++11 -c  $<  -I/home/hpjeon/sw_local/antlr4/antlr4-runtime
ExprLexer.o: ExprLexer.cpp
	g++ -std=c++11 -c  $<  -I/home/hpjeon/sw_local/antlr4/antlr4-runtime
ExprListener.o: ExprListener.cpp
	g++ -std=c++11 -c  $<  -I/home/hpjeon/sw_local/antlr4/antlr4-runtime
ExprParser.o: ExprParser.cpp
	g++ -std=c++11 -c  $<  -I/home/hpjeon/sw_local/antlr4/antlr4-runtime

calc: ${OBJS}
	g++ -std=c++11 -c main.cpp -I/home/hpjeon/sw_local/antlr4/antlr4-runtime
	g++ -std=c++11 -o calc main.o ${OBJS} \
	/home/hpjeon/sw_local/antlr4/lib/libantlr4-runtime.a 

clean:
	rm ${OBJS} calc ${SRCS} main.o
