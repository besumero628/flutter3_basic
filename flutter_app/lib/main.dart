import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generated App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff2196f3),
        canvasColor: const Color(0xfffafafa),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'App Name',
          style: TextStyle(
            fontSize: 30.0
          ),
        ),
      ),
      body: Container(
        child: CustomPaint(
          painter: MyPainter(),
        ),
      ),
    );
  }
}

class MyPainter extends CustomPainter {

  @override
  void paint(Canvas canvas, Size size) {
    Path path = Path();
    Rect r = Rect.fromLTWH(50.0, 50.0, 75.0, 75.0);
    path.addOval(r);
    r = Rect.fromLTWH(75.0, 75.0, 125.0, 125.0);
    path.addOval(r);
    r = Rect.fromLTWH(125.0, 125.0, 175.0, 175.0);
    path.addOval(r);

    canvas.save();

    Paint p = Paint();
    p.color = Color.fromARGB(150, 255, 0, 0);
    p.style = PaintingStyle.fill;
    canvas.drawPath(path, p);

    canvas.translate(0.0, 100.0);
    p.color = Color.fromARGB(150, 0, 0, 255);
    canvas.drawPath(path, p);

    p.color = Color.fromARGB(150, 0, 255, 0);
    canvas.rotate(-0.5 * pi);
    canvas.translate(-500, 50.0);
    canvas.scale(1 * 1.5);
    canvas.drawPath(path, p);

    canvas.restore();
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}