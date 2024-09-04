import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Animatedswicher());
}

class Animatedswicher extends StatefulWidget {
  const Animatedswicher({Key? key}) : super(key: key);

  @override
  _AnimatedswicherState createState() => _AnimatedswicherState();
}

class _AnimatedswicherState extends State<Animatedswicher> {
  var _number = 1;
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
                child: Text(
                  '$_number',
                  style: TextStyle(fontSize: 40),
                  key: ValueKey(_number),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _number++;
                    });
                  },
                  child: Text('add')),
            ],
          ),
        ),
      ),
    );
  }
}
