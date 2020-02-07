#include <fstream>
#include <array>
#include <queue>
#include <iostream>
#include <cstring>


int main(int argc, const char *argv[]) {
  if(argc != 3) {
	printf("please specify two file names\n");
	return 0;
  }

  // printf("open %s and %s\n", argv[1], argv[2]);
  std::ifstream lhs(argv[1]), rhs(argv[2]);

  constexpr int N = 15;

  std::array<std::array<char, 100>, N> lhs_lines, rhs_lines;

  std::size_t lines = 0;
  while(lhs.good() && rhs.good()) {
	auto no = lines % N;
	lhs.getline(&lhs_lines[no][0], lhs_lines[no].size());
	rhs.getline(&rhs_lines[no][0], rhs_lines[no].size());

	lines ++;

	if(strcmp(&lhs_lines[no][0], &rhs_lines[no][0]) != 0) {
	  if(lines >= N) {
		int count = N - 1;
		for(auto i = (no + 1) % N; i != no; i = (i + 1) % N) {
		  printf("<same:%lu>: %s\n", lines - count, &lhs_lines[i][0]);
		  count --;
		}
	  } else {
		for(auto i = 0u; i + 1 < lines; i++) {
		  printf("<same:%u>: %s\n", i + 1, &lhs_lines[i][0]);
		}
	  }

	  printf("<diff:%lu>: %s\n", lines, &lhs_lines[no][0]);
	  printf("<diff:%lu>: %s\n", lines, &rhs_lines[no][0]);
	  break;
	}
  }

  return 0;
}
