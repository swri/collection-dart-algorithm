void pigeonholeSort(List<int> list, int n) {
  int min = list[0];
  int max = list[0];
  int range, i, j;
  int index = 0;

  for (int a = 0; a < n; a++) {
    if (list[a] > max) max = list[a];
    if (list[a] < min) min = list[a];
  }
  range = max - min + 1;
  List<int> phole = List.filled(range, 0);

  for (i = 0; i < n; i++) phole[i] = 0;
  for (i = 0; i < n; i++) phole[list[i] - min]++;

  for (j = 0; j < range; j++) {
    while (phole[j]-- > 0) list[index++] = j + min;
  }
}

main(List<String> args) {
  List<int> list = [9, 3, 2, 7, 4, 6, 8];
  print('Sebelum sort: $list');
  pigeonholeSort(list, list.length);
  print('Sesudah sort: $list');
}
