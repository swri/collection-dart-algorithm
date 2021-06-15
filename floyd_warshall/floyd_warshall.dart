const int v = 4;
const int iNF = 99999;

void floydWarshall(List<List<int>> graph) {
  List<List> dist = List.generate(v, (_) => List.filled(v, 0));

  for (int i = 0; i < v; i++) {
    for (int j = 0; j < v; j++) {
      dist[i][j] = graph[i][j];
    }
  }

  for (int k = 0; k < v; k++) {
    for (int i = 0; i < v; i++) {
      for (int j = 0; j < v; j++) {
        if (dist[i][j] > (dist[i][k] + dist[k][j]) &&
            (dist[k][j] != iNF && dist[i][k] != iNF))
          dist[i][j] = dist[i][k] + dist[k][j];
      }
    }
  }
  printSolution(dist);
}

void printSolution(List<List> dist) {
  print('''The following matrix shows the shortest 
distances between every pair of vertices\n''');

  for (var x in dist) {
    for (var i = 0; i < x.length; i++) {
      if (x[i] == iNF) {
        x[i] = "iNF";
      }
    }
    print('${x}');
  }
}

main() {
  /* Let us create the following weighted graph
            10
    (0)------->(3)
        |     /|\
    5 |     |
        |     | 1
    \|/     |
    (1)------->(2)
            3     */
  List<List<int>> graph = [
    [0, 1, 3, iNF, 1, 4],
    [1, 0, 1, iNF, 2, iNF],
    [3, 1, 0, 3, iNF, iNF],
    [iNF, iNF, 3, 0, 1, 2],
    [1, 2, iNF, 1, 0, 2],
    [4, iNF, iNF, 2, 2, 0]
  ];

  // Print the solution
  floydWarshall(graph);
}
