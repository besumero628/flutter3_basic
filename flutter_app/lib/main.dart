import 'package:flutter/material.dart';

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
      initialRoute: '/',
      routes: {
        '/': (context) => FirstScreen(),
        '/second':(context) => SecondScreen('Second'),
        '/third':(context) => SecondScreen('Third'), 
      },
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: const Text(
          'Home Screen',
          style: const TextStyle(fontSize: 32.0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'home',
            icon: const Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'next',
            icon: const Icon(Icons.navigate_next),
          )
        ],
        onTap: (int value) => {
          if (value==1) Navigator.pushNamed(context, '/second')
        },
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  final String _value;
  SecondScreen(this._value);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next"),
      ),
      body: Center(
        child: Text(
          '"$_value" Screen',
          style: const TextStyle(fontSize: 32.0),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            label: 'prev',
            icon: const Icon(Icons.navigate_before),
          ),
          BottomNavigationBarItem(
            label: '?',
            icon: const Icon(Icons.android),
          ),
        ],
        onTap: (int value) {
          if (value == 0) {
            Navigator.pop(context);
          };
          if (value == 1) {
            Navigator.pushNamed(context, '/third');
          }
        },
      ),
    );
  }
}