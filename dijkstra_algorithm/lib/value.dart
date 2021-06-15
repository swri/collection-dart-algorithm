import 'package:flutter/material.dart';

import 'grid.dart';

class ValueChangeModel extends ChangeNotifier {
  int _speed = 0;

  int get speed => _speed;

  set speed(value) {
    _speed = value;
    notifyListeners();
  }

  bool _stop = false;

  bool get stop => _stop;

  set stop(value) {
    _stop = value;
    notifyListeners();
  }

  Color brushColor1 = Colors.orangeAccent;
  Color brushColor2 = Color(0xFF2E2E2E);
  Color brushColor3 = Color(0xFF2E2E2E);
  Brush selectedBrush = Brush.wall;

  GridGenerationFunction selectedAlg = GridGenerationFunction.recursive;

  void setActiveBrush(int i) {
    switch (i) {
      case 1: //wall
        brushColor1 = Colors.orangeAccent;
        brushColor2 = Color(0xFF2E2E2E);
        brushColor3 = Color(0xFF2E2E2E);
        selectedBrush = Brush.wall;
        notifyListeners();
        break;
      case 2: //start
        brushColor1 = Color(0xFF2E2E2E);
        brushColor2 = Colors.orangeAccent;
        brushColor3 = Color(0xFF2E2E2E);
        selectedBrush = Brush.start;
        notifyListeners();
        break;
      case 3: //finish
        brushColor1 = Color(0xFF2E2E2E);
        brushColor2 = Color(0xFF2E2E2E);
        brushColor3 = Colors.orangeAccent;
        selectedBrush = Brush.finish;
        notifyListeners();
        break;
      default:
    }
  }

  void setActiveAlgorithm(int i, BuildContext context) {
    switch (i) {
      case 1: //maze
        selectedAlg = GridGenerationFunction.backtracker;
        notifyListeners();
        break;
      case 2: //random
        selectedAlg = GridGenerationFunction.random;
        notifyListeners();
        break;
      case 3: //recursive
        selectedAlg = GridGenerationFunction.recursive;
        notifyListeners();
        break;
      default:
    }
  }
}
