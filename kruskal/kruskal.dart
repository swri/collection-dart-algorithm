class Kruskal {
  late int e;
  List<List<int>> graphM = [];
  List<List<int>> result = [];

  getResult() {
    return result;
  }

  Kruskal(List<List<int>> list) {
    this.graphM = list;
  }

  find(List parent, int i) {
    if (parent[i] == i) {
      return i;
    } else {
      return find(parent, parent[i]);
    }
  }

  union(List parent, List rank, int x, int y) {
    var xroot = find(parent, x);
    var yroot = find(parent, y);
    if (rank[xroot] < rank[yroot]) {
      parent[xroot] = yroot;
    } else if (rank[xroot] > rank[yroot]) {
      parent[yroot] = xroot;
    } else {
      parent[yroot] = xroot;
      rank[xroot] += 1;
    }
  }

  sort(List arr) {
    int n = arr.length;
    if (arr.length == 0) {
      n = 0;
    }
    for (int i = 1; i < n; ++i) {
      int key = arr[i][2];
      var key1 = arr[i];
      int j = i - 1;
      while (j >= 0 && arr[j][2] > key) {
        arr[j + 1] = arr[j];
        j = j - 1;
      }
      arr[j + 1] = key1;
    }
  }

  kruskalMST() {
    int max = 0;
    int i = 0;
    int e = 0;
    sort(graphM);
    var parent = [];
    var rank = [];

    for (int i = 0; i < this.graphM.length; i++) {
      for (int j = 0; j < 2; j++) {
        if (this.graphM[i][j] > max) {
          max = this.graphM[i][j];
        }
      }
    }
    max++;

    for (int k = 0; k < max; k++) {
      parent.add(k);
      rank.add(0);
    }

    while (e < max - 1) {
      int u = graphM[i][0];
      int v = graphM[i][1];
      int w = graphM[i][2];
      i = i + 1;
      int x = find(parent, u);
      int y = find(parent, v);
      if (x != y) {
        e = e + 1;
        result.add([u, v, w]);
        union(parent, rank, x, y);
      }
    }
  }
}

main(List<String> args) {
  List<List<int>> list = [
    [0, 1, 2],
    [1, 2, 3],
    [0, 3, 6],
    [1, 3, 8],
    [1, 4, 5],
    [2, 4, 7],
    [3, 4, 9],
  ];

  print('Sebelum : $list\n');

  Kruskal kruskal = Kruskal(list);
  kruskal.kruskalMST();
  List result = kruskal.getResult();

  print('Sesudah : $result\n');

  for (int i = 0; i < result.length; i++) {
    int u = result[i][0];
    int v = result[i][1];
    int w = result[i][2];
    print('$u -- $v == $w ');
  }
  int sum = 0;
  for (int i = 0; i < result.length; i++) {
    int temp = result[i][2];
    sum += temp;
  }
  print('\nPanjang Node: $sum');
}
