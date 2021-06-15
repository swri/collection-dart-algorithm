int shellSort(List<int> list, int n) {
  for (int gap = n ~/ 2; gap > 0; gap ~/= 2) {
    for (int i = gap; i < n; i += 1) {
      int temp = list[i];
      int j;
      for (j = i; j >= gap && list[j - gap] > temp; j -= gap)
        list[j] = list[j - gap];
      list[j] = temp;
    }
  }
  return 0;
}

void main() {
  List<int> list = [12, 34, 54, 2, 3];
  int n = list.length;

  print('Sebelum sort: $list');
  shellSort(list, n);
  print('Sesudah sort: $list');
}
