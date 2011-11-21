cc = g++
all: main
	$(cc) *.o -o Daedalus
main:
	$(cc) -c *.cpp

debug: maind
	$(cc) *.o -o DaedalusD
maind:
	$(cc) -g -c *.cpp 
clean:
	rm -rf *.o Daedalus DaedalusD
