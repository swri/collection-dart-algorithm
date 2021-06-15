int ternarySearch(List<int> list, int l, int r, int x) {
  if (r >= l) {
    int sub = r - l;
    int mid1 = l + sub ~/ 3;
    int mid2 = mid1 + sub ~/ 3;

    // If x is present at the mid1
    if (list[mid1] == x) return mid1;

    // If x is present at the mid2
    if (list[mid2] == x) return mid2;

    // If x is present in left one-third
    if (list[mid1] > x) return ternarySearch(list, l, mid1 - 1, x);

    // If x is present in right one-third
    if (list[mid2] < x) return ternarySearch(list, mid2 + 1, r, x);

    // If x is present in middle one-third
    return ternarySearch(list, mid1 + 1, mid2 - 1, x);
  }
  // We reach here when element is not present in list
  return -1;
}

main(List<String> args) {
  List<int> list = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int search = 4;
  int result = ternarySearch(list, 0, list.length, search);

  (result == -1)
      ? print('Nilai tidak ditemukan')
      : print('Nilai ditemukan pada index $result');
}
