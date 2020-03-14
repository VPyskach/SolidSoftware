import 'dart:math';
import 'dart:developer' as dev;

import 'package:flutter/material.dart';

class SparklingBackgroundPage extends StatefulWidget {
  SparklingBackgroundPage(this.title);

  final String title;

  @override
  _SparklingBackgroundPageState createState() =>
      _SparklingBackgroundPageState();
}

class _SparklingBackgroundPageState extends State<SparklingBackgroundPage> {
  final String TAG = "_SparklingBackgroundPageState";
  final _random = Random();
  Color _textColor;
  Color _backgroundColor;
  bool _showAppBar;

  void changeBackgroundColor() {
    _textColor = getRandomTextColor();
    _backgroundColor = getRandomBackgroundColor();
    dev.log("text color: " + _textColor.value.toString(), name: TAG);
    dev.log("background color: " + _backgroundColor.value.toString(),
        name: TAG);
  }

  void onBackgroundTap() {
    setState(() {
      changeBackgroundColor();
      _showAppBar = false;
    });
  }

  void onBackgroundSwipeDown() {
    setState(() {
      changeBackgroundColor();
      _showAppBar = true;
    });
  }

  @override
  void initState() {
    changeBackgroundColor();
    _showAppBar = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
//      appBar: _showAppBar
//          ? AppBar(
//              title: Text(widget.title),
//            )
//          : null,
      body: InkWell(
        onTap: onBackgroundTap,
//        onTapDown: (details) {
//          onBackgroundSwipeDown;
//        },
        child: Container(
          alignment: Alignment.center,
          child: Text(
            'Hey there',
            style: TextStyle(
                fontSize: 40.0,
                color: _textColor,
                fontWeight: FontWeight.bold,
                decoration: TextDecoration.underline,
                decorationColor: Colors.red,
                decorationStyle: TextDecorationStyle.solid,
                shadows: [
                  Shadow(
                    blurRadius: 5.0,
                    color: Colors.red,
                    offset: Offset(2.0, 2.0),
                  )
                ]),
          ),
        ),
      ),
      backgroundColor: _backgroundColor,
    );
  }

  Color getRandomTextColor() =>
      Colors.primaries[_random.nextInt(Colors.primaries.length)];

  Color getRandomBackgroundColor() => Color(_random.nextInt(0xFFFFFFFF));
}
