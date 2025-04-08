#include <stdio.h>

int x;
int y= 3;

void  main() {
  x= y != 3 ? 6 : 8;
  printf("%d\n", x);

  x = y <= 3 ? 6 : 8;
  printf("%d\n", x);

  x = y >= 3 ? 6 : 8;
  printf("%d\n",x);

  x = y > 3 ? 6 : 8;
  printf("%d\n", x);

  x = y < 3 ? 6 : 8;
  printf("%d\n", x);

  x = y == 3 ? 6 : 8;
  printf("%d\n", x);
}
