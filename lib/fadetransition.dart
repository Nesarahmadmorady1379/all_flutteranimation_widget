import 'package:flutter/material.dart';

main() {
  runApp(Fadetransition());
}

class Fadetransition extends StatefulWidget {
  const Fadetransition({Key? key}) : super(key: key);

  @override
  _FadetransitionState createState() => _FadetransitionState();
}

class _FadetransitionState extends State<Fadetransition>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    controller.forward();
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
              child: Column(
        children: [
          FadeTransition(
            opacity: controller,
            child: Container(
              height: 100,
              width: 100,
              color: Colors.blue,
            ),
          )
        ],
      ))),
    );
  }
}
