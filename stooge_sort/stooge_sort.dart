void stoogeSort(List<int> a, int i, int j) {
  int t;
  if (i >= j) {
    return;
  }
  if (a[j] < a[i]) {
    // swap value
    int temp = a[j];
    a[j] = a[i];
    a[i] = temp;
  }
  if (j - i > 1) {
    t = (j - i + 1) ~/ 3;
    stoogeSort(a, i, (j - t));
    stoogeSort(a, (i + t), j);
    stoogeSort(a, i, j - t);
  }
}

void main(List<String> args) {
  List<int> nums = [1, 4, 5, 3, -6, 3, 7, 10, -2, -5, 7, 5, 9, -3, 7];
  print('Sebelum sort: $nums');
  stoogeSort(nums, 0, nums.length - 1);
  print('Sesudah sort: $nums');
}
