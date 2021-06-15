void flip(List<int> list, int n) {
  int temp;
  int start = 0;
  while (start < n) {
    temp = list[start];
    list[start] = list[n];
    list[n] = temp;
    start++;
    n--;
  }
}

int findMaks(List<int> list, int n) {
  int mi = 0;
  for (int i = 0; i < n; ++i) {
    if (list[i] > list[mi]) {
      mi = i;
    }
  }
  return mi;
}
void pancakeSort(List<int> list, int n) {
  for (int currSize = n; currSize > 1; --currSize) {
    int mi = findMaks(list, currSize);
    if (mi != currSize - 1) {
      flip(list, mi);
      flip(list, currSize - 1);
    }
  }
}

void main(List<String> args) {
  List<int> list = [23, 10, 20, 11, 12, 6, 7];
  print('Sebelum sort: $list');

  pancakeSort(list, list.length);
  print('Sesudah sort: $list');
}
