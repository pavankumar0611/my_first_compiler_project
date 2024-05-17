pratt: expr.c interp.c main.c scan.c tree.c
	cc -o pratt -g expr.c interp.c main.c scan.c tree.c

parser2: expr2.c interp.c main.c scan.c tree.c
	cc -o parser2 -g expr2.c interp.c main.c scan.c tree.c
clean:
	rm -f pratt parser2 *.o

test: pratt
	-(./pratt input01; \
		./pratt input02; \
		./pratt input03; \
		./pratt input04; \
		./pratt input05)

test2: parser2
	-(./parser2 input01; \
		./parser2 input02; \
		./parser2 input03; \
		./parser2 input04; \
		./parser2 input05)
