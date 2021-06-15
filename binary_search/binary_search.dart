int binarySearch(List<int> list, int l, int r, int x) {
  while (l <= r) {
    int m = l + (r - l) ~/ 2;

    if (list[m] == x) {
      return m;
    }

    if (list[m] < x) {
      l = m + 1;
    } else {
      r = m - 1;
    }
  }

  return -1;
}

main(List<String> args) {
  // List
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int cariNilai = 10;
  int result = binarySearch(list, 0, list.length - 1, cariNilai);
  (result == -1)
      ? print('Nilai Tidak Ditemukan')
      : print('Nilai Ditemukan di index $result');
}
