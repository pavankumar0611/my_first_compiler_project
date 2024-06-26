#include "defs.h"
#include "data.h"
#include "decl.h"

void print_statement(void)
{
	struct ASTnode *tree;
	int reg;

	match(T_PRINT, "print");

	tree = binexpr(0);
	reg = genAST(tree , -1);
	genprintint(reg);
	genfreeregs();

	semi();
}

void assignment_statement(void)
{
	struct ASTnode *left , *right, *tree;
	int id ;

	ident();

	if(( id = findglob ( Text )) == -1)
	{
		fatals( "undeclared variable " , Text);
	}

	right = mkastleaf (A_LVIDENT , id);

	match (T_EQUALS, "=");

	left = binexpr(0);

	tree = mkastnode (A_ASSIGN , left , right , 0);

	genAST (tree , -1);
	genfreeregs();


	semi();
}

void statements (void)
{
	while(1)
	{
		switch ( Token.token)
		{
			case T_PRINT:
				print_statement();
				break;

			case T_INT:
				var_declaration();
				break;

			case T_IDENT:
				assignment_statement();
				break;

			case T_EOF:
				return;

			default:
				fatald ( "syntax error , token ", Token.token);
		}
	}
}


