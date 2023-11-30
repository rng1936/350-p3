#include <stdio.h>
/*
Iterate through formatted args passed to histPrint process, inserting line breaks
when BREAK is encountered.
*/
int main(int argc, char *argd[]) { 
    // print
    int histNum = 1;
    for (int i = 1; i < argc; i++) {
        if (!strcmp(argd[i], "empty")) {
            exit();
        }
        if (!strcmp(argd[i], "BREAK")) {
            continue;
        }
        printf(2, "%d. %s", histNum, argd[i]);
        for (int j = i+1; j < argc; j++) {
            if (strcmp(argd[j], "BREAK")) {
                i++;
                printf(2, " ");
                printf(2, argd[j]);
            } else {
                break;
            }
        }
        printf(2, "\n");
        histNum++;
    }
    exit();
}