class Prim {
  int intMax = double.maxFinite.toInt();
  late int v;
  late List graph;
  var result = [];
  getResult() {
    return result;
  }

  Prim(int vertice, List list) {
    this.v = vertice;
    this.graph = list;
  }

  printMST(var parent) {
    for (int i = 1; i < v; i++) {
      int u = parent[i];
      int v = i;
      int w = graph[i][parent[i]];
      result.add([u, v, w]);
      print('$u -- $v == $w ');
    }
  }

  minKey(var key, var mstSet) {
    var min = intMax;
    var minIndex;
    for (int i = 0; i < v; i++) {
      if (key[i] < min && mstSet[i] == false) {
        min = key[i];
        minIndex = i;
      }
    }
    return minIndex;
  }

  primMST() {
    var key = List.filled(this.v, intMax);
    var parent = List.filled(this.v, 0);
    key[0] = 0;
    var mstSet = List.filled(this.v, false);
    parent[0] = -1;
    for (int j = 0; j < this.v; j++) {
      var u = minKey(key, mstSet);
      mstSet[u] = true;
      for (int v = 0; v < this.v; v++) {
        if (graph[u][v] > 0 && mstSet[v] == false && key[v] > graph[u][v]) {
          key[v] = graph[u][v];
          parent[v] = u;
        }
      }
    }
    printMST(parent);
  }
}

main(List<String> args) {
  /* Let us create the following graph
      2   3
  (0)--(1)--(2)
  | / \ |
  6| 8/ \5 |7
  | /     \ |
  (3)-------(4)
  9       */

  List<List<int>> list = [
    [0, 2, 0, 6, 0],
    [2, 0, 3, 8, 5],
    [0, 3, 0, 0, 7],
    [6, 8, 0, 0, 9],
    [0, 5, 7, 9, 0],
  ];
  int result = 0;
  List<int> max = list[0];
  result = max.length;

  Prim prim = Prim(result, list);
  prim.primMST();
}
