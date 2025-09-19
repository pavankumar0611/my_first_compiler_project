int printf(char *fmt, ...);

void main()
{
        if ( 5 || 4) {
                printf("%d\n", 1);
                if( -0 || -6){
                        printf("%d\n", 2);
                }if( -1 || -20){
                        printf("%d\n", 3);
                }else{
                        printf("%d\n", 4);

                }
        }
        else{
                printf("%d\n", 5);
        }
}
