import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'value.dart';
import 'visualizer_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: ValueChangeModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: Visualizer(),
      ),
    );
  }
}
