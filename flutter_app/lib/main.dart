import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'dart:convert';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

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
           addDoc();
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

  @override
  void initState() {
    super.initState();
    fire();
  }

  void addDoc() async {
    var msg = _controller.text;
    final input = msg.split(',');
    final data = {
      'name': input[0],
      'mail': input[1],
      'age': input[2]
    };
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('mydata').add(data);
    fire();
  }

  void fire() async {
    var msg = _controller.text;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final snapshot = await firestore.collection('mydata')
      .orderBy('name', descending: false)
      .get();

    snapshot.docChanges.forEach((element) {
      final name = element.doc.get('name');
      final mail = element.doc.get('mail');
      final age = element.doc.get('age');
      msg += "\n${name} (${age}) <${mail}>";
    });

    _controller.text = msg;
  }
}