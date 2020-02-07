#include <cstdio>
#include <stdarg.h>
#include <cstdlib>

void app_error(const char *fmt, ...) {
  va_list args;
  va_start(args, fmt);
  vfprintf(stderr, fmt, args);
  va_end(args);
  exit(1);
}
