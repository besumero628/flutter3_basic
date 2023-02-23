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
  static List<Offset> _points = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text('App Name', style: TextStyle(fontSize: 30.0),),
      ),
      body: Center(
        child: Listener(
          onPointerDown: _addPoint,
          child: CustomPaint(
            painter: MyPainter(_points),
            child: Center(),
          ),
        ),
      ),
    );
  }

  void _addPoint(PointerDownEvent event) {
    setState(() {
      _points.add(event.localPosition);
    });
  }
}

class MyPainter extends CustomPainter {
  final List<Offset> _points;

  MyPainter(this._points);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(100, 0, 200, 100);
    for (var pos in _points) {
      Rect r = Rect.fromLTWH(pos.dx - 25, pos.dy -25, 50.0, 50.0);
      canvas.drawOval(r, p);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}