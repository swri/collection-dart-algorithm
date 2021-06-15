const d = 256;

void search(String pat, String txt, int q) {
  int m = pat.length;
  int n = txt.length;
  int i, j;
  int p = 0;
  int t = 0;
  int h = 1;
  for (i = 0; i < m - 1; i++) {
    h = (h * d) % q;
  }
  for (i = 0; i < m; i++) {
    p = (d * p + pat.codeUnits[i]).toInt() % q;
    t = (d * t + txt.codeUnits[i]).toInt() % q;
  }
  for (i = 0; i <= n - m; i++) {
    if (p == t) {
      for (j = 0; j < m; j++) {
        if (txt[i + j] != pat[j]) break;
      }
      if (j == m) {
        print('Pattern found at index $i');
      }
    }
    if (i < n - m) {
      t = (d * (t - txt.codeUnits[i] * h) + txt.codeUnits[i + m]).toInt() % q;
      if (t < 0) t = (t + q);
    }
  }
}

/* Driver code */
void main() {
  String txt = "MUHAMMAD ARIF SUWARI";
  String pat = "AR";

  // A prime number
  int q = 101;

  // Function Call
  search(pat, txt, q);
}
