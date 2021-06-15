// Using Tabulation
int matrixChainOrder(List<int> p, int n) {
  //Generate List in List int
  List<List<int>> m = List.generate(n, (_) => List.filled(n, 0));

  for (int i = 1; i < n; i++) {
    m[i][i] = 0;
  }
  for (int l = 2; l < n; l++) {
    for (int i = 1; i < n - l + 1; i++) {
      int j = i + l - 1;
      m[i][j] = double.maxFinite.toInt();
      for (int k = i; k <= j - 1; k++) {
        int q = m[i][k] + m[k + 1][j] + p[i - 1] * p[k] * p[j];
        if (q < m[i][j]) m[i][j] = q;
      }
    }
  }
  return m[1][n - 1];
}

void main(List<String> args) {
  List<int> list = [1, 2, 3, 4];
  int size = list.length;
  int result = matrixChainOrder(list, size);
  print('Minimum number of multiplications is $result');
}
