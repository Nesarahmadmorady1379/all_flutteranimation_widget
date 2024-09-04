import 'dart:math';

import 'package:flutter/material.dart';

main() {
  runApp(Poloygonal());
}

class Poloygonal extends StatefulWidget {
  const Poloygonal({Key? key}) : super(key: key);

  @override
  _PoloygonalState createState() => _PoloygonalState();
}

class _PoloygonalState extends State<Poloygonal> with TickerProviderStateMixin {
  late AnimationController _sidecontrolar;
  late Animation<int> _sideanimation;
  late AnimationController _radioucecontrolar;
  late Animation<double> _radiouceanimation;
  late AnimationController _rotationanimationcontroal;
  late Animation<double> _rotaionanimation;
  @override
  void initState() {
    super.initState();

    _sidecontrolar =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _sideanimation = IntTween(begin: 3, end: 10).animate(_sidecontrolar);
    _radioucecontrolar =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _radiouceanimation = Tween(begin: 20.0, end: 400.0)
        .chain(CurveTween(curve: Curves.bounceInOut))
        .animate(_radioucecontrolar);
    _rotationanimationcontroal =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
    _rotaionanimation = Tween(begin: 0.0, end: 2.0 * pi)
        .chain(CurveTween(curve: Curves.easeInOut))
        .animate(_rotationanimationcontroal);
  }

  @override
  void didChangeDependencies() {
    _sidecontrolar.repeat(reverse: true);
    _radioucecontrolar.repeat(reverse: true);
    _rotationanimationcontroal.repeat(reverse: true);
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _sidecontrolar.dispose();
    _radioucecontrolar.dispose();
    _rotationanimationcontroal.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: AnimatedBuilder(
            animation: Listenable.merge([
              _sidecontrolar,
              _radioucecontrolar,
              _rotationanimationcontroal
            ]),
            builder: (context, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..rotateX(_rotaionanimation.value)
                  ..rotateY(_rotaionanimation.value)
                  ..rotateZ(_rotaionanimation.value),
                child: CustomPaint(
                  painter: polygon(sides: _sideanimation.value),
                  child: SizedBox(
                    width: _radiouceanimation.value,
                    height: _radiouceanimation.value,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

class polygon extends CustomPainter {
  final int sides;
  polygon({required this.sides});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;
    final path = Path();
    final angale = (2 * pi) / sides;
    final angales = List.generate(sides, (index) => index * angale);
    final Radius = size.width / 2;
    final Center = Offset(size.width / 2, size.height / 2);
    path.moveTo(Center.dx + Radius * cos(0), Center.dy + Radius * sin(0));
    for (final angale in angales) {
      path.lineTo(
          Center.dx + Radius * cos(angale), Center.dy + Radius * sin(angale));
    }
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is polygon && oldDelegate.sides != sides;
  }
}
