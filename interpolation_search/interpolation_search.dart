int interpolationSearch(List list, int n, int x) {
  // Find indexes of two corners
  int lo = 0, hi = (n - 1);

  // Since listay is sorted, an element present
  // in listay must be in range defined by corner
  while (lo <= hi && x >= list[lo] && x <= list[hi]) {
    if (lo == hi) {
      if (list[lo] == x) return lo;
      return -1;
    }
    // Probing the position with keeping
    // uniform distribution in mind.
    int pos =
        (lo + (((hi - lo) / (list[hi] - list[lo])) * (x - list[lo]))).toInt();

    // Condition of target found
    if (list[pos] == x) return pos;

    // If x is larger, x is in upper part
    if (list[pos] < x)
      lo = pos + 1;

    // If x is smaller, x is in the lower part
    else
      hi = pos - 1;
  }
  return -1;
}

main(List<String> args) {
  // List
  List<int> list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int cariNilai = 9;
  int result = interpolationSearch(list, list.length, cariNilai);
  (result == -1)
      ? print('Nilai Tidak Ditemukan')
      : print('Nilai Ditemukan di index $result');
}
