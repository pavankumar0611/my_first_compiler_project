SRCS= cg.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c sym.c tree.c types.c
SRCN= cgn.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c sym.c tree.c types.c

comp1: $(SRCS)
	gcc -o comp1 -g $(SRCS)

compn: $(SRCN)
	gcc -o compn -g $(SRCN)

clean:
	rm -f comp1 compn *.o *.s out

test: comp1 tests/runtests
	(cd tests; chmod +x runtests; ./runtests)

test10: comp1 tests/input10
	./comp1 tests/input10
	gcc -o out out.s
	./out

testn: compn tests/runtestsn
	(cd tests; chmod +x runtestsn; ./runtestsn)

test10n: compn tests/input10
	./compn tests/input10
	nasm -f elf64 out.s
	gcc -no-pie -o out out.o
	./out
