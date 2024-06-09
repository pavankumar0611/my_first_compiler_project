#include "defs.h"
#include "data.h"
#include "decl.h"


static struct ASTnode *primary(void)
{
	struct ASTnode *n;

	int id;

	switch ( Token.token)
	{
		case T_INTLIT:
			n= mkastleaf ( A_INTLIT , Token.intvalue);
			break;

		case T_IDENT:
			id = findglob ( Text);

			if ( id == -1)
				fatals ( "unknown variable" , Text);

			n = mkastleaf ( A_IDENT , id);
			break;

		default:
			fatald ( "syntax error token ", Token.token);
	}

	scan ( &Token);
	return (n);
}


static int arithop ( int tokentype)
{
	if ( tokentype > T_EOF && tokentype < T_INTLIT)
		return ( tokentype);

	fatald ( "syntax error ,token ", tokentype);
}

static int OpPrec [] = {
	0 , 10 , 10 ,
	20 , 20,
	30 , 30, 
	40 , 40 , 40 , 40 
};

static int op_precedence ( int tokentype){
	int prec = OpPrec [ tokentype];

	if ( prec == 0)
		fatald ( "syntax error , token " , tokentype);
	return (prec);
}

struct ASTnode *binexpr (int ptp)
{
	struct ASTnode *left , *right;
	int tokentype;

	left = primary();

	tokentype = Token.token;

	if ( tokentype == T_SEMI || tokentype == T_RPAREN)
		return (left);

	while ( op_precedence ( tokentype ) > ptp) {

		scan ( &Token);

		right = binexpr ( OpPrec [tokentype]);

		left = mkastnode ( arithop (tokentype) , left , NULL , right , 0);

		tokentype = Token.token;

		if ( tokentype == T_SEMI || tokentype == T_RPAREN)
			return  (left);
	}


	return (left);
}
