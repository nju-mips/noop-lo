#include <cstdio>
#include <cstdlib>
#include <cstring>

int main(int argc, char *argv[]) {
  if (argc != 3) {
    fprintf(stderr, "Please give two files to diff\n");
    exit(1);
  }
  FILE *f1 = fopen(argv[1], "r");
  FILE *f2 = fopen(argv[2], "r");
  if (!f1 || !f2) {
    fprintf(stderr, "Can not open file\n");
    exit(1);
  }
  char l1_buf[4096], l2_buf[4096];
  int cnt = 0;
  while (true) {
    cnt += 1;
    char *l1 = fgets(l1_buf, 4096, f1);
    char *l2 = fgets(l2_buf, 4096, f2);
    if ((!l1 && l2) || (l1 && !l2) || (l1 && l2 && strcmp(l1, l2))) {
      printf("\x1b[31m Differ at line %d\x1b[0m\n", cnt);
      exit(1);
    }
    if (!l1 || !l2)
      break;
  }
  fclose(f1);
  fclose(f2);
  return 0;
}
