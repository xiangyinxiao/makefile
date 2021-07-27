#include "config.h"
#include "add.h"
#include "sub.h"


int main()
{
	int a,b;
	a=6;
	b=3;

#if CONFIG_TEST_FUN1
	sub(a,b);
#endif

#if CONFIG_TEST_FUN2
	add(a,b);
#endif
}


