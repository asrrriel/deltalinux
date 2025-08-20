#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv) {
    if(getpid() == 1) { // gigahack init system
        pid_t pid = fork();
        if (pid == 0) {
            // Child process
            execl("/usr/bin/bash", "bash", NULL);
        }
        while(1);
    }

    printf("Baaaaa!");

    return 0; 
}