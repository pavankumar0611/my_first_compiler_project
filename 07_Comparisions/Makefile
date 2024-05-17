SRCS= cg.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c sym.c tree.c
SRCN= cgn.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c sym.c tree.c

first: $(SRCS)
	gcc -o comp1 -g $(SRCS)

second: $(SRCN)
	gcc -o compn -g $(SRCN)

clean:
	rm -f comp1 compn *.o *.s out

test: first input04
	./comp1 input04
	gcc -o out out.s
	./out

testn: second input04
	./compn input04
	nasm -f elf64 out.s
	gcc -no-pie -o out out.o
	./out
