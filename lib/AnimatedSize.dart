import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(AnimatedSize());
}

class AnimatedSize extends StatefulWidget {
  const AnimatedSize({Key? key}) : super(key: key);

  @override
  _AnimatedSizeState createState() => _AnimatedSizeState();
}

class _AnimatedSizeState extends State<AnimatedSize> {
  double _size = 300;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: GestureDetector(
          onTap: () {
            setState(() {
              _size = _size == 300 ? 100 : 300;
            });
          },
          child: Container(
            color: Colors.white,
          ),
        ),
      )),
    );
  }
}
