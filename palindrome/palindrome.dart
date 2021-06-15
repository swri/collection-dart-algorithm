int minPalPartion(String str) {
  int n = str.length;

  List<int> c = List.filled(n, 0);
  List<List<bool>> p = List.generate(n, (_) => List.filled(n, false));

  int i, j, l;

  for (i = 0; i < n; i++) {
    p[i][i] = true;
  }

  for (l = 2; l <= n; l++) {
    for (i = 0; i < n - l + 1; i++) {
      j = i + l - 1;
      if (l == 2)
        p[i][j] = (str[i] == str[j]);
      else
        p[i][j] = (str[i] == str[j]) && p[i + 1][j - 1];
    }
  }

  for (i = 0; i < n; i++) {
    if (p[0][i] == true)
      c[i] = 0;
    else {
      c[i] = double.maxFinite.toInt();
      for (j = 0; j < i; j++) {
        if (p[j + 1][i] == true && 1 + c[j] < c[i]) c[i] = 1 + c[j];
      }
    }
  }

  return c[n - 1];
}

void main() {
  String str = "ababbbabbababa";

  print('Min cuts needed for Palindrome Partitioning is ${minPalPartion(str)}');
}
