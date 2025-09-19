int printf(char *fmt, ...);

char *str1;
char *str;

int main() {
  for (str1= "People\n"; *str1 != 0; str1= str1 + 1) {
    printf("%c", *str1);
  }
  for (str= "Hello world\n"; *str != 0; str= str + 1) {
    printf("%c", *str);
  }
  return(0);
}
