import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> with TickerProviderStateMixin {
  bool isplay = false;
  late AnimationController _controller = AnimationController(
    duration: Duration(seconds: 2),
    vsync: this,
  )..repeat();
  @override
  void dispse() {
    _controller.dispose();
    super.dispose();
  }

//animated text data types
  bool first = true;
  double fontsize = 60;
//all other animated
  var size = 50.0;
  var color = const Color.fromARGB(255, 184, 31, 31);
  double opc = 1.0;
  var padding = 10.0;
  bool selected = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Random r = Random();
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ListView(children: [
            Column(
              children: [
                AnimatedContainer(
                  duration: const Duration(seconds: 2),
                  height: size,
                  width: size,
                  color: color,
                  child: const Text('this is animated container'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            size = size + 20;
                            color = Color.fromARGB(r.nextInt(244),
                                r.nextInt(244), r.nextInt(244), r.nextInt(244));
                          });
                        },
                        child: const Text('increase ')),
                    ElevatedButton(
                        onPressed: () {
                          setState(() {
                            size = size - 20;
                            color = Color.fromARGB(r.nextInt(244),
                                r.nextInt(244), r.nextInt(244), r.nextInt(244));
                          });
                        },
                        child: const Text('decrees ')),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                AnimatedOpacity(
                  opacity: opc,
                  duration: const Duration(seconds: 1),
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        opc = opc == 0 ? 1.0 : 0.0;
                      });
                    },
                    child: Text('fade logo')),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Column(
              children: [
                AnimatedPadding(
                  padding: EdgeInsets.all(padding),
                  duration: const Duration(seconds: 2),
                  child: Container(
                    height: size,
                    width: size,
                    color: Colors.blue,
                    child: const Icon(
                      Icons.home,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    padding = padding + 10;
                  });
                },
                child: const Text('cheack')),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: Container(
                    height: 150,
                    width: 150,
                    color: const Color.fromARGB(255, 197, 151, 148),
                    child: AnimatedAlign(
                      alignment:
                          selected ? Alignment.topRight : Alignment.bottomLeft,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastEaseInToSlowEaseOut,
                      child: FlutterLogo(
                        size: 50.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                AnimatedBuilder(
                    animation: _controller,
                    child: FlutterLogo(
                      size: 100.0,
                    ),
                    builder: (BuildContext context, Widget? child) {
                      return Transform.rotate(
                        angle: _controller.value * 2.0 * pi,
                        child: child,
                      );
                    }),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selected = !selected;
                    });
                  },
                  child: AnimatedContainer(
                    height: selected ? 200.0 : 100.0,
                    width: selected ? 100.0 : 200.0,
                    alignment:
                        selected ? Alignment.center : Alignment.topCenter,
                    color: selected
                        ? Color.fromARGB(
                            r.nextInt(254),
                            r.nextInt(254),
                            r.nextInt(254),
                            r.nextInt(254),
                          )
                        : Color.fromARGB(r.nextInt(244), r.nextInt(244),
                            r.nextInt(244), r.nextInt(244)),
                    duration: Duration(seconds: 2),
                    curve: Curves.fastOutSlowIn,
                    child: Icon(Icons.alarm),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                SizedBox(
                  height: 120,
                  child: AnimatedDefaultTextStyle(
                      child: Text(
                        "flutter",
                      ),
                      style: TextStyle(
                        fontSize: fontsize,
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                      duration: Duration(seconds: 2)),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        fontsize = first ? 90 : 60;
                        color = first ? Colors.blue : Colors.red;
                        first = !first;
                      });
                    },
                    child: Text('Swich'))
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    if (isplay == false) {
                      _controller.forward();
                      isplay = true;
                    } else {
                      _controller.reverse();
                      isplay = false;
                    }
                  },
                  child: AnimatedIcon(
                    icon: AnimatedIcons.arrow_menu,
                    progress: _controller,
                    size: 100,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container()
          ]),
        ),
      ),
    );
  }
}
