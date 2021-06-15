import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'grid.dart';
import 'algorithms.dart';
import 'value.dart';
import 'colors.dart';
import 'generate_algorithm.dart';

class Visualizer extends StatefulWidget {
  @override
  _VisualizerState createState() => _VisualizerState();
}

class _VisualizerState extends State<Visualizer> {
  bool isRunning = false;

  bool disabled1 = false;
  bool disabled2 = false;
  bool disabled3 = false;
  bool disabled4 = false;
  bool disabled5 = false;
  bool disabled6 = false;

  int selectedButton = 1;
  bool generationRunning = false;

  void setActiveButton(int i, BuildContext context) {
    switch (i) {
      case 1: //brush
        grid.isPanning = false;
        drawTool = true;
        setState(() {
          selectedButton = 1;
        });
        break;
      case 2: //eraser
        grid.isPanning = false;
        drawTool = false;
        setState(() {
          selectedButton = 2;
        });
        break;
      case 3: // pan
        grid.isPanning = true;
        setState(() {
          selectedButton = 3;
        });
        break;
      default:
    }
  }

  void disableBottomButtons() {
    setState(() {
      disabled1 = true;
      disabled2 = true;
      disabled3 = true;
      disabled4 = true;
      disabled5 = true;
      disabled6 = true;
    });
  }

  void enableBottomButtons() {
    setState(() {
      disabled1 = false;
      disabled2 = false;
      disabled3 = false;
      disabled4 = false;
      disabled5 = false;
      disabled6 = false;
    });
  }

  bool drawTool = true;

  Grid grid = Grid(60, 35, 16, 10, 16, 50, 16);

