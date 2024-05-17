first = cg.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c sym.c tree.c
second = cgn.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c sym.c tree.c

first: $(first)
	gcc -o first -g $(first)

second: $(second)
	gcc -o second -g $(second)

clean:
	rm -f first second *.o *.s out

test: first input01 input02
	./first input01
	gcc -o out out.s
	./out
	./first input02
	gcc -o out out.s
	./out

testn: second input01 input02
	./second input01
	nasm -f elf64 out.s
	gcc -no-pie -o out out.o
	./out
	./second input02
	nasm -f elf64 out.s
	gcc -no-pie -o out out.o
	./out
