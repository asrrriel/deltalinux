#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

int main(int argc, char **argv) {
    if(getpid() == 1) { // gigahack init system
        pid_t pid = fork();
        if (pid == 0) {
            // Child process
            execl("/usr/bin/bash", "bash", NULL);
        }
        while(1);
    }

    if(argc <= 1) {
        printf("usage: ralsei <command> [args]\n");
        printf("available commands: install\n");
        return 1;
    }

    if(strcmp(argv[1], "install") == 0) {
        if(argc <= 2) {
            printf("usage: ralsei install <pkg_file> [-r <root>]\n");
            return 1;
        }
        char* pkg_file = argv[2];
        char* root = "/";
        if(argc > 3){ // TODO: PROPER ARGUMENT PARSING
            if(strcmp(argv[3], "-r") == 0) {
                if(argc <= 4) {
                    printf("error: no root specified after -r\n");
                    printf("usage: ralsei install <pkg_file> -r <root>\n");
                    return 1;
                }
                root = argv[4];
            }
        }
        printf("installing \"%s\" to \"%s\"\n", pkg_file, root);
        char cmd[4096];

        sprintf(cmd, "tar -xvf %s -C %s 2>&1", pkg_file, root);

        printf("%s\n", cmd);
        system(cmd);

    } else {
        printf("unknown command: %s\n", argv[1]);
    }

    return 0; 
}