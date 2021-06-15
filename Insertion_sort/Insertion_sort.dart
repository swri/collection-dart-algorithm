void insertionSort(List list) {
  if (list.length == 0) return;
  int n = list.length;
  int temp, i, j;

  for (i = 1; i < n; i++) {
    temp = list[i];
    j = i - 1;
    //* Ada Disini Ngab
    while (j >= 0 && temp < list[j]) {
      list[j + 1] = list[j];
      --j;
    }
    list[j + 1] = temp;
  }
}

void main() {
  List<int> list = [8, 10, 7, 9, 3, 2, 4, 1, 5, 6];
  print('Sebelum Sort: $list');
  insertionSort(list);
  print('Sesudah Sort: $list\n');
}