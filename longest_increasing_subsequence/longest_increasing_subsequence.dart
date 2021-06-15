int lis(List<int> arr, int n) {
  List<int> lis = List.filled(n, 1);
  int i, j, max = 0;

  for (i = 1; i < n; i++)
    for (j = 0; j < i; j++)
      if (arr[i] > arr[j] && lis[i] < lis[j] + 1) lis[i] = lis[j] + 1;

  /* Pick maximum of all LIS values */
  for (i = 0; i < n; i++) if (max < lis[i]) max = lis[i];

  return max;
}

void main(List<String> args) {
  List<int> arr = [10, 22, 9, 33, 21, 50, 41, 60];
  int n = arr.length;
  print('Length of lis is ${lis(arr, n)}');
}
