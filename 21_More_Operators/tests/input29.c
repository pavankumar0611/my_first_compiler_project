char *str1;
char *str;

int main() {
  for (str1= "People\n"; *str1 != 0; str1= str1 + 1) {
    printchar(*str1);
  }
  for (str= "Hello world\n"; *str != 0; str= str + 1) {
    printchar(*str);
  }
  return(0);
}
