import 'dart:math';

int jumpSearch(List<int> list, int x, int n) {
  // Finding block size to be jumped
  int step = sqrt(n).toInt();

  // Finding the block where element is
  // present (if it is present)
  int prev = 0;
  while (list[min(step, n) - 1] < x) {
    prev = step;
    step += sqrt(n).toInt();
    if (prev >= n) return -1;
  }

  // Doing a linear search for x in block
  // beginning with prev.
  while (list[prev] < x) {
    prev++;

    // If we reached next block or end of
    // listay, element is not present.
    if (prev == min(step, n)) return -1;
  }
  // If element is found
  if (list[prev] == x) return prev;

  return -1;
}

main(List<String> args) {
  // List
  List<int> list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int cariNilai = 8;
  int result = jumpSearch(list, cariNilai, list.length);
  (result == -1)
      ? print('Nilai Tidak Ditemukan')
      : print('Nilai Ditemukan di index $result');
}
