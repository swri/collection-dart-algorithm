void cycleSort(List list, int n) {
  int writes = 0;
  for (var cycleStart = 0; cycleStart <= n - 2; cycleStart++) {
    int item = list[cycleStart];
    int pos = cycleStart;

    // Find position where we put the item. We basically count all smaller
    // elements on right side of item.
    for (var i = cycleStart + 1; i < n; i++) {
      if (list[i] < item) {
        pos++;
      }
    }
    if (pos == cycleStart) continue;
    while (item == list[pos]) pos += 1;
    if (pos != cycleStart) {
      int temp = item;
      item = list[pos];
      list[pos] = temp;
      writes++;
    }
    // Rotate rest of the cycle
    while (pos != cycleStart) {
      pos = cycleStart;
      for (var i = cycleStart; i < n; i++) {
        if (list[i] < item) pos += 1;
      }
      while (item == list[pos]) pos += 1;

      if (item != list[pos]) {
        int temp = item;
        item = list[pos];
        list[pos] = temp;
        writes++;
      }
    }
  }
  print(writes);
}

main(List<String> args) {
  List<int> list = [1, 8, 3, 9, 10, 10, 2, 4];
  print('Sebelum sort: $list');
  cycleSort(list, list.length);
  print('Sesudah sort: $list');
}
