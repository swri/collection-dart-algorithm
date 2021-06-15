void gnomeSort(List list) {
  int length = list.length;
  if (length == 0) return;
  int first = 1;
  int second = 2;

  while (first < length) {
    //* Ada Disini Ngab
    if (list[first - 1] <= list[first]) {
      first = second;
      second++;
    } else {
      int temp = list[first - 1];
      list[first - 1] = list[first];
      list[first] = temp;
      first -= 1;
      if (first == 0) {
        first = 1;
        second = 2;
      }
    }
  }
}

void main() {
  List<int> list = [8, 10, 7, 9, 3, 2, 4, 1, 5, 6];
  print('Sebelum Sort: $list');
  gnomeSort(list);
  print('Sesudah Sort: $list\n');
}
