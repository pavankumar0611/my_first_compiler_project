SRCS= cg.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
      sym.c tree.c types.c

SRCN= cgn.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
      sym.c tree.c types.c

ARMSRCS= cg_arm.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
	 sym.c tree.c types.c

comp1: $(SRCS)
	gcc -o comp1 -g -Wall $(SRCS)

compn: $(SRCN)
	gcc -o compn -g $(SRCN)

comparm: $(ARMSRCS)
	gcc -o comparm -g -Wall $(ARMSRCS)

clean:
	rm -f comp1 comparm compn *.o *.s out

test: comp1 tests/runtests
	(cd tests; chmod +x runtests; ./runtests)

armtest: comparm tests/runtestarm
	(cd tests; chmod +x runtestarm; ./runtestarm)

testn: compn tests/runtestsn
	(cd tests; chmod +x runtestsn; ./runtestsn)

outfiles:comp1 tests/mktests
	(cd tests; chmod +x mktests ; ./mktests)


test17: comp1 tests/input14 lib/printint.c
	./comp1 tests/input14
	gcc -o out out.s lib/printint.c
	./out

#made changes to compile arm assembly using below command.bcoz currently gcc supports from armv8 .Since we were generating armv6 assembky instructions. 
armtest17: comparm tests/input14 lib/printint.c
	./comparm tests/input14
	arm-linux-gnueabi-gcc -o out out.s lib/printint.c -static
	qemu-arm-static ./out

test20n: compn tests/input20 lib/printint.c
	./compn tests/input14
	nasm -f elf64 out.s
	gcc -no-pie -o out lib/printint.c out.o
	./out


