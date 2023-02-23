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
  static ValueNotifier<int> _value = ValueNotifier<int>(0);

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
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10)),
            Container(
              width: 300,
              height: 300,
              child: CustomPaint(
                painter: MyPainter(_value),
                child: Center(),
              ),
            ),
            Padding(padding: EdgeInsets.all(5)),
            ElevatedButton(
              child: Text(
                'Click',
                style: TextStyle(fontSize: 32),
              ),
              onPressed: () => _value.value++,
            )
          ],
        ),
      ),
    );
  }

}


class MyPainter extends CustomPainter {
  final ValueNotifier<int> _value;

  MyPainter(this._value);

  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint();
    p.style = PaintingStyle.fill;
    p.color = Color.fromARGB(50, 0, 255, 255);
    Rect r;
    for (var i = 0; i < _value.value; i++) {
      r = Rect.fromLTWH(10+i*20, 10+i*20, 100, 100);
      canvas.drawRect(r, p);
    }
    r = Rect.fromLTWH(0, 0, size.width, size.height);
    p.style = PaintingStyle.stroke;
    p.color = Color.fromARGB(255, 100, 100, 100);
    canvas.drawRect(r, p);
    if (_value.value > 10) _value.value = 0;
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}