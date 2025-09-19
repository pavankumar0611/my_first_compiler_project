#include <stdio.h>

void main()
{
        int x= 0;
        switch (x)
        {
                case 1:
                case 2: x = 2;
                                break;
                default:
                                x = 3;
        }
}