  @override
  Widget build(BuildContext context) {
    ValueChangeModel valueChange =
        Provider.of<ValueChangeModel>(context, listen: false);
    final snackBar = SnackBar(
      content: Text("Couldn't find path."),
      duration: Duration(milliseconds: 1400),
    );
    return SafeArea(
      child: Scaffold(
        backgroundColor: backgroundColor,
        body: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Selector<ValueChangeModel, Brush>(
              selector: (context, model) => model.selectedBrush,
              builder: (_, brush, __) {
                return grid.gridWidget(
                  onTapNode: (i, j) {
                    grid.clearPaths();
                    if (drawTool) {
                      if (brush == Brush.wall) {
                        grid.addNode(i, j, Brush.wall);
                      } else {
                        grid.hoverSpecialNode(i, j, brush);
                      }
                    } else {
                      grid.removeNode(i, j, 1);
                    }
                  },
                  onDragNode: (i, j, k, l, t) {
                    if (drawTool) {
                      if (brush != Brush.wall) {
                        grid.hoverSpecialNode(k, l, brush);
                      } else {
                        grid.addNode(k, l, brush);
                      }
                    } else {
                      grid.removeNode(k, l, 1);
                    }
                  },
                  onDragNodeEnd: () {
                    if (brush != Brush.wall && drawTool) {
                      grid.addSpecialNode(brush);
                    }
                  },
                );
              },
            ),
            SizedBox(width: 30.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Algoritma Dijkstra',
                    style: TextStyle(
                      color: secondaryPath,
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Consumer<ValueChangeModel>(builder: (_, model, __) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: secondaryPath,
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 0,
                          ),
                        ),
                        onPressed: isRunning
                            ? null
                            : () {
                                model.setActiveBrush(1);
                                setActiveButton(1, context);
                              },
                        child: Icon(Icons.crop_square_rounded,
                            color: Colors.white),
                      );
                    }),
                    SizedBox(width: 30),
                    Consumer<ValueChangeModel>(builder: (_, model, __) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: secondaryPath,
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 0,
                          ),
                        ),
                        onPressed: isRunning
                            ? null
                            : () {
                                model.setActiveBrush(2);
                                setActiveButton(1, context); //
                              },
                        child: Icon(Icons.location_on, color: Colors.white),
                      );
                    }),
                    SizedBox(width: 30),
                    Consumer<ValueChangeModel>(builder: (_, model, __) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: secondaryPath,
                          padding: EdgeInsets.symmetric(
                            vertical: 15,
                            horizontal: 0,
                          ),
                        ),
                        onPressed: isRunning
                            ? null
                            : () {
                                model.setActiveBrush(3);
                                setActiveButton(1, context);
                              },
                        child: Icon(Icons.gps_fixed, color: Colors.white),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: secondaryPath,
                        padding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 40),
                      ),
                      onPressed: isRunning
                          ? null
                          : () {
                              grid.clearBoard(onFinished: () {});
                            },
                      child: Row(
                        children: [
                          Text('Clear Board',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ),
                    SizedBox(width: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: secondaryPath,
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 0,
                        ),
                      ),
                      onPressed: isRunning
                          ? null
                          : () {
                              setActiveButton(2, context); //
                            },
                      child: Icon(
                        Icons.delete_sharp,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Consumer<ValueChangeModel>(builder: (_, model, __) {
                      return ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: secondaryPath,
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 18),
                        ),
                        onPressed: isRunning
                            ? null
                            : () {
                                setActiveButton(3, context);
                                setState(() {
                                  isRunning = true;
                                  generationRunning = true;
                                });
                                disableBottomButtons();
                                grid.clearPaths();
                                GenerateAlgorithms.visualize(
                                    gridd: grid.nodeTypes,
                                    stopCallback: () {
                                      return model.stop;
                                    },
                                    onShowCurrentNode: (i, j) {
                                      //grid.addNode(i, j, Brush.open);
                                      grid.putCurrentNode(i, j);
                                    },
                                    onRemoveWall: (i, j) {
                                      grid.removeNode(i, j, 1);
                                    },
                                    onShowWall: (i, j) {
                                      grid.addNode(i, j, Brush.wall);
                                    },
                                    speed: () {
                                      return model.speed;
                                    },
                                    onFinished: () {
                                      setState(() {
                                        isRunning = false;
                                        generationRunning = false;
                                      });
                                      enableBottomButtons();
                                    });
                              },
                        child: Row(
                          children: [
                            Text(
                              'Random Walls',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            PopupMenuButton<int>(
                              onSelected: (select) {
                                setState(() {});
                                model.setActiveAlgorithm(select, context);
                              },
                              child: Center(
                                  child: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Colors.white,
                              )),
                              itemBuilder: (context) => [
                                const PopupMenuItem<int>(
                                  value: 1,
                                  child: Text('Backtracker'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 2,
                                  child: Text('Random Walls'),
                                ),
                                const PopupMenuItem<int>(
                                  value: 3,
                                  child: Text('Recursive'),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Consumer<ValueChangeModel>(
                      builder: (_, model, __) {
                        return ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: secondaryPath,
                            padding: EdgeInsets.symmetric(
                                vertical: 18, horizontal: 45),
                          ),
                          onPressed: isRunning
                              ? null
                              : () {
                                  model.stop = false;
                                  setActiveButton(3, context);
                                  setState(() {
                                    isRunning = true;
                                  });
                                  grid.clearPaths();
                                  PathfindAlgorithms.visualize(
                                      gridd: grid.nodeTypes,
                                      startti: grid.starti,
                                      starttj: grid.startj,
                                      finishi: grid.finishi,
                                      finishj: grid.finishj,
                                      onShowClosedNode: (int i, int j) {
                                        grid.addNode(i, j, Brush.closed);
                                      },
                                      onShowOpenNode: (int i, int j) {
                                        grid.addNode(i, j, Brush.open);
                                      },
                                      speed: () {
                                        return model.speed;
                                      },
                                      onDrawPath: (Node lastNode, int c) {
                                        //operationModel.operations = c;
                                        if (model.stop) {
                                          setState(() {});
                                          enableBottomButtons();
                                          return true;
                                        }
                                        grid.drawPath2(lastNode);
                                        return false;
                                      },
                                      onDrawSecondPath: (Node lastNode, int c) {
                                        // operationModel.operations = c;
                                        if (model.stop) {
                                          setState(() {});
                                          enableBottomButtons();
                                          return true;
                                        }
                                        grid.drawSecondPath2(lastNode);
                                        return false;
                                      },
                                      onFinished: (pathFound) {
                                        setState(() {
                                          isRunning = false;
                                        });
                                        enableBottomButtons();
                                        if (!pathFound) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                        }
                                      });
                                },
                          child: Row(
                            children: [
                              Text(
                                'Visualizer ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 25),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: secondaryPath,
                        padding: EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 0,
                        ),
                      ),
                      onPressed: isRunning
                          ? () {
                              setState(() {});
                              isRunning = false;
                              valueChange.stop = true;
                            }
                          : null,
                      child: Icon(
                        Icons.pause_circle,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: secondaryPath,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(width: 8),
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: ternaryPath,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Visited',
                      style: TextStyle(
                        color: pathColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: pathColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Short Path',
                      style: TextStyle(
                        color: pathColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border.all(color: pathColor),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Wall',
                      style: TextStyle(
                        color: pathColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30),
                Row(
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: gridColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      'Unvisited',
                      style: TextStyle(
                        color: pathColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
