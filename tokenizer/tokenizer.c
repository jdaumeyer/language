#include <stdio.h>

int main() {

    char filename[13] = "testcode.txt";

    //open file attempt
    FILE * FP;
    FP = fopen(filename,"r");
    if (fgetc(FP) == EOF) {
        printf("Error reading file %s",filename);
        return 0;
    }

    //determine file size and copy to memory
    fseek(FP, 0L, SEEK_END);
    int fileLength = ftell(FP);
    rewind(FP);
    char text[fileLength];
	
	while(sizeof(text) < fileLength) {
		char line[50];
		fgets(line, fileLength, FP);
		strcat(text,line);
	}
    printf("File Length: %i chars\n\n", fileLength);
    printf ("File Contents: \n%s", text);
    fclose(FP);
    
}