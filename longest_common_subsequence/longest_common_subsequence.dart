int lcs(List<String> x, List<String> y, int m, int n) {
  List<List<int>> l = List.generate(m + 1, (_) => List.filled(n + 1, 0));

  for (int i = 0; i <= m; i++) {
    for (int j = 0; j <= n; j++) {
      if (i == 0 || j == 0)
        l[i][j] = 0;
      else if (x[i - 1] == y[j - 1])
        l[i][j] = l[i - 1][j - 1] + 1;
      else
        l[i][j] = max(l[i - 1][j], l[i][j - 1]);
    }
  }
  return l[m][n];
}

/* Utility function to get max of 2 integers */
int max(int a, int b) => (a > b) ? a : b;

void main(List<String> args) {
  String s1 = "muhammad arif suwari";
  String s2 = "arif";

  List<String> x = s1.split('');
  List<String> y = s2.split('');
  int m = x.length;
  int n = y.length;

  print('Length of LCS is ${lcs(x, y, m, n)}');
}
