import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Main());
}

class Main extends StatefulWidget {
  const Main({Key? key}) : super(key: key);

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            child: Stack(children: [
              AnimatedPositioned(
                  width: selected ? 200.0 : 50.0,
                  height: selected ? 50.0 : 200.0,
                  top: selected ? 50.0 : 150.0,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selected = !selected;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.orangeAccent,
                          borderRadius: BorderRadius.circular(25)),
                    ),
                  ),
                  duration: Duration(seconds: 1)),
            ]),
          ),
        ),
      ),
    );
  }
}
