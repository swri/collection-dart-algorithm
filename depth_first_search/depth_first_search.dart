import 'dart:io';

class Graph {
  late int value;
  late List<List<int>> adj;

  Graph(int value) {
    this.value = value;
    this.adj = List.generate(value, (index) => []);
  }

  void addEdge(int v, int w) {
    adj[v].add(w);
  }

  void dfsUtil(int v, List<bool> visited) {
    visited[v] = true;
    print('$v ');

    for (var i in adj[v]) {
      int n = i;
      if (!visited[n]) {
        dfsUtil(n, visited);
      }
    }
  }

  void dfs(int v) {
    List<bool> visited = List.filled(value, false);
    dfsUtil(v, visited);
  }
}

main(List<String> args) {
  // Input: n = 4, e = 6
  // 0 -> 1, 0 -> 2, 1 -> 2, 2 -> 0, 2 -> 3, 3 -> 3
  // Output: DFS from vertex 1 : 1 2 0 3

  Graph g = Graph(4);
  g.addEdge(2, 0);
  g.addEdge(0, 2);
  g.addEdge(1, 2);
  g.addEdge(0, 1);
  g.addEdge(3, 3);
  g.addEdge(1, 3);
  int start = 2;

  // run depth first
  print('Following is Depth First Traversal from vertext $start');
  g.dfs(start);
}
