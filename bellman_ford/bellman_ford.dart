void bellmanFord(List<List<int>> graph, int v, int e, int src) {
  List<int> dis = List.generate(v, (index) => 0);
  for (int i = 0; i < v; i++) dis[i] = double.maxFinite.toInt();

  dis[src] = 0;
  for (int i = 0; i < v - 1; i++) {
    for (int j = 0; j < e; j++) {
      if (dis[graph[j][0]] != double.maxFinite.toInt() &&
          dis[graph[j][0]] + graph[j][2] < dis[graph[j][1]])
        dis[graph[j][1]] = dis[graph[j][0]] + graph[j][2];
    }
  }
  for (int i = 0; i < e; i++) {
    int x = graph[i][0];
    int y = graph[i][1];
    int weight = graph[i][2];
    if (dis[x] != double.maxFinite.toInt() && dis[x] + weight < dis[y])
      print('Graph contains negative weight cycle');
  }
  print('Vertex Distance from Source');
  for (int i = 0; i < v; i++) print('$i\t\t${dis[i]}');
}

main() {
  int v = 5; // Number of vertices in graph
  int e = 8; // Number of edges in graph

  // Every edge has three values (u, v, w) where
  // the edge is from vertex u to v. And weight
  // of the edge is w.

  List<List<int>> graph = [
    [0, 1, -1],
    [0, 2, 4],
    [1, 2, 3],
    [1, 3, 2],
    [1, 4, 2],
    [3, 2, 5],
    [3, 1, 1],
    [4, 3, -3]
  ];

  bellmanFord(graph, v, e, 0);
}
