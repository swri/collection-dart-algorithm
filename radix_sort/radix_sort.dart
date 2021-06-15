int getMax(List<int> list, int n) {
  int mx = list[0];
  for (int i = 0; i < n; i++)
    if (list[i] > mx) {
      mx = list[i];
    }
  return mx;
}

void countSort(List<int> list, int n, int exp) {
  int i;
  List<int> output = List.filled(n, 0);
  List count = List.filled(10, 0);

  for (i = 0; i < n; i++) {
    count[(list[i] ~/ exp % 10)]++;
  }
  for (i = 1; i < 10; i++) {
    count[i] += count[i - 1];
  }
  for (i = n - 1; i >= 0; i--) {
    output[count[(list[i] ~/ exp) % 10] - 1] = list[i];
    count[(list[i] ~/ exp) % 10]--;
  }
  for (i = 0; i < n; i++) {
    list[i] = output[i];
  }
}

void radixsort(List<int> list, int n) {
  int m = getMax(list, n);
  int exp;
  for (exp = 1; m ~/ exp > 0; exp *= 10) {
    countSort(list, n, exp);
  }
}

void main() {
  List<int> list = [170, 45, 75, 90, 802, 24, 2, 66];
  int n = list.length;
  print('Sebelum sort: $list');
  radixsort(list, n);
  print('Seseudah sort: $list');
}
