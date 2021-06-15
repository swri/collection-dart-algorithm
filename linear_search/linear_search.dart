linearSearch(List list, int length, int search) {
  for (int i = 0; i < length; i++) {
    if (list[i] == search) {
      return i;
    }
  }
  return -1;
}

main(List<String> args) {
  // List
  List<int> list = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  int cariNilai = 9;
  int result = linearSearch(list, list.length, cariNilai);
  (result == -1)
      ? print('Nilai Tidak Ditemukan')
      : print('Nilai Ditemukan di index $result');
}
