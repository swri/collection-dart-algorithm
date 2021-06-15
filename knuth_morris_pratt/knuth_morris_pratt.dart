void KMPSearch(String pat, String txt) {
  int m = pat.length;
  int n = txt.length;
  List lps = List.filled(m, null);
  computeLPSArray(pat, m, lps);

  int i = 0;
  int j = 0;
  while (i < n) {
    if (pat[j] == txt[i]) {
      j++;
      i++;
    }
    if (j == m) {
      print("Found pattern at index ${i - j} ");
      j = lps[j - 1];
    } else if (i < n && pat[j] != txt[i]) {
      if (j != 0)
        j = lps[j - 1];
      else
        i = i + 1;
    }
  }
}

void computeLPSArray(String pat, int m, List lps) {
  int len = 0;

  lps[0] = 0;

  int i = 1;
  while (i < m) {
    if (pat[i] == pat[len]) {
      len++;
      lps[i] = len;
      i++;
    } else {
      if (len != 0) {
        len = lps[len - 1];
      } else {
        lps[i] = 0;
        i++;
      }
    }
  }
}

void main(List<String> args) {
  String txt = "MUHAMMAD ARIF SUWARI";
  String pat = "AR";
  KMPSearch(pat, txt);
}
