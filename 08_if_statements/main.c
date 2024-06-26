#include "defs.h"
#define extern_ 
#include "data.h"
#undef extern_
#include "decl.h"
#include <errno.h>


static void init()
{
	Line++;
	Putback = '\n';
}

static void usage ( char *prog)
{
	fprintf ( stderr , "usage : %s infile \n", prog);
	exit(1);
}

void main(int argc , char *argv[])
{
	struct ASTnode *tree;

	if( argc != 2)
		usage(argv[0]);

	init();


	if ((Infile = fopen ( argv[1] , "r" )) == NULL)
	{
		fprintf ( stderr , "unable to open %s:%s\n", argv[1] ,strerror (errno));
		exit(1);
	}

	if ((Outfile = fopen ("out.s" , "w" )) == NULL)
	{
		fprintf ( stderr , "Unable to create out.s : %s\n", strerror (errno));
		exit(1);
	}

	scan ( &Token);
	genpreamble();
	tree = compound_statement();
	genAST(tree , NOREG , 0);
	genpostamble();
	fclose (Outfile);
	exit(0);
}

