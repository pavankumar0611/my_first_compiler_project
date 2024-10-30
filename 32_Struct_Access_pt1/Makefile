HSRCS= data.h decl.h defs.h

SRCS= cg.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
      sym.c tree.c types.c

SRCN= cgn.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
      sym.c tree.c types.c

ARMSRCS= cg_arm.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
	 sym.c tree.c types.c

cwj: $(SRCS) $(HSRCS)
	gcc -o cwj -g -Wall $(SRCS)

cwjarm: $(ARMSRCS) $(HSRCS)
	gcc -o cwjarm -g -Wall $(ARMSRCS)

clean:
	rm -f cwj cwjparm compn *.o *.s out a.out

test: cwj tests/runtests
	(cd tests; chmod +x runtests; ./runtests)

armtest: cwjarm tests/runtestarm
	(cd tests; chmod +x runtestarm; ./runtestarm)


outfiles:comp1 tests/mktests
	(cd tests; chmod +x mktests ; ./mktests)
