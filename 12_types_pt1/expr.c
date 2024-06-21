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

			if ( (Token.intvalue ) >= 0 && (Token.intvalue < 256))
				n = mkastleaf ( A_INTLIT , P_CHAR , Token.intvalue);

			else
				n = mkastleaf ( A_INTLIT , P_INT , Token.intvalue);

			break;

		case T_IDENT:

			id = findglob(Text);

			if ( id == -1)
				fatals ( "Unknown variable", Text);

			n = mkastleaf ( A_IDENT , Gsym[id].type , id);
			break;


		default:
			fatald ( "syntax error , token ", Token.token);

	}

	scan ( &Token);
	return n;
}


static int arithop ( int tokentype)
{
	if ( tokentype > T_EOF && tokentype < T_INTLIT)
		return ( tokentype);

	fatald ( "syntax error , token" , tokentype);
}

static int OpPrec [] = {
	0 , 10 , 10,
	20 , 20,
	30, 30,
	40, 40, 40, 40
};

static int op_precedence ( int tokentype)
{
	int prec = OpPrec [tokentype];

	if ( prec == 0)
		fatald ( "syntax error , token",tokentype);
	return prec;
}

struct ASTnode *binexpr ( int ptp)
{
	struct ASTnode *left , *right;
	int left_type , right_type , tokentype;

	left = primary();

	tokentype = Token.token;

	if ( tokentype == T_SEMI || tokentype == T_RPAREN)
		return left;

	while ( op_precedence ( tokentype) > ptp)
	{
		scan (&Token);

		right = binexpr( OpPrec [ tokentype]);

		left_type = left->type;
		right_type = right->type;

		if ( !type_compatible ( &left_type , &right_type , 0))
			fatal ( "incompatible types");

		if (left_type)
			left = mkastunary ( left_type , right->type, left , 0);

		if ( right_type)
			right = mkastunary ( right_type , left->type , right , 0);

		left = mkastnode ( arithop ( tokentype ) , left->type , left , NULL , right , 0);

		tokentype = Token.token;

		if ( tokentype == T_SEMI || tokentype == T_RPAREN)
			return left;
	}

	return left;
}



