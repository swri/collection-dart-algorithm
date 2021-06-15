void selectionSort(List list) {
  if (list.length == 0) return;
  int n = list.length;
  int i, steps;
  for (steps = 0; steps < n; steps++) {
    for (i = steps + 1; i < n; i++) {
      //* Ada Disini Ngab
      if (list[steps] > list[i]) {
        swap(list, steps, i);
      }
    }
  }
}

void swap(List list, int steps, int i) {
  int temp = list[steps];
  list[steps] = list[i];
  list[i] = temp;
}

void main() {
  List<int> list = [8, 10, 7, 9, 3, 2, 4, 1, 5, 6];
  print('Sebelum Sort: $list');
  selectionSort(list);
  print('Sesudah Sort: $list\n');
}
