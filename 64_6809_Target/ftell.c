#include <stdio.h>

int main() {
    FILE *fp = fopen("data.bin", "wb");

    // Write 10 bytes: 0, 1, 2, ..., 9
    for (int i = 0; i < 10; i = i+2) {
        fputc(i, fp);
    }

    fclose(fp);
    
    // Reopen for reading
    fp = fopen("data.bin", "rb");

    printf("Reading file:\n");

    for (int i = 0; i < 10; i++) {
        long pos = ftell(fp);  // get current position
        int val = fgetc(fp);   // read one byte
        printf("Byte read: %d at offset %ld\n", val, pos);
    }

    fclose(fp);
    return 0;
}

