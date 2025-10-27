#include <stdio.h>
#include <stdlib.h>

void print_idxfile(const char *filename) {
    FILE *fp = fopen(filename, "rb");
    if (!fp) {
        perror("Error opening file");
        return;
    }

    long offset;  // Match how your code reads it
    int id = 0;

    while (fread(&offset, sizeof(long), 1, fp) == 1) {
        printf("ID %d => Offset: %ld (0x%08lX)\n", id, offset, offset);
        id++;
    }

    fclose(fp);
}

int main(int argc, char *argv[]) {
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <idxfile>\n", argv[0]);
        return 1;
    }

    print_idxfile(argv[1]);
    return 0;
}

