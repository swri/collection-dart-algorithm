import 'dart:async';

import 'dart:math' as math;

List<List<int>> grid;
List<List<Node>> nodes;

int x;
int y;

int endi = 0;
int endj = 0;

int starti = 0;
int startj = 0;

class Node {
  Node(this.i, this.j) {
    // take initialize
  }
  final int i;
  final int j;

  double f;
  double g = double.infinity;
  double h;

  Node parent;
  Node parent2;

  bool visited = false;

  List<Node> get neighbors {
    List<Node> neighbors = <Node>[];
    if (i > 0 && grid[i - 1][j] != 1) {
      //left
      neighbors.add(nodes[i - 1][j]);
    }
    if (i < x - 1 && grid[i + 1][j] != 1) {
      //right
      neighbors.add(nodes[i + 1][j]);
    }
    if (j > 0 && grid[i][j - 1] != 1) {
      //top
      neighbors.add(nodes[i][j - 1]);
    }
    if (j < y - 1 && grid[i][j + 1] != 1) {
      //bottom
      neighbors.add(nodes[i][j + 1]);
    }
    if (i > 0 &&
        j > 0 &&
        (grid[i - 1][j] == 0 || grid[i][j - 1] == 0) &&
        grid[i - 1][j - 1] != 1) {
      //topleft
      neighbors.add(nodes[i - 1][j - 1]);
    }
    if (i < x - 1 &&
        j > 0 &&
        (grid[i + 1][j] == 0 || grid[i][j - 1] == 0) &&
        grid[i + 1][j - 1] != 1) {
      //topright
      neighbors.add(nodes[i + 1][j - 1]);
    }
    if (i > 0 &&
        j < y - 1 &&
        (grid[i - 1][j] == 0 || grid[i][j + 1] == 0) &&
        grid[i - 1][j + 1] != 1) {
      //bottomleft
      neighbors.add(nodes[i - 1][j + 1]);
    }
    if (i < x - 1 &&
        j < y - 1 &&
        (grid[i + 1][j] == 0 || grid[i][j + 1] == 0) &&
        grid[i + 1][j + 1] != 1) {
      //bottomright
      neighbors.add(nodes[i + 1][j + 1]);
    }
    return neighbors;
  }
}

class PathfindAlgorithms {
  static void visualize(
      {List<List<int>> gridd,
      int startti,
      int starttj,
      int finishi,
      int finishj,
      Function(int i, int j) onShowClosedNode,
      Function(int i, int j) onShowOpenNode,
      bool Function(Node lastNode, int count) onDrawPath,
      bool Function(Node lastNode, int count) onDrawSecondPath,
      Function(bool pathFound) onFinished,
      int Function() speed}) {
    endi = finishi;
    endj = finishj;

    starti = startti;
    startj = starttj;

    x = gridd.length;
    y = gridd[0].length;

    grid = gridd;
    nodes = List.generate(x, (i) => List.generate(y, (j) => Node(i, j)));

    dijkstra(onShowClosedNode, onShowOpenNode, onFinished, onDrawPath, speed);
  }

  static void dijkstra(Function onShowClosedNode, Function onShowOpenNode,
      Function onFinished, Function onDrawPath, Function speed) async {
    int c = 0;

    List<Node> queue = <Node>[];

    Node startNode = nodes[starti][startj];
    startNode.g = 0;
    queue.add(startNode);

    int mils;

    while (queue.isNotEmpty) {
      int smallest = 0;
      for (int i = 0; i < queue.length; ++i) {
        if (queue[i].g < queue[smallest].g) {
          smallest = i;
        }
      }
      Node currentNode = queue[smallest];
      if (onDrawPath(currentNode, c)) {
        return;
      }

      queue.remove(currentNode);
      currentNode.visited = true;
      onShowClosedNode(currentNode.i, currentNode.j);
      for (Node neighbor in currentNode.neighbors) {
        double tentativeGScore = currentNode.g +
            distance(currentNode.i, currentNode.j, neighbor.i, neighbor.j);
        if (!neighbor.visited && tentativeGScore < neighbor.g) {
          c++;
          neighbor.parent = currentNode;
          neighbor.g = tentativeGScore;
          if (neighbor.i == endi && neighbor.j == endj) {
            onFinished(true);
            onDrawPath(neighbor, c);
            queue.clear();
            return;
          }
          queue.add(neighbor);
          onShowOpenNode(neighbor.i, neighbor.j);
        }
      }
      mils = speed();
      await Future.delayed(Duration(milliseconds: mils));
    }
    onFinished(false);
  }
}

const double d1 = 10;
const double d2 = 14;

double distance(int i, int j, int k, int l) {
  var dx = (i - k).abs();
  var dy = (j - l).abs();
  return d1 * (dx + dy) + (d2 - 2 * d1) * math.min(dx, dy);
}
