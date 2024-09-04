import 'dart:math' as math;

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Tweenanimationbuilder());
}

Color getrandomcolor() => Color.fromARGB(
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextInt(255),
      math.Random().nextInt(255),
    );

class Tweenanimationbuilder extends StatefulWidget {
  @override
  _TweenanimationbuilderState createState() => _TweenanimationbuilderState();
}

class _TweenanimationbuilderState extends State<Tweenanimationbuilder>
    with TickerProviderStateMixin {
  var _gradient = LinearGradient(
    colors: [
      getrandomcolor(),
      getrandomcolor(),
      getrandomcolor(),
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 200,
            width: 200,
            decoration: BoxDecoration(
              gradient: _gradient,
            ),
          ),
        ),
      ),
    );
  }
}
