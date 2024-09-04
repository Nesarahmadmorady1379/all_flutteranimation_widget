import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(Animatedcrossfade());
}

class Animatedcrossfade extends StatefulWidget {
  const Animatedcrossfade({Key? key}) : super(key: key);

  @override
  _AnimatedcrossfadeState createState() => _AnimatedcrossfadeState();
}

class _AnimatedcrossfadeState extends State<Animatedcrossfade> {
  bool _bool = true;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(
                width: double.infinity,
                height: 150,
              ),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _bool = !_bool;
                    });
                  },
                  child: Text('swich')),
              AnimatedCrossFade(
                  firstChild: (Icon(
                    Icons.home,
                    size: 100,
                    color: Colors.pink,
                  )),
                  secondChild: (Icon(
                    Icons.phone,
                    size: 100,
                    color: Colors.red,
                  )),
                  crossFadeState: _bool
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,
                  duration: Duration(seconds: 1)),
            ],
          ),
        ),
      ),
    );
  }
}
