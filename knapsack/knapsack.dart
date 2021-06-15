int max(int a, int b) {
  return (a > b) ? a : b;
}

int knapSack(int w, List<int> wt, List<int> val, int n) {
  if (n == 0 || w == 0) return 0;
  if (wt[n - 1] > w) {
    return knapSack(w, wt, val, n - 1);
  } else {
    return max(val[n - 1] + knapSack(w - wt[n - 1], wt, val, n - 1),
        knapSack(w, wt, val, n - 1));
  }
}

main() {
  List<int> value = [6, 10, 12, 13];
  List<int> weight = [2, 4, 6, 7];
  int w = 11;

  print('${knapSack(w, weight, value, value.length)}');
}
