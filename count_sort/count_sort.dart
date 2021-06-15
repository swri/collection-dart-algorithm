void countingSort(List<String> list) {
  int n = list.length;

  List<String> output = List.filled(n, '');
  List<int> count = List.filled(256, 0);

  for (int i = 0; i < n; i++) {
    ++count[list[i].codeUnitAt(0)];
  }
  for (int i = 1; i < 256; i++) {
    count[i] += count[i - 1];
  }
  for (int i = n - 1; i >= 0; i--) {
    output[count[list[i].codeUnitAt(0)] - 1] = list[i];
    --count[list[i].codeUnitAt(0)];
  }
  for (int i = 0; i < n; ++i) list[i] = output[i];
}

main(List<String> args) {
  List<String> list = ['4', '3', '1', '5', '7', '9'];
  countingSort(list);
  print(list);
}
