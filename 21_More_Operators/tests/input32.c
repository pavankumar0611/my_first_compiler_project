void main() {
        printint(5 && 5);
        printint(-5 && 8);
        printint(-0 && -0);
        printint(22 && -0);
        printint(0 && 0);

        int a, b;
        a = 5;
        b = -5;

        while(a || b) {
                printint(5);
                a = a -1;
		b = b + 1;
	}

}
