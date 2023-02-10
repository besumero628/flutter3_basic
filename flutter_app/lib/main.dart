import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Generated App',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF2196f3),
        accentColor: const Color(0xFF2196f3),
        canvasColor: const Color(0xFFfafafa),
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),

      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Container(
              color: Colors.blue,
              height: 120.0,
              child: const Center(
                child: const Center(
                  child: Text(
                    'One',
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 120.0,
              child: const Center(
                child: const Center(
                  child: Text(
                    'Two',
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 120.0,
              child: const Center(
                child: const Center(
                  child: Text(
                    'Three',
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 120.0,
              child: const Center(
                child: const Center(
                  child: Text(
                    'Four',
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 120.0,
              child: const Center(
                child: const Center(
                  child: Text(
                    'Five',
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 120.0,
              child: const Center(
                child: const Center(
                  child: Text(
                    'One',
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 120.0,
              child: const Center(
                child: const Center(
                  child: Text(
                    'Two',
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 120.0,
              child: const Center(
                child: const Center(
                  child: Text(
                    'Three',
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              height: 120.0,
              child: const Center(
                child: const Center(
                  child: Text(
                    'Four',
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.blue,
              height: 120.0,
              child: const Center(
                child: const Center(
                  child: Text(
                    'Five',
                    style: const TextStyle(fontSize: 32.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}