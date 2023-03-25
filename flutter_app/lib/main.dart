import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/input.dart';
import 'package:flutter/services.dart';
import 'package:flame/components.dart';

void main() => runApp(MyApp());

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
      appBar: AppBar(
        title: Text('My App'),
      ),
      body: GameWidget(game: SampleGame()),
    );
  }
}

class SampleGame extends FlameGame with HasKeyboardHandlerComponents {

  @override
  Color backgroundColor() => const Color(0xffCCCCFF);

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(MySprite(Vector2(100, 100)));
  }
}

class MySprite extends SpriteComponent with KeyboardHandler {
  late Vector2 _position;
  late Vector2 _delta;

  MySprite(this._position): super();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    sprite = await Sprite.load('chara.png');
    position = _position;
    size = Vector2(100, 100);
    _delta = Vector2.zero();
  }

  @override
  void update(double delta) {
    position += _delta * delta * 100;
    super.update(delta);
  }

  @override
  bool onKeyEvent(
    RawKeyEvent event,
    Set<LogicalKeyboardKey> keysPressed,
  ) {
    if (event is RawKeyUpEvent) {
      _delta = Vector2.zero();
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowLeft)) {
      _delta.x = -1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowRight)) {
      _delta.x = 1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowUp)) {
      _delta.y = -1;
    }
    if (keysPressed.contains(LogicalKeyboardKey.arrowDown)) {
      _delta.y = 1;
    }

    return true;
  }
}