class Kruskal {
  late int e;
  List<List> graphM = [];
  List<List> result = [];

  getResult() {
    return result;
  }

  Kruskal(List<List> list) {
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
    int xroot = find(parent, x);
    int yroot = find(parent, y);
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
    for (int i = 1; i < n; ++i) {
      var key = arr[i][2];
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
    List parent = [];
    List rank = [];

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
    // print(graphM);

    while (e < max - 1) {
      int u = graphM[i][0];
      int v = graphM[i][1];
      var w = graphM[i][2];
      i = i + 1;

      int x = find(parent, u);
      int y = find(parent, v);
      // print('x: $x,y: $y');
      if (x != y) {
        e = e + 1;
        result.add([u, v, w]);
        union(parent, rank, x, y);
      }
      // print('parent $parent');
      // print('rank $rank');
      // print('result $result\n');
    }
  }
}

main(List<String> args) {
  //     10
  // 0--------1
  // | \ |
  // 6| 5\ |15
  // | \ |
  // 2--------3

  //1. Mengurutkan node weight yang paling kecil
  //2. pilih node weight paling kecil, nilai yang paling kecil akan di jadikan
  //parent and rank pada coding diatas diberikan union sebagai algoritma
  //pengecek apakah terjadi cycle
  //3. ulangi hingga nilai node terakhir habis

  List<List> list = [
    [0, 1, 11],
    [0, 2, 13],
    [0, 3, 13],
    [1, 4, 13],
    [1, 5, 8],
    [2, 3, 8],
    [2, 11, 15],
    [3, 11, 17],
    [4, 6, 6],
    [5, 20, 14],
    [5, 7, 11],
    [5, 8, 14],
    [6, 18, 6.5],
    [6, 19, 5],
    [7, 9, 3],
    [7, 20, 7],
    [8, 12, 35],
    [8, 10, 6],
    [9, 16, 7],
    [10, 13, 27],
    [10, 23, 4],
    [11, 12, 5],
    [12, 13, 6],
    [13, 14, 4],
    [14, 15, 12],
    [18, 6, 6.5],
    [18, 19, 9],
    [18, 22, 20],
    [19, 20, 21.5],
    [19, 21, 9],
    [23, 17, 8],
  ];

  print('Sebelum : $list\n');

  Kruskal kruskal = Kruskal(list);
  kruskal.kruskalMST();
  List result = kruskal.getResult();

  print('Sesudah : $result\n');

  for (int i = 0; i < result.length; i++) {
    int u = result[i][0];
    int v = result[i][1];
    var w = result[i][2];
    print('$u -- $v == $w ');
  }
  double sum = 0;
  for (int i = 0; i < result.length; i++) {
    var temp = result[i][2];
    sum += temp;
  }
  print('\nPanjang Node: $sum');
}
