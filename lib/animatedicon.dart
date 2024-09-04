import 'package:flutter/material.dart';

main() {
  runApp(Animatedicon());
}

class Animatedicon extends StatefulWidget {
  const Animatedicon({Key? key}) : super(key: key);

  @override
  _AnimatediconState createState() => _AnimatediconState();
}

class _AnimatediconState extends State<Animatedicon>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );
    controller.forward();
    controller.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedIcon(icon: AnimatedIcons.home_menu, progress: controller)
            ],
          ),
        ),
      ),
    );
  }
}
