#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

int main(int argc, char **argv) {
  printf("Hello, world!\n");

  FILE *printk = fopen("/proc/sys/kernel/printk", "w");
  if (printk) {
    fprintf(printk, "0 0 0 0\n");
    fclose(printk);
  } else {
    perror("Failed to open /proc/sys/kernel/printk");
  }

  system("/usr/bin/ln -s /usr/lib/libbz2.so /usr/lib/libbz2.so.1.0");

  // fork /bin/bash
  pid_t pid = fork();
  if (pid == 0) {
    // Child process
    execl("/usr/bin/bash", "bash", NULL);
  }

  for (;;)
    ;
}