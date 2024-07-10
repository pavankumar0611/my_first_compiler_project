SRCS= cg.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
	sym.c tree.c types.c

SRCN= cgn.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
	sym.c tree.c types.c

ARMSRCS= cg_arm.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
	sym.c tree.c types.c

comp1: $(SRCS)
	cc -o comp1 -g -Wall $(SRCS)

compn: $(SRCN)
	cc -o compn -g $(SRCN)

comparm: $(ARMSRCS)
	cc -o comparm -g -Wall $(ARMSRCS)

clean:
	rm -f comp1 comparm compn *.o *.s out

test: comp1 tests/runtests
	(cd tests; chmod +x runtests; ./runtests)

armtest: comparm tests/runtestarm
	(cd tests; chmod +x runtestarm; ./runtestarm)

testn: compn tests/runtestsn
	(cd tests; chmod +x runtestsn; ./runtestsn)

test14: comp1 tests/input14 lib/printint.c
	./comp1 tests/input14
	gcc -o out out.s lib/printint.c
	./out

#made changes to compile arm assembly using below command.bcoz currently gcc supports from armv8 .Since we were generating armv6 assembky instructions. 
armtest14: comparm tests/input14 lib/printint.c
	./comparm tests/input14
	 arm-linux-gnueabi-gcc -o out out.s lib/printint.c -static
	 qemu-arm-static ./out

test14n: compn tests/input14 lib/printint.c
	./compn tests/input14
	nasm -f elf64 out.s
	gcc -no-pie -o out lib/printint.c out.o
	./out
