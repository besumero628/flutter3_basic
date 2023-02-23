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

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this
    );
    animation = Tween<double>(begin: 0, end: pi*2).animate(controller)..addListener(() {
      setState(() {
      });
    });
    controller.repeat(reverse: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        title: Text(
          'App Name',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: MyPainter(animation.value),
                child: Center(),
              ),
            )
          ],
        ),
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