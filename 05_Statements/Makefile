comp1: cg.c expr.c gen.c main.c misc.c scan.c stmt.c tree.c
	gcc -o comp1 -g cg.c expr.c gen.c main.c misc.c scan.c stmt.c tree.c

compn: cgn.c expr.c gen.c main.c misc.c scan.c stmt.c tree.c
	gcc -o compn -g cgn.c expr.c gen.c main.c misc.c scan.c stmt.c tree.c

clean:
	rm -f comp1 compn *.o *.s out

test: comp1 input01
	./comp1 input01
	gcc -o out out.s
	./out

testn: compn input01
	./compn input01
	nasm -f elf64 out.s
	gcc -no-pie -o out out.o
	./out
