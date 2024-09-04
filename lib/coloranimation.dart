import "dart:math";

import "package:flutter/material.dart";

main() {
  runApp(Coloranimation());
}

class Coloranimation extends StatefulWidget {
  const Coloranimation({Key? key}) : super(key: key);

  @override
  _ColoranimationState createState() => _ColoranimationState();
}

class _ColoranimationState extends State<Coloranimation> {
  var _color = getrandomcolor();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: ClipPath(
            clipper: circalclipper(),
            child: TweenAnimationBuilder(
              tween: ColorTween(begin: getrandomcolor(), end: _color),
              duration: Duration(seconds: 1),
              onEnd: () {
                setState(() {
                  _color = getrandomcolor();
                });
              },
              child: Container(
                color: Colors.red,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
              ),
              builder: (context, Color? color, child) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(color!, BlendMode.srcATop),
                  child: child,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

getrandomcolor() {
  Random r = Random();
  return Color.fromARGB(
    r.nextInt(255),
    r.nextInt(255),
    r.nextInt(255),
    r.nextInt(255),
  );
}

class circalclipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2),
        radius: size.width / 2);
    path.addOval(rect);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<dynamic> oldClipper) {
    return false;
  }
}
