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

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  bool flg = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'App Name',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              color: flg ? Colors.red : Colors.yellow,
              width: flg ? 100: 300,
              height: flg ? 300 : 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            flg = !flg;
          });
        },
        child: const Icon(Icons.star),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  final double value;

  MyPainter(this.value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    canvas.save();

    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(100, 255, 0, 255);
    Rect r = Rect.fromLTWH(0, 0, 250, 250);
    canvas.translate(150, 250);
    canvas.rotate(value);
    canvas.translate(-125, -125);
    canvas.drawRect(r, p);

    canvas.restore();
    p.style = PaintingStyle.stroke;
    p.strokeWidth = 25;
    p.color = Color.fromARGB(100, 0, 255, 255);
    r = Rect.fromLTWH(0, 0, 250, 250);
    canvas.translate(150, 250);
    canvas.rotate(value * -1);
    canvas.translate(-125, -125);
    canvas.drawRect(r, p);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
