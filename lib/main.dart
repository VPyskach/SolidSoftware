import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertestapp/SparklingBackgroundPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Flutter test App",
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: SparklingBackgroundPage('Test App for Solid Software'),
    );
  }
}
