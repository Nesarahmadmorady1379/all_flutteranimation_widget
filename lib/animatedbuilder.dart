import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(Animatedbuilder());
}

class Animatedbuilder extends StatefulWidget {
  const Animatedbuilder({Key? key}) : super(key: key);

  @override
  _AnimatedbuilderState createState() => _AnimatedbuilderState();
}

class _AnimatedbuilderState extends State<Animatedbuilder>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AnimationController _boxcontrolar;
  late Animation<double> _boxanimation;
  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _animation = Tween<double>(begin: 0.0, end: 2.0 * pi).animate(_controller);

    _controller.repeat();
    _boxcontrolar =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _boxanimation = Tween<double>(begin: 0.0, end: 2.0 * pi).animate(
        CurvedAnimation(parent: _boxcontrolar, curve: Curves.easeInCirc));
  }

  @override
  void dispose() {
    _controller.dispose();
    _boxcontrolar.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: _controller,
            builder: (context, child) => Transform(
              alignment: Alignment.center,
              transform: Matrix4.identity()..rotateZ(_animation.value),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.blue[700],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
