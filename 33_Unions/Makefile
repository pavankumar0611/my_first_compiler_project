HSRCS= data.h decl.h defs.h

SRCS= cg.c decl.c expr.c gen.c main.c misc.c scan.c stmt.c \
      sym.c tree.c types.c

cwj: $(SRCS) $(HSRCS)
	gcc -o cwj -g -Wall $(SRCS)

clean:
	rm -f cwj  *.o *.s out a.out

