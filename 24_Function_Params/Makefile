HSRCS= data.h decl.h defs.h

SRCS= cg.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
      sym.c tree.c types.c

SRCN= cgn.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
      sym.c tree.c types.c

ARMSRCS= cg_arm.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
	 sym.c tree.c types.c

comp1: $(SRCS) $(HSRCS)
	gcc -o comp1 -g -Wall $(SRCS)

comparm: $(ARMSRCS) $(HSRCS)
	gcc -o comparm -g -Wall $(ARMSRCS)

clean:
	rm -f comp1 comparm compn *.o *.s out

test: comp1 tests/runtests
	(cd tests; chmod +x runtests; ./runtests)

armtest: comparm tests/runtestarm
	(cd tests; chmod +x runtestarm; ./runtestarm)


outfiles:comp1 tests/mktests
	(cd tests; chmod +x mktests ; ./mktests)
