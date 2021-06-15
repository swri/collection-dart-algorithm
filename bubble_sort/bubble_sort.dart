void bubbleSort(List<int> list) {
  int n = list.length;
  int i, step;
  for (step = 0; step < n; step++) {
    for (i = 0; i < n - step - 1; i++) {
      //* Ada Disini Ngab
      if (list[i] > list[i + 1]) {
        swap(list, i);
      }
    }
  }
}

swap(List list, int i) {
  int temp = list[i];
  list[i] = list[i + 1];
  list[i + 1] = temp;
}

void main() {
  List<int> list = [8, 10, 7, 9, 3, 2, 4, 1, 5, 6];
  print('Sebelum Sort: $list');
  bubbleSort(list);
  print('Sesudah Sort: $list\n');
}
