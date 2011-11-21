cc = g++
all: main lexer parser
	$(cc) *.o -lfl -o Daedalus
main:
	$(cc) -c *.cpp
parser:
	yacc -d parser.y -o y.tab.cc && $(cc) -c y.tab.cc -o parser.o
lexer: parser
	flex -+ lexer.l && $(cc) -c lex.yy.cc -o lexer.o

debug: maind
	$(cc) *.o -o DaedalusD
maind:
	$(cc) -g -c *.cpp 
parserd:
	yacc -d parser.y -o y.tab.cc && $(cc) -g -c y.tab.cc -o parser.o
lexerd: parserd
	flex -+ lexer.l && $(cc) -g -c lex.yy.cc -o lexer.o

clean:
	rm -rf *.o Daedalus DaedalusD
