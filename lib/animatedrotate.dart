import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Animatedrotate());
}

class Animatedrotate extends StatefulWidget {
  const Animatedrotate({Key? key}) : super(key: key);

  @override
  _AnimatedrotateState createState() => _AnimatedrotateState();
}

class _AnimatedrotateState extends State<Animatedrotate> {
  double rotate = 0.0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.all(50),
                child: AnimatedRotation(
                  turns: rotate,
                  duration: Duration(seconds: 2),
                  child: FlutterLogo(
                    size: 100,
                  ),
                ),
              ),
              ElevatedButton(
                child: Text('Rotate logo'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orangeAccent,
                ),
                onPressed: () {
                  setState(() => rotate += 1 / 4);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
