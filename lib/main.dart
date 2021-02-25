import 'package:flutter/material.dart';

import 'components/header.dart';
import 'components/reduxsample.dart';
import 'components/start.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      home: Start(),
      routes: <String, WidgetBuilder>{
        '/start': (_) => new Start(),
        '/header': (_) => new Header(),
      },
    );

  }
}