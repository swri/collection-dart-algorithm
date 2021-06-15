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

int exponentialSearch(List<int> list, int n, int x) {
  // mengecek jika nilai x muncul di awal
  if (list[0] == x) return 0;

  int i = 1;
  while (i < n && list[i] <= x) i = i * 2;

  //  panggil binary search untuk mencari range
  return binarySearch(list, 0, n - 1, x);
}

main() {
  // List
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int cariNilai = 7;
  int result = exponentialSearch(list, list.length, cariNilai);
  (result == -1)
      ? print('Nilai Tidak Ditemukan')
      : print('Nilai Ditemukan di index $result');
}
