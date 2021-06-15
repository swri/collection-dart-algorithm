class Exchange {
  late List<int> data;
  late int n;
  Exchange(List<int> list) {
    this.data = list;
    n = data.length;
  }

  void swap(int a, int b) {
    int temp = data[b];
    data[b] = data[a];
    data[a] = temp;
  }

  void exchangeSort() {
    for (var i = 0; i < n - 1; i++) {
      for (var j = i + 1; j < n; j++) {
        if (data[i] > data[j]) {
          swap(i, j);
        }
      }
    }
    print(data);
  }
}
void main(List<String> args) {
  List<int> list = [12, 34, 54, 2, 3];
  print(list);
  Exchange e = Exchange(list);

  e.exchangeSort();
}
