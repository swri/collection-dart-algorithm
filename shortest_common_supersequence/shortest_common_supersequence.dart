import 'dart:math';

int superSeq(String x, String y, int m, int n) {
  if (m == 0) return n;
  if (n == 0) return m;

  if (x.codeUnitAt(m - 1) == y.codeUnitAt(n - 1))
    return 1 + superSeq(x, y, m - 1, n - 1);

  return 1 + min(superSeq(x, y, m - 1, n), superSeq(x, y, m, n - 1));
}

// Driver code
void main(List<String> args) {
  String x = "AGGTAB";
  String y = "GXTXAYB";
  print(
      'Length of the shortest supersequence is: ${superSeq(x, y, x.length, y.length)}');
}
