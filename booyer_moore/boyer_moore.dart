const int char = 256;

int max(int a, int b) => (a > b) ? a : b;

void badStringHeuristic(List<String> str, int size, List<int> badString) {
  for (int i = 0; i < char; i++) {
    badString[i] = -1;
  }
  for (int i = 0; i < size; i++) {
    badString[str[i].codeUnits[0]] = i;
  }
}

void searchBm(List<String> txt, List<String> pat) {
  int m = pat.length;
  int n = txt.length;
  List<int> badString = List.filled(char, 0);

  badStringHeuristic(pat, m, badString);

  int s = 0;

  while (s <= (n - m)) {
    int j = m - 1;
    while (j >= 0 && pat[j] == txt[s + j]) {
      j--;
    }
    if (j < 0) {
      print('Patterns occur at shift : $s');
      if (s + m < n) {
        s += m - badString[txt[s + m].codeUnits[0]];
      } else {
        s += 1;
      }
    } else {
      s += max(1, j - badString[txt[s + j].codeUnits[0]]);
    }
  }
}

main(List<String> args) {
  List<String> txt = "NAMANANAMMANAMAN".split('');
  List<String> pat = "MANAMAN".split('');
  searchBm(txt, pat);
}
