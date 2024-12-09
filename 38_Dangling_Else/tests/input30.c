int printf(char *fmt);

void main() {
	printf("%d\n", 5 && 5);
	printf("%d\n", -5 && 8);
	printf("%d\n", -0 && -0);
	printf("%d\n", 22 && -0);
	printf("%d\n", 0 && 0);

	int a;int b;
	a = 5;
	b = 15;

	while(a &&  b) {
		printf("%d\n", 5);
		a = a -1;
		b = b -1;
	}

}

