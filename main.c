#include <unistd.h>

int main(int argc, char **argv) {
  write(1, "Hello, World!\n", 14);

  // fork /bin/sh
  pid_t pid = fork();
  if (pid == 0) {
    // Child process
    execl("/bin/sh", "sh", NULL);
  }

  for (;;)
    ;
}