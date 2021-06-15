List naiveSearch(String text, String path) {
  int m = path.length;
  int n = text.length;
  List<int> result = [];
  for (int i = 0; i <= n - m; i++) {
    int j;
    for (j = 0; j < m; j++) {
      if (text[i + j] != path[j]) {
        break;
      }
    }
    if (j == m) {
      result.add(i);
    }
  }
  if (result.length != 0) {
    return result;
  }
  return [-1];
}

main(List<String> args) {
  String txt = "MUHAMMAD ARIF SUWARI";
  String pat = "AR";
  List result = naiveSearch(txt, pat);

  for (var item in result) {
    (result == -1)
        ? print('Hasil tidak ditemukan')
        : print('Pattern found at Index ${item}');
  }
}
