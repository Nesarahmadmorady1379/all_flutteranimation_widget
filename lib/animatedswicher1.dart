import 'package:flutter/material.dart';

main() {
  runApp(Animatedswicher1());
}

class Animatedswicher1 extends StatefulWidget {
  const Animatedswicher1({Key? key}) : super(key: key);

  @override
  _Animatedswicher1State createState() => _Animatedswicher1State();
}

class _Animatedswicher1State extends State<Animatedswicher1> {
  var child1 = Container(
    key: Key('one'),
    height: 100,
    width: 300,
    color: Colors.red,
  );
  var child2 = Container(
    key: Key('tow'),
    height: 300,
    width: 200,
    color: Colors.yellow,
  );
  var defaultchild;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedSwitcher(
              duration: Duration(seconds: 1),
              child: defaultchild,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    defaultchild = defaultchild == child1 ? child2 : child1;
                  });
                },
                child: Text('swich')),
          ],
        ),
      )),
    );
  }
}
