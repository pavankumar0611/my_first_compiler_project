comp1: cg.c expr.c gen.c interp.c main.c scan.c tree.c
	gcc -o comp1 -g cg.c expr.c gen.c interp.c main.c scan.c tree.c

compn: cgn.c expr.c gen.c interp.c main.c scan.c tree.c
	gcc -o compn -g cgn.c expr.c gen.c interp.c main.c scan.c tree.c

clean:
	rm -f comp1 compn *.o *.s out

test: comp1
	./comp1 input01
	gcc -o out out.s
	./out
	./comp1 input02
	gcc -o out out.s
	./out

testn: compn
	./compn input01
	nasm -f elf64 out.s
	gcc -no-pie -o out out.o
	./out
	./compn input02
	nasm -f elf64 out.s
	gcc -no-pie -o out out.o
	./out
