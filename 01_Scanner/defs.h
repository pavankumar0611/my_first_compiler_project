#include <stdio.h>
#include <string.h>
#include <ctype.h>
#include <stdlib.h>


enum { 
	T_PLUS , T_MINUS , T_STAR , T_SLASH  , T_INTLIT , T_EQUAL , T_DOLLARSIGN 
};

struct token {
	int token;
	int intvalue;
};
