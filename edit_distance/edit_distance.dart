import 'dart:math';

void EditDistDP(String str1, String str2) {
  int len1 = str1.length;
  int len2 = str2.length;

  List<List<int>> dp = List.generate(2, (_) => List.filled(len1 + 1, 0));
  for (int i = 0; i <= len1; i++) {
    dp[0][i] = i;
  }
  for (int i = 1; i <= len2; i++) {
    for (int j = 0; j <= len1; j++) {
      if (j == 0)
        dp[i % 2][j] = i;
      else if (str1.codeUnitAt(j - 1) == str2.codeUnitAt(i - 1)) {
        dp[i % 2][j] = dp[(i - 1) % 2][j - 1];
      } else {
        dp[i % 2][j] = 1 +
            min(dp[(i - 1) % 2][j],
                min(dp[i % 2][j - 1], dp[(i - 1) % 2][j - 1]));
      }
    }
  }

  print('${dp[len2 % 2][len1]}');
}

void main(List<String> args) {
  // count Different betwen string
  String str1 = "intention";
  String str2 = "execution";
  EditDistDP(str1, str2);
}
