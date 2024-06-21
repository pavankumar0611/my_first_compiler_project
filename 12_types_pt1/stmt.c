#include "defs.h"
#include "data.h"
#include "decl.h"

static struct ASTnode *single_statement(void);

static struct ASTnode *print_statement(void)
{
	struct ASTnode *tree;
	int left_type , right_type;
	int reg;

	match ( T_PRINT , "print");

	tree = binexpr(0);

	left_type = P_INT;
	right_type = tree->type;

	if ( !type_compatible ( &left_type , &right_type , 0))
		fatal ( "incomplete types");

	if (right_type)
		tree = mkastunary ( right_type , P_INT , tree , 0);

	tree = mkastunary ( A_PRINT , P_NONE , tree , 0);

	return ( tree);
}

static struct ASTnode *assignment_statement(void)
{
	struct ASTnode *left , *right , *tree;
	int left_type , right_type;
	int id;

	ident();

	if (( id = findglob ( Text)) == -1)
	{
		fatals ( "undeclared variable " ,Text);
	}

	right = mkastleaf ( A_LVIDENT , Gsym[id].type , id);

	match ( T_ASSIGN , "=");

	left = binexpr(0);

	left_type = left->type;
	right_type = right->type;

	if ( !type_compatible ( &left_type , &right_type , 1))
		fatal ( "Incomplete types");

	if ( left_type)
		left = mkastunary ( left_type , right->type, left , 0);

	tree = mkastnode ( A_ASSIGN , P_INT , left , NULL , right , 0);

	return tree;
}


static struct ASTnode *if_statement(void)
{
	struct ASTnode *condAST , *trueAST , *falseAST = NULL;

	match ( T_IF , "if");
	lparen();

	condAST = binexpr(0);

	if ( condAST->op < A_EQ || condAST->op > A_GE)
		fatal ( "bad comparison operator");
	rparen();

	trueAST = compound_statement();

	if ( Token.token == T_ELSE)
	{
		scan ( &Token);
		falseAST = compound_statement();
	}

	return (mkastnode ( A_IF ,P_NONE , condAST , trueAST , falseAST , 0));
}


static struct  ASTnode *while_statement(void)
{
	struct ASTnode *condAST , *bodyAST;

	match ( T_WHILE , "while");
	lparen();

	condAST = binexpr(0);

	if ( condAST->op < A_EQ || condAST->op > A_GE)
		fatal ( "bad comparison operator");
	rparen();

	bodyAST = compound_statement();

	return ( mkastnode ( A_WHILE , P_NONE , condAST , NULL , bodyAST , 0));
}

static struct ASTnode *for_statement ( void)
{
	struct ASTnode *condAST , *bodyAST ;
	struct ASTnode *preopAST , *postopAST;
	struct ASTnode *tree;

	match ( T_FOR , "for");
	lparen();


	preopAST = single_statement();
	semi();

	condAST = binexpr(0);

	if ( condAST->op < A_EQ || condAST ->op > A_GE )
		fatal( "bad comparison operator");
	semi();

	postopAST = single_statement();
	rparen();

	bodyAST = compound_statement();

	tree = mkastnode ( A_GLUE ,P_NONE , bodyAST , NULL , postopAST , 0);

	tree = mkastnode ( A_WHILE ,P_NONE , condAST , NULL , tree , 0);

	return ( mkastnode ( A_GLUE , P_NONE , preopAST , NULL , tree , 0));
}

static struct ASTnode *single_statement(void)
{
	switch(Token.token)
	{
		case T_PRINT:
			return ( print_statement());

		case T_CHAR:

		case T_INT:
			var_declaration();
			return (NULL);

		case T_IDENT:
			return ( assignment_statement());

		case T_IF:
			return ( if_statement());

		case T_WHILE:
			return ( while_statement());

		case T_FOR:
			return ( for_statement());

		default:
			fatald ( "syntax error , token ", Token.token);
	}
}

struct ASTnode *compound_statement(void)
{
	struct ASTnode *left = NULL;
	struct ASTnode *tree;

	lbrace();

	while(1)
	{
		tree = single_statement();

		if ( tree != NULL && ( tree->op == A_PRINT || tree->op == A_ASSIGN ))
			semi();

		if ( tree != NULL)
		{
			if ( left == NULL)
				left = tree;
			else
				left = mkastnode ( A_GLUE , P_NONE , left , NULL , tree , 0);
		}

		if ( Token.token == T_RBRACE ){
			rbrace();
			return ( left);
		}
	}
}



