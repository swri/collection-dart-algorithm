void searchZ(String txt, String pattern) {
  String concat = pattern + '#' + txt;

  int l = concat.length;

  List<int> z = List.filled(l, 0);

  getZlist(concat, z);

  for (int i = 0; i < l; ++i) {
    if (z[i] == pattern.length) {
      print('Pattern found at index ${i - pattern.length - 1}');
    }
  }
}

void getZlist(String str, List<int> z) {
  int n = str.length;
  int l = 0;
  int r = 0;

  for (int i = 1; i < n; ++i) {
    if (i > r) {
      l = r = i;

      while (r < n && str.codeUnits[r - l] == str.codeUnits[r]) {
        r++;
      }
      z[i] = r - l;
      r--;
    } else {
      int k = i - l;
      if (z[k] < r - i + 1) {
        z[i] = z[k];
      } else {
        l = i;
        while (r < n && str.codeUnits[r - l] == str.codeUnits[r]) {
          r++;
        }
        z[i] = r - l;
        r--;
      }
    }
  }
}

void main(List<String> args) {
  String text = "Muhammad Arif Suwari";
  String pattern = "Suw";

  searchZ(text, pattern);
}
