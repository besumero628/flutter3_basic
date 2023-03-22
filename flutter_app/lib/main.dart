import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Genarated App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xff2196f3),
        canvasColor: const Color(0xfffafafa),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _controller = TextEditingController();
  static const host = 'baconipsum.com';
  static const path = '/api/?type=meat-and-filler&paras=1&format=text';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            const Text(
              'INTERNET ACCESS',
              style: TextStyle(
                fontSize: 32,
                fontWeight: ui.FontWeight.w500
              ),
            ),
            const Padding(padding: EdgeInsets.all(10.0)),
            TextField(
              controller: _controller,
              style: const TextStyle(fontSize: 24),
              minLines: 1,
              maxLines: 5,
            ),
            Padding(padding: EdgeInsets.all(10.0)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const  Icon(Icons.open_in_new),
        onPressed: () {
          getData();
          showDialog(
            context: context, 
            builder: (BuildContext context) => const  AlertDialog(
              title: Text("loaded!"),
              content: Text("get context from URI"),
            )
          );
        },
      ),
    );
  }

  void getData() async {
    var http = await HttpClient();
    HttpClientRequest request = await http.get(host, 80, path);
    HttpClientResponse response = await request.close();
    final value = await response.transform(utf8.decoder).join();
    _controller.text = value;
  }
}